//
//  ContentView.swift
//  WeatherApp
//
//  Created by S, Praveen (Cognizant) on 05/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight : Bool = false
    var body: some View {
        
            ZStack {
                
                BackGroundView(isNight: isNight)
                
                VStack{
                    CityView(city: "Cupertino, CA")
                        .padding()
                    
                    MainExtractedView(imageName: isNight ? "moon.fill" : "cloud.sun.fill", temperature: 88)
                    
                    
                    FourDaysOfTheWeek()
                    Spacer()
                    
                    
                    Button{
                        isNight.toggle()
                    } label: {
                        ButtonView(text: isNight ? "Its already night bro ": "Its morning buddy", bgColor: .white)
                        
                    }
                    Spacer()
                }
            }
        
    }
}

#Preview {
    ContentView()
       
}

struct BackGroundView: View {
    
     var isNight : Bool
    var body: some View {
//        LinearGradient(gradient: Gradient(colors:  [isNight ? Color("topColor"): .blue,  isNight ? Color("bottomColor") : Color("CustomColor1")]),
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing)
     ContainerRelativeShape()
            .fill(isNight ? Color.black .gradient : Color.blue.gradient )
            
        .ignoresSafeArea()
    }
}

struct MainExtractedView: View {
    
    var imageName : String
    var temperature : Int
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaledToFit()
                .frame(width: 200,height: 200)
            
            Text("\(temperature)℃")
                .font(.custom( "\(temperature)℃", size: 45))
                .foregroundStyle(.white)
        }
        .frame(width: 200,height: 200)
        
        .padding(.bottom, 100)
    }
}

struct CityView: View {
    
    var city : String
    var body: some View {
        Text(city)
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding(20)
    }
}

struct ButtonView: View {
    var text : String
    var bgColor : Color
    var body: some View {
        Text(text)
            .font(.title3)
            .fontWeight(.bold)
            .frame(width: 280 , height: 50)
            .background(bgColor)
            .font(.title2)
            .cornerRadius(10)
    }
}
