//
//  PredatorDetail.swift
//  JPApexPredators
//
//  Created by Samaksh Sangwan on 04/10/25.
//

import SwiftUI
import MapKit

struct PredatorDetail: View {
    var predator: ApexPredator
    @State var position: MapCameraPosition
    @Namespace var namespace
    
    var body: some View {
        GeometryReader {geo in
            ScrollView{
                ZStack(alignment : .bottomTrailing){
                    Image(predator.type.rawValue)
                        .resizable()
                        .scaledToFit()
                        .overlay{
                            LinearGradient(stops: [
                                Gradient.Stop(color: .clear
                                              ,location: 0.8),
                                Gradient.Stop(color: .black
                                              ,location: 1)
                            ], startPoint: .top, endPoint: .bottom)
                        }
                    
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width/1.5,height: geo.size.height/3.7)
                        .scaleEffect(x : -1)
                        .shadow(color: .black, radius: 7)
                        .offset(y : 20)
                        
                }
                
                VStack(alignment : .leading){
                    Text(predator.name)
                        .font(.largeTitle)
                    NavigationLink{
                        PredatorMap(position: .camera(MapCamera(centerCoordinate: predator.location, distance: 1000, heading: 250, pitch: 80)))
                            .navigationTransition(.zoom(sourceID: 1, in: namespace))
                    } label: {
                        Map(position: $position){
                            Annotation(predator.name, coordinate: predator.location){
                                Image(systemName: "mappin.and.ellipse")
                                    .font(.largeTitle)
                                    .imageScale(.large)
                                    .symbolEffect(.pulse)
                            }
                            .annotationTitles(.hidden)
                        }
                            .frame(height: 150)
                            .clipShape(.rect(cornerRadius: 15))
                            .overlay(alignment: .trailing){
                                Image(systemName: "greaterthan")
                                    .imageScale(.large)
                                    .font(.title3)
                                    .padding(.trailing , 5)
                            }
                            .overlay(alignment: .topLeading){
                                Text("Current Location")
                                    .font(.title3)
                                    .padding(5)
                            }
                            
                    }
                    .matchedTransitionSource(id: 1, in: namespace)
                 
                    
                    Text("Appears In:")
                        .font(.title2)
                        .padding(.top,25)
                    
                    ForEach(predator.movies , id : \.self){ movie in
                        Text(movie)
                    }
                    
                    Text("Movie Moments")
                        .font(.title)
                        .padding(.top , 15)
                    
                    ForEach(predator.movieScenes){movieScene in
                        Text(movieScene.movie)
                            .font(.title2)
                            .padding(.vertical , 1)
                        
                        Text(movieScene.sceneDescription)
                    }
                    
                     Text("Read More:")
                    
                    Link(predator.link , destination: URL(string : predator.link)!)
                        
                    
                }
                .padding()
                .frame(width: geo.size.width , alignment: .leading)
                                
            }
            
            
        }
        .ignoresSafeArea()
        
       
    }
}

#Preview {
    
        PredatorDetail(predator: Predators().apexPredators[15],
                       position: .camera(MapCamera(centerCoordinate: Predators().apexPredators[15].location, distance: 50000))
        )
        .preferredColorScheme(.light)
    }

