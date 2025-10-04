//
//  ApexPredator.swift
//  JPApexPredators
//
//  Created by Samaksh Sangwan on 03/10/25.
//

import Foundation
import SwiftUI

struct ApexPredator : Decodable , Identifiable{
    let id : Int
    let name : String
    let type : APType
    let latitude : Double
    let longitude : Double
    let movies : [String]
    let movieScenes : [MovieScene]
   // let links : String
    
    var image : String {
        return name.lowercased().replacingOccurrences(of: " ", with: "")
    }
    struct MovieScene : Decodable {
        let id : Int
        let movie : String
        let sceneDescription : String
    }
    
    enum APType : String , Decodable {
        case land
        case sea
        case air
        
        var backgroundColor : Color {
            switch self {
            case .land:
                    .brown
            case .air:
                    .teal
            case .sea:
                    .blue
            }
        }
    }
    
}
