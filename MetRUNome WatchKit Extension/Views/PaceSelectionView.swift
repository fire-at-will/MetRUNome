//
//  PaceSelectionView.swift
//  MetRUNome WatchKit Extension
//
//  Created by Will Taylor on 11/18/19.
//  Copyright © 2019 Will Taylor. All rights reserved.
//

import SwiftUI
struct PaceSelectionView: View {
    @ObservedObject var pace: Pace = Pace.loadFromDisk()
        
    var body: some View {
        
            VStack {
                HStack {
                    Text("Pace").font(.subheadline)
                    Spacer()
                }
                Spacer()
                
                HStack {
                    Text("\(pace.minutes)").font(.largeTitle)
                    Text(":").font(.largeTitle)
                    Text(
                        paddedIntString(pace.seconds)
                    )
                        .font(.largeTitle)
                        .focusable(true)
                        .digitalCrownRotation(
                            $pace.scrollAmount,
                            from: 0.0,
                            through: 7200.0,
                            by: 0.5,
                            sensitivity: .low,
                            isContinuous: false,
                            isHapticFeedbackEnabled: true
                    )

                }.padding()
                
                Spacer()
                
                NavigationLink(destination:
                    RunningView()
                ) {
                    Text("NavLink")
                }
            }
    }
    
    private func paddedIntString(_ int: Int) -> String {
        if int < 10 {
            return "0\(int)"
        } else {
            return "\(int)"
        }
    }
}

struct PaceSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        PaceSelectionView()
    }
}
