//
//  RunningView.swift
//  MetRUNome WatchKit Extension
//
//  Created by Will Taylor on 11/18/19.
//  Copyright © 2019 Will Taylor. All rights reserved.
//

import SwiftUI

struct RunningView: View {
        
    @ObservedObject var runningEngine: RunningEngine = RunningEngine()
    private let pace = Pace.loadFromDisk()
    
    var body: some View {
        
        VStack {
            HStack {
                Text("Running").font(.subheadline)
                Spacer()
            }
            Spacer()
            
            GeometryReader { geometry in
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: geometry.size.width * 2, height: 3)
                    .position(CGPoint(x: 4, y: geometry.size.height / 2))
                ZStack {
                    BaselineView(geometry: geometry)
                    
                    Path { path in
                        path.addRect(CGRect(
                            x: 0,
                            y: 0,
                            width: 3,
                            height: geometry.size.height)
                        )
                    }
                    .position(
                        CGPoint(
                            x: self.runningEngine.foot ?
                                geometry.size.width / 2 + 4 :
                                geometry.size.width * 1.5 - 7,
                            y: geometry.size.height / 2
                        )
                    )
                        .foregroundColor(.orange)
                        .animation(.linear(duration: self.runningEngine.secondsPerStrideToMeetGoal))
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 20, maxHeight: 200)
            
            Text("\(pace.minutes):\(paddedIntString(Int(pace.seconds)))")
                .padding(.bottom)
            
            Spacer()
            
            Button(action: {
                self.runningEngine.startRun()
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

struct RunningView_Previews: PreviewProvider {
    static var previews: some View {
        RunningView()
    }
}


struct BaselineView: View {
    
    private var geometry: GeometryProxy
    
    init(geometry: GeometryProxy){
        self.geometry = geometry
    }
    
    var body: some View {
        Path { path in
            // Left ending bar
            path.addRect(CGRect(
                x: 4,
                y: 4,
                width: 3,
                height: geometry.size.height - 8)
            )
            
            // Right ending bar
            path.addRect(CGRect(
                x: geometry.size.width - 7,
                y: 4,
                width: 3,
                height: geometry.size.height - 8)
            )
            
            // Center bar
            path.addRect(CGRect(
                x: geometry.size.width / 2,
                y: geometry.size.height / 4,
                width: 3,
                height: geometry.size.height / 2)
            )
            
        }
        .foregroundColor(.blue)
    }
}
