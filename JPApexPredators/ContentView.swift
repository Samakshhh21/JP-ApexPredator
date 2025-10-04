//
//  ContentView.swift
//  JPApexPredators
//
//  Created by Samaksh Sangwan on 03/10/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List(Predators().apexPredators){ predator in
            HStack{
                Image(predator.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .shadow(color: .white, radius: 1)
                VStack(alignment: .leading){
                    Text(predator.name)
                        .fontWeight(.bold)
                    
                    Text(predator.type.rawValue.capitalized)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(.horizontal , 13)
                        .padding(.vertical , 5)
                        .background(predator.type.backgroundColor)
                        .clipShape(.capsule)
                        
                }
                .padding(.horizontal , 13)
                
            }
            
                
        }
        .preferredColorScheme(.dark)
    }
        
        
}


#Preview {
    ContentView()
}
