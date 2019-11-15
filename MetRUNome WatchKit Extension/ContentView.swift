//
//  ContentView.swift
//  MetRUNome WatchKit Extension
//
//  Created by Will Taylor on 10/20/19.
//  Copyright © 2019 Will Taylor. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var scrollAmount = 570.0
    
    @State var minutes: Int = 9
    @State var seconds: Int = 0
    
    var body: some View {
        
        VStack {
            HStack {
                Text("Pace").font(.subheadline)
                Spacer()
            }
            Spacer()
            
            HStack {
                Text(paddedIntString(Int(scrollAmount / 60))).font(.largeTitle)
                Text(":").font(.largeTitle)
                Text(
                    paddedIntString(
                        Int(scrollAmount.truncatingRemainder(dividingBy: 60))
                    )
                )
                    .font(.largeTitle)
                    .focusable(true)
                    .digitalCrownRotation(
                        $scrollAmount,
                        from: 0.0,
                        through: 7200.0,
                        by: 0.5,
                        sensitivity: .low,
                        isContinuous: false,
                        isHapticFeedbackEnabled: true
                )
                
            }.padding()
            
            Spacer()
            
            Button(action: {
                
            }) {
                Text("Start!")
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
