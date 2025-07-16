//
//  AboutUsPage.swift
//  FinalProject
//
//  Created by Indiana Suriel on 7/16/25.
//

import SwiftUI

struct AboutUsPage: View {
    var body: some View {
        ZStack{
            Color(red: 0.97, green: 0.96, blue: 0.922)
                .ignoresSafeArea()
            VStack{
                Text("About Us")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 50)
                    Spacer()
                
                HStack{
                    VStack{
                        Image("placeholder")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(100)
                        Text("Name")
                        Text("Put Information Here")
                    }//closing of VStack
                    .padding(.horizontal, 5)
                    
                    VStack{
                        Image("placeholder")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(100)
                        Text("Name")
                        Text("Put Information Here")
                    }//Closing of VStack
                    .padding(.horizontal, 5)
                    
                }//closing of HStack
                .padding(.horizontal, 30)
                Spacer()
                
                HStack{
                    VStack{
                        Image("placeholder")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(100)
                        Text("Name")
                        Text("Put Information Here")
                    }//closing of VStack
                    .padding(.horizontal, 5)
                    
                    VStack{
                        Image("placeholder")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(100)
                        Text("Name")
                        Text("Put Information Here")
                    }//Closing of VStack
                    .padding(.horizontal, 5)
                }//Closing of HStack
                .padding(.horizontal, 30)
                Spacer()
            }//closing of VStack
        }//closing of ZStack
    }
}

#Preview {
    AboutUsPage()
}
