//
//  ContentView.swift
//  MetRUNome WatchKit Extension
//
//  Created by Will Taylor on 10/20/19.
//  Copyright © 2019 Will Taylor. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var paceSelected = false
    
    var body: some View {
        return PaceSelectionView()

    }
}
