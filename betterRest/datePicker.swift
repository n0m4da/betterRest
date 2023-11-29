//
//  datePicker.swift
//  betterRest
//
//  Created by Luis Rivera on 28/11/23.
//

import SwiftUI

struct datePicker: View {
    //MARK: - properties
    @State private var wakeUp =  Date.now
    
    //MARK: - body
    var body: some View {
        DatePicker("Please enter a date", selection: $wakeUp, in: Date.now...)
            .labelsHidden()
        
        DatePicker("", selection: $wakeUp, displayedComponents: .date)
            .labelsHidden()
        
        DatePicker("", selection: $wakeUp, displayedComponents: .hourAndMinute)
            .labelsHidden()
        
        DatePicker("date", selection: $wakeUp)
        
        Text(Date.now, format: .dateTime.hour().minute())
        
        Text(Date.now, format: .dateTime.day().month().year())
            
    }
    
    func exampleDates() {
        let tomorrow =  Date.now.addingTimeInterval(86400)
        let range = Date.now...tomorrow
    }
    
    func exampleDate_() {
        let now = Date.now
        let tomorrow = Date.now.addingTimeInterval(86400)
        let range = now...tomorrow
    }
    
    func exampleDates__() {
//        var components = DateComponents()
//        components.hour = 8
//        components.minute = 0
//        let date = Calendar.current.date(from: components) ?? .now
        
        let components =  Calendar.current.dateComponents([.hour, .minute], from: .now)
        let hour = components.hour ?? 0
        let minute =  components.minute ?? 0
    }
}

#Preview {
    datePicker()
}
