//
//  ContentView.swift
//  MultiScreenUI
//
//  Created by DEEP BHUPATKAR on 24/06/24.
//

import SwiftUI

struct ContentView: View {
    @State private var participants: Int = 1
    private let maxParticipants = 5
    private let names = ["Ted Mosby", "Claire Dunphy", "Lily Eriksen", "Marshall Eriksen", "Robin Scherbatsky"]
    
    var body: some View {
        VStack {
            // Picker to select the number of participants
            Picker("Participants", selection: $participants) {
                ForEach(1...maxParticipants, id: \.self) { number in
                    Text("\(number)").tag(number)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            GeometryReader { geometry in
                VStack(spacing: 0) {
                    if participants == 1 {
                        singleView(name: names[0])
                            .frame(width: geometry.size.width, height: geometry.size.height)
                    } else if participants == 2 {
                        VStack(spacing: 0) {
                            singleView(name: names[0])
                                .frame(width: geometry.size.width, height: geometry.size.height / 2)
                            singleView(name: names[1])
                                .frame(width: geometry.size.width, height: geometry.size.height / 2)
                        }
                    } else if participants == 3 {
                        VStack(spacing: 0) {
                            HStack(spacing: 0) {
                                singleView(name: names[0])
                                    .frame(width: geometry.size.width / 2, height: geometry.size.height / 2)
                                singleView(name: names[1])
                                    .frame(width: geometry.size.width / 2, height: geometry.size.height / 2)
                            }
                            singleView(name: names[2])
                                .frame(width: geometry.size.width, height: geometry.size.height / 2)
                        }
                    } else if participants == 4 {
                        VStack(spacing: 0) {
                            HStack(spacing: 0) {
                                singleView(name: names[0])
                                    .frame(width: geometry.size.width / 2, height: geometry.size.height / 2)
                                singleView(name: names[1])
                                    .frame(width: geometry.size.width / 2, height: geometry.size.height / 2)
                            }
                            HStack(spacing: 0) {
                                singleView(name: names[2])
                                    .frame(width: geometry.size.width / 2, height: geometry.size.height / 2)
                                singleView(name: names[3])
                                    .frame(width: geometry.size.width / 2, height: geometry.size.height / 2)
                            }
                        }
                    } else if participants == 5 {
                        VStack(spacing: 0) {
                            HStack(spacing: 0) {
                                singleView(name: names[0])
                                    .frame(width: geometry.size.width / 2, height: geometry.size.height / 3)
                                singleView(name: names[1])
                                    .frame(width: geometry.size.width / 2, height: geometry.size.height / 3)
                            }
                            singleView(name: names[2])
                                .frame(width: geometry.size.width, height: geometry.size.height / 3)
                            HStack(spacing: 0) {
                                singleView(name: names[3])
                                    .frame(width: geometry.size.width / 2, height: geometry.size.height / 3)
                                singleView(name: names[4])
                                    .frame(width: geometry.size.width / 2, height: geometry.size.height / 3)
                            }
                        }
                    }
                }
            }
        }
    }
    
    // Placeholder for a single participant view
    @ViewBuilder
    func singleView(name: String) -> some View {
        ZStack {
            Rectangle()
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.indigo, .white,.cyan]), startPoint: .top, endPoint: .bottom))
                .border(Color.black, width: 1)
            
            VStack {
                
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                
                Text(name)
                    .foregroundColor(.blue)
                    .font(.headline)
                    
            }
            
           
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
