//
//  FourDaysOfTheWeek.swift
//  WeatherApp
//
//  Created by S, Praveen (Cognizant) on 05/10/24.
//

import SwiftUI

struct FourDaysOfTheWeek: View {
    
    var WeekDays : [String] = ["TUE","WED","THU","FRI","SAT"]
    
    var images : [String] = ["cloud.sun.fill","cloud.hail.fill","cloud.drizzle.fill","cloud.sleet.fill","cloud.bolt.fill"]
    
    var body: some View {
       
       
        
        
        
        HStack (spacing: 15){
            
            
            ForEach (0..<WeekDays.count) {
                
                index in
                
                ExtractedView(dayOfTheWeek: WeekDays[index], temperature: Int.random(in:  0..<100), imageName: images[index])
            }
        }
        
        
            
        }
    }


#Preview {
    FourDaysOfTheWeek()
        .preferredColorScheme(.dark)
}

struct ExtractedView: View   {
   
    
 
   
   
    var dayOfTheWeek : String
    var temperature : Int
    var imageName : String
    
    
    var body: some View {
        VStack {
            
            Text(dayOfTheWeek)
                .foregroundStyle(.white)
            Image(systemName: imageName)
                .symbolRenderingMode(.palette)
                .resizable()
                .foregroundStyle(.white, .yellow, .white)
                .scaledToFit()
                .frame(width: 50, height: 50)
            
            Text("\(temperature)℃")
                .font(.custom( "72℃", size: 23))
                .foregroundStyle(.white)
        }
    }
}
