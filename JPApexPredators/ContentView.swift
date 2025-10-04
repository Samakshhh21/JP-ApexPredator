//
//  ContentView.swift
//  JPApexPredators
//
//  Created by Samaksh Sangwan on 03/10/25.
//

import SwiftUI

struct ContentView: View {
    var predatorInstance = Predators()
    @State var apexSearch : String = ""
    @State var alphabeticalOrder : Bool = false
    @State var typeSelector : APType = .all
    
    var filteredPredators : [ApexPredator] {
        
        predatorInstance.predatorsByType(currentType: typeSelector)
        
        predatorInstance.sortPredators(alphabetical: alphabeticalOrder)
        
        return predatorInstance.filterApexPredators(apexSearch: apexSearch)
    }
    
    var body: some View {
        NavigationStack{
            List(filteredPredators){ predator in
                
                NavigationLink{
                    Image(.dimorphodon)
                } label: {
                    HStack{
                        Image(predator.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100,height: 100)
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
                
                
            }
            .navigationTitle("Apex Predators")
            .searchable(text: $apexSearch)
            .animation(.default, value: apexSearch)
            .animation(.default, value: typeSelector)
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button{
                        withAnimation {
                            alphabeticalOrder.toggle()
                        }
                    } label: {
                        Image(systemName : alphabeticalOrder ? "film" : "textformat")
                    }
                }
                ToolbarItem(placement: .topBarTrailing){
                    Menu{
                        Picker("Filter" , selection: $typeSelector){
                            ForEach(APType.allCases){ type in
                                Label(type.rawValue.capitalized , systemImage: type.icon)
                            }
                        }
                    } label: {
                        Image(systemName: "ellipsis")
                    }
                }
            }
        }
        
    }
    
    
}


#Preview {
    ContentView()
}
