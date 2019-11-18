//
//  RunningEngine.swift
//  MetRUNome WatchKit Extension
//
//  Created by Will Taylor on 11/18/19.
//  Copyright © 2019 Will Taylor. All rights reserved.
//

import Foundation
import SwiftUI
import WatchKit

class RunningEngine: ObservableObject {
    
    @Published public var foot = false
    
    private let pace = Pace.loadFromDisk()
    public var timer: Timer?
    
    private let strideInFeet = 6.9
    private let FEET_IN_MILE = 5280
    
    /// The number of strides required by the user to run a mile.
    private var numberOfStridesPerMile: Double {
        return Double(FEET_IN_MILE) / 6.9
    }
    
    /// The length in seconds that the user's stride must be to meet their goal.
    public var secondsPerStrideToMeetGoal: Double {
        get {
            let desiredSecondsPerMile = Double((pace.minutes * 60) + pace.seconds)
            return Double(desiredSecondsPerMile / numberOfStridesPerMile)
        }
    }
    
    public func startRun() {
        timer = Timer.scheduledTimer(
            timeInterval: secondsPerStrideToMeetGoal,
            target: self,
            selector: #selector(fireTimer),
            userInfo: nil,
            repeats: true
        )
        timer?.fire()
    }
    
    deinit {
        timer?.invalidate()
    }
    
    @objc func fireTimer(){
        // Alternate feet
        foot = !foot
        WKInterfaceDevice.current().play(.click)
    }
    
}
