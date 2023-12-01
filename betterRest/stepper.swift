//
//  stepper.swift
//  betterRest
//
//  Created by Luis Rivera on 30/11/23.
//

import SwiftUI

struct stepper: View {
    @State private var sleepAmount = 8.0
    
    //MARK: - BODY
    var body: some View {
        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
    }
}

#Preview {
    stepper()
}
