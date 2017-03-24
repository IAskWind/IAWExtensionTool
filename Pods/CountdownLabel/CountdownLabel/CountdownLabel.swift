//
//  CountdownLabel.swift
//  CountdownLabel
//
//  Created by suzuki keishi on 2016/01/06.
//  Copyright © 2016 suzuki_keishi. All rights reserved.
//

import UIKit

@objc public protocol CountdownLabelDelegate {
    @objc optional func countdownStarted()
    @objc optional func countdownPaused()
    @objc optional func countdownFinished()
    @objc optional func countdownCancelled()
    @objc optional func countingAt(timeCounted: TimeInterval, timeRemaining: TimeInterval)
}

public extension TimeInterval {
    var int: Int {
        return Int(self)
    }
}

open class CountdownLabel: LTMorphingLabel {
    
    public typealias CountdownCompletion = () -> ()?
    public typealias CountdownExecution = () -> ()
    fileprivate let defaultFireInterval = 1.0
    fileprivate let date1970 = Date(timeIntervalSince1970: 0)
    
    // conputed property
    open var dateFormatter: DateFormatter {
        let df = DateFormatter()
        df.locale = Locale.current
        df.timeZone = TimeZone(identifier: "GMT")
        df.dateFormat = timeFormat
        return df
    }
    
    open var timeCounted: TimeInterval {
        let timeCounted = Date().timeIntervalSince(fromDate)
        return round(timeCounted < 0 ? 0 : timeCounted)
    }
    
    open var timeRemaining: TimeInterval {
        return round(currentTime) - timeCounted
    }
    
    open var isPaused: Bool {
        return paused
    }
    
    open var isCounting: Bool {
        return counting
    }
    
    open var isFinished: Bool {
        return finished
    }
    
    open weak var countdownDelegate: CountdownLabelDelegate?
    
    // user settings
    open var animationType: CountdownEffect? {
        didSet {
            if let effect = animationType?.toLTMorphing() {
                morphingEffect = effect
                morphingEnabled = true
            } else {
                morphingEnabled = false
            }
        }
    }
    open var timeFormat = "HH:mm:ss"
    open var thens = [TimeInterval: CountdownExecution]()
    open var countdownAttributedText: CountdownAttributedText! {
        didSet {
            range = (countdownAttributedText.text as NSString).range(of: countdownAttributedText.replacement)
        }
    }
    
    fileprivate var completion: CountdownCompletion?
    fileprivate var fromDate: Date = Date()
    fileprivate var currentDate: Date = Date()
    fileprivate var currentTime: TimeInterval = 0
    fileprivate var diffDate: Date!
    fileprivate var targetTime: TimeInterval = 0
    fileprivate var pausedDate: Date!
    fileprivate var range: NSRange!
    fileprivate var timer: Timer!
    
    fileprivate var counting: Bool = false
    fileprivate var endOfTimer: Bool {
        return timeCounted >= currentTime
    }
    fileprivate var finished: Bool = false {
        didSet {
            if finished {
                paused = false
                counting = false
            }
        }
    }
    fileprivate var paused: Bool = false
    
    // MARK: - Initialize
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    public override required init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public convenience init(frame: CGRect, minutes: TimeInterval) {
        self.init(frame: frame)
        setCountDownTime(minutes)
    }
    
    public convenience init(frame: CGRect, date: Date) {
        self.init(frame: frame)
        setCountDownDate(date)
    }
    
    public convenience init(frame: CGRect, fromDate: Date, targetDate: Date) {
        self.init(frame: frame)
        setCountDownDate(fromDate, targetDate: targetDate)
    }
    
    deinit {
        dispose()
    }
    
    // MARK: - Setter Methods
    open func setCountDownTime(_ minutes: TimeInterval) {
        setCountDownTime(Date(), minutes: minutes)
    }
    
    open func setCountDownTime(_ fromDate: Date, minutes: TimeInterval) {
        self.fromDate = fromDate
        
        targetTime = minutes
        currentTime = minutes
        diffDate = date1970.addingTimeInterval(minutes)
        
        updateLabel()
    }
    
    open func setCountDownDate(_ targetDate: Date) {
        setCountDownDate(Date(), targetDate: targetDate)
    }
    
    open func setCountDownDate(_ fromDate: Date, targetDate: Date) {
        self.fromDate = fromDate
        
        targetTime = targetDate.timeIntervalSince(fromDate)
        currentTime = targetDate.timeIntervalSince(fromDate) 
        diffDate = date1970.addingTimeInterval(targetTime)
        
        updateLabel()
    }
    
    // MARK: - Update
    func updateLabel() {
        // delegate
        countdownDelegate?.countingAt?(timeCounted: timeCounted, timeRemaining: timeRemaining)
        
        // then function execute if needed
        thens.forEach { k, v in
            if k.int == timeRemaining.int {
                v()
                thens[k] = nil
            }
        }
        
        // update text
        updateText()
        
        // if end of timer
        if endOfTimer {
            text = dateFormatter.string(from: date1970.addingTimeInterval(0))
            countdownDelegate?.countdownFinished?()
            dispose()
            completion?()
        }
    }
}

// MARK: - Public
public extension CountdownLabel {
    func start(_ completion: ( () -> () )? = nil) {
        if !isPaused {
            // current date should be setted at the time of the counter's starting, or the time will be wrong (just a few seconds) after the first time of pausing.
            currentDate = Date()
        }
        
        // pause status check
        updatePauseStatusIfNeeded()
        
        // create timer
        updateTimer()
        
        // fire!
        timer.fire()
        
        // set completion if needed
        completion?()
        
        // set delegate
        countdownDelegate?.countdownStarted?()
    }
    
    func pause(_ completion: (() -> ())? = nil) {
        if paused {
            return
        }
        
        // invalidate timer
        disposeTimer()
        
        // stop counting
        counting = false
        paused = true
        
        // reset
        pausedDate = Date()
        
        // set completion if needed
        completion?()
        
        // set delegate
        countdownDelegate?.countdownPaused?()
    }
    
    func cancel(_ completion: (() -> ())? = nil) {
        text = dateFormatter.string(from: date1970.addingTimeInterval(0))
        dispose()
        
        // set completion if needed
        completion?()
        
        // set delegate
        countdownDelegate?.countdownCancelled?()
    }
    
    func addTime(_ time: TimeInterval) {
        currentTime = time + currentTime
        diffDate = date1970.addingTimeInterval(currentTime)
        
        updateLabel()
    }
    
    func then(_ targetTime: TimeInterval, completion: @escaping () -> ()) -> Self {
        let t = targetTime - (targetTime - targetTime)
        guard t > 0 else {
            return self
        }
        
        thens[t] = completion
        return self
    }
}

// MARK: - private
private extension CountdownLabel {
    func setup() {
        morphingEnabled = false
    }
    
    func updateText() {
        guard diffDate != nil else { return }

        // if time is before start
        let formattedText = timeCounted < 0
            ? dateFormatter.string(from: date1970.addingTimeInterval(0))
            : dateFormatter.string(from: diffDate.addingTimeInterval(round(timeCounted * -1)))
        
        if let countdownAttributedText = countdownAttributedText {
            let attrTextInRange = NSAttributedString(string: formattedText, attributes: countdownAttributedText.attributes)
            let attributedString = NSMutableAttributedString(string: countdownAttributedText.text)
            attributedString.replaceCharacters(in: range, with: attrTextInRange)
            
            attributedText = attributedString
            text = attributedString.string
        } else {
            text = formattedText
        }
        setNeedsDisplay()
    }
    
    func updatePauseStatusIfNeeded() {
        guard paused else {
            return
        }
        // change date
        let pastedTime = pausedDate.timeIntervalSince(currentDate)
        currentDate = Date().addingTimeInterval(-pastedTime)
        fromDate = currentDate
        
        // reset pause
        pausedDate = nil
        paused = false
    }
    
    func updateTimer() {
        disposeTimer()
        
        // create
        timer = Timer.scheduledTimer(timeInterval: defaultFireInterval,
                                                       target: self,
                                                       selector: #selector(updateLabel),
                                                       userInfo: nil,
                                                       repeats: true)
        
        // register to NSrunloop
        RunLoop.current.add(timer, forMode: RunLoopMode.commonModes)
        counting = true
    }
    
    func disposeTimer() {
        if timer != nil {
            timer.invalidate()
            timer = nil
        }
    }
    
    func dispose() {
        // reset
        pausedDate = nil
        
        // invalidate timer
        disposeTimer()
        
        // stop counting
        finished = true
    }
}

public enum CountdownEffect {
    case anvil
    case burn
    case evaporate
    case fall
    case none
    case pixelate
    case scale
    case sparkle
    
    func toLTMorphing() -> LTMorphingEffect? {
        switch self {
        case .anvil     : return .anvil
        case .burn      : return .burn
        case .evaporate : return .evaporate
        case .fall      : return .fall
        case .none      : return nil
        case .pixelate  : return .pixelate
        case .scale     : return .scale
        case .sparkle   : return .sparkle
        }
    }
}

open class CountdownAttributedText: NSObject {
    fileprivate let text: String
    fileprivate let replacement: String
    fileprivate let attributes: [String: AnyObject]?
   
    public init(text: String, replacement: String, attributes: [String: AnyObject]? = nil) {
        self.text = text
        self.replacement = replacement
        self.attributes = attributes
    }
}
