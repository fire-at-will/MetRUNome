//
//  ContentView.swift
//  MetRUNome WatchKit Extension
//
//  Created by Will Taylor on 10/20/19.
//  Copyright © 2019 Will Taylor. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var minutes: Int = 9
    @State var seconds: Int = 0

    var body: some View {

        VStack {
            HStack {
                Text("Pace").font(.body)
                Spacer()
            }
            Spacer()
            
            HStack {
                Text(paddedIntString(minutes)).font(.largeTitle)
                Text(":").font(.largeTitle)
                Text(paddedIntString(seconds)).font(.largeTitle)
            }.padding()
            
            Spacer()
            
            Button(action: {print("Start!")}) {
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
