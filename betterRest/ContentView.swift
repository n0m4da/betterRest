//
//  ContentView.swift
//  betterRest
//
//  Created by Luis Rivera on 28/11/23.
//
import CoreML
import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    @State private var wakeUp =  defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
   @State private var alertTitle = ""
@State private var alertMessage = ""
    @State private var showingAlter = false
    
   static var defaultWakeTime : Date{
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
 private var calculateBedTime :  String {
        do {

            let config  = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components =  Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour =  (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60

            let prediction = try model.prediction(wake: Int64(Double(hour + minute)), estimatedSleep: sleepAmount, coffee: Int64(Double(coffeeAmount)))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
         
            return "\(sleepTime.formatted(date: .omitted, time: .shortened))"
        } catch{
            
            return "Sorry, there was a problem calculating your bedtime."
            
            
        }
 
    }
    //MARK: - BODY
    var body: some View {
        NavigationStack{
            Form{
                Section("Wake up at") {
                    
                    
                    Text("When do you want to wake up")
                        .font(.headline)
                    
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                  
                }
                   Section("amount to sleep") {
                        Text("Desired amount of sleep")
                            .font(.headline)
                        
                        
                        
                        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                    }
                    Section("Coffee for today") {
                    Text("Daily coffee intake")
                        .font(.headline)
                    
                    //Stepper("^[\(coffeeAmount) taza](inflect: true)", value: $coffeeAmount, in: 1...20)
                        Picker("Cups", selection: $coffeeAmount){
                            ForEach(1...20, id:\.self){ index in
                                Text("\(index)")
                            }
                        }
                }
                
                VStack {
                                    Text("Your idea bed time is ...")
                                        Text(calculateBedTime)
                                            .font(.largeTitle.bold())
                                        Spacer()
                                    
                                }
                                .padding()
            }
            .navigationTitle("BetterRest")
            .navigationBarTitleDisplayMode(.inline)
//            .toolbar{
//                Button("Calculate    ", action:  calculateBedTime)
//                    .font(.headline)
//                    .tint(.primary)
//                    .background(.blue.gradient.opacity(0.5))
//                    .clipShape(RoundedRectangle(cornerRadius: 9, style: .continuous))
//               
//                
//            }
//            .alert(alertTitle, isPresented: $showingAlter){
//                Button("OK"){}
//            }message: {
//                Text(alertMessage)
//            }
//
        }
    }
    

}

#Preview {
    ContentView()
}
