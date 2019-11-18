//
//  Pace.swift
//  MetRUNome WatchKit Extension
//
//  Created by Will Taylor on 11/18/19.
//  Copyright © 2019 Will Taylor. All rights reserved.
//

import Foundation
import SwiftUI

class Pace: ObservableObject {
    static let MINUTES_KEY = "minutes"
    static let SECONDS_KEY = "seconds"
    
    @Published public var scrollAmount = 570.0 {
        didSet {
            minutes = Int(scrollAmount) / 60
            seconds = Int(scrollAmount.truncatingRemainder(dividingBy: 60))
        }
    }
    
    @Published public var minutes: Int = 9{
        didSet {
            UserDefaults.standard.set(minutes, forKey: Pace.MINUTES_KEY)
        }
    }
    
    @Published public var seconds: Int = 0 {
        didSet {
            UserDefaults.standard.set(minutes, forKey: Pace.SECONDS_KEY)
        }
    }
    
    init(minutes: Int, seconds: Int){
        self.minutes = minutes
        self.seconds = seconds
    }
    
    static func loadFromDisk() -> Pace {
        let minutes = UserDefaults.standard.value(forKey: Pace.MINUTES_KEY) as? Int ?? -1
        let seconds = UserDefaults.standard.value(forKey: Pace.SECONDS_KEY) as? Int ?? -1
        return Pace(minutes: minutes, seconds: seconds)
    }
}
