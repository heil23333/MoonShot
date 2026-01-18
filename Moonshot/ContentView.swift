//
//  ContentView.swift
//  Moonshot
//
//  Created by  He on 2026/1/17.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let columns = [GridItem(.adaptive(minimum: 150))]
    
    @State var gridShowItems = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if gridShowItems {
                    LazyVGrid(columns: columns) {
                        ForEach(missions) { mission in
                            NavigationLink(value: mission) {
                                VStack {
                                    Image(mission.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                        .padding(10)
                                    
                                    VStack {
                                        Text(mission.displayName)
                                            .font(.headline)
                                            .foregroundStyle(.white)
                                        
                                        Text(mission.formattedLaunchDate)
                                            .font(.caption)
                                            .foregroundStyle(.white.opacity(0.5))
                                    }
                                    .padding(.vertical)
                                    .frame(maxWidth: .infinity)
                                    .background(.lightBackground)
                                }
                                .clipShape(.rect(cornerRadius: 10))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.lightBackground)
                                }
                            }
                        }
                    }
                    .padding([.horizontal, .bottom])
                } else {
                    ForEach(missions) { mission in
                        NavigationLink(value: mission)  {
                            HStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .padding(10)
                                
                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundStyle(.white)
                                    
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundStyle(.white.opacity(0.5))
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                            }
                            .background(.lightBackground)
                            .clipShape(.rect(cornerRadius: 10))
                            .padding(.horizontal)
                        }
                    }
                }
                
            }
            .navigationTitle("登月计划(MoonShot)")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("切换视图") {
                        gridShowItems.toggle()
                    }
                }
            }
            .navigationDestination(for: Mission.self) { mission in
                MissionView(mission: mission, astronauts: astronauts)
            }
        }
    }
}

#Preview {
    ContentView()
}
