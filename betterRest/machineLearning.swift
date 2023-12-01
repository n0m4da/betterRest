//
//  machineLearning.swift
//  betterRest
//
//  Created by Luis Rivera on 29/11/23.
//

import SwiftUI

struct machineLearning: View {
    //MARK: - PROPERTIES
    @State private var wakeUp =  Date.now
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    //MARK: - BODY
    var body: some View {
        NavigationStack{
            VStack{
                Text("When do you want to wake up?")
                    .font(.headline)
                
                DatePicker("Please enter the time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                
                Text("Desired amount of sleep")
                    .font(.headline)
                
                Stepper("\(sleepAmount.formatted()) hours,", value: $sleepAmount, in: 4...12, step: 0.25)
                
                Text("Daily coffe intake")
                    .font(.headline)
                
                Stepper("\(coffeeAmount) cup(s)", value: $coffeeAmount, in: 1...20)
            }
        }
    }
}

#Preview {
    machineLearning()
}
