//
//  ContentView.swift
//  Notifications
//
//  Created by Vlad Dzirko on 20.07.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedDate = Date()
    let notify = NotificationHandler()
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Button("Send a notification in 5 second") {
                notify.sendNotification(
                    date: Date(),
                    type: "time",
                    timeInterval: 5,
                    title: "Hi there!",
                    body: "This is a reminder you set 5 seconds ago!")
            }
            
            DatePicker("Pick a date:", selection: $selectedDate, in: Date()...)
            Button("Schedule notification") {
                notify.sendNotification(
                    date: selectedDate,
                    type: "date",
                    title: "Hi there!",
                    body: "This is a reminder you set up with date picker!")
            }.tint(.orange)
            
            Spacer()
            Text("Not working?")
                .foregroundColor(.gray)
                .italic()
            Button("Request permission") {
                notify.askPermission()
            }
        }
        .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
