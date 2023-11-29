//
//  ContentView.swift
//  betterRest
//
//  Created by Luis Rivera on 28/11/23.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    @State private var sleepAmount = 8.0
    
    //MARK: - BODY
    var body: some View {
        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
    }
}

#Preview {
    ContentView()
}
