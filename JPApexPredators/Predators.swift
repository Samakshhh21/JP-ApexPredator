//
//  Predators.swift
//  JPApexPredators
//
//  Created by Samaksh Sangwan on 03/10/25.
//
import Foundation

class Predators {
    var apexPredators: [ApexPredator] = []
    var allApexPredators: [ApexPredator] = []
    
    init(){
        decodeApexPredatorData()
    }
    
    func filterApexPredators(apexSearch : String) -> [ApexPredator] {
        if(apexSearch.isEmpty){
            return apexPredators}
        else {
          return  apexPredators.filter{predator in
                predator.name.localizedCaseInsensitiveContains(apexSearch)
            }
        }
    }
    
    func predatorsByType(currentType : APType){
        if(currentType == .all){
            apexPredators = allApexPredators
        }
        else { apexPredators = allApexPredators.filter{predator in
            predator.type == currentType
         }
        }
    }
    
    
    func sortPredators(alphabetical : Bool){
        if(alphabetical){
            apexPredators.sort{predator1 , predator2 in predator1.name < predator2.name}
        }
        else {
            apexPredators.sort{predator1 , predator2 in predator1.id < predator2.id}
        }
        
    }
    
    func decodeApexPredatorData(){
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
           
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                allApexPredators = try decoder.decode([ApexPredator].self, from: data)
                apexPredators = allApexPredators
            } catch {
                print("Error parsing JSON: \(error)")
            }
        }
    }
    
    
    
}
