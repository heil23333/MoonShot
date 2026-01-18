//
//  AstronautItemView.swift
//  Moonshot
//
//  Created by  He on 2026/1/18.
//

import SwiftUI

struct AstronautItemView: View {
    let astronaut: Astronaut
    let role: String
    
    var body: some View {
        HStack {
            Image(astronaut.id)
                .resizable()
                .frame(width: 104, height: 72)
                .clipShape(.capsule)
                .overlay {
                    Capsule().strokeBorder(.white, lineWidth: 1)
                }
            
            VStack(alignment: .leading) {
                Text(astronaut.name)
                    .foregroundStyle(.white)
                    .font(.headline)
                
                Text(role)
                    .foregroundStyle(.white.opacity(0.5))
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return AstronautItemView(astronaut: astronauts["aldrin"]!, role: "Lunar Lander Pilot").preferredColorScheme(.dark)
}
