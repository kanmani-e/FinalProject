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
                    .font(.largeTitle)
                    .foregroundColor(Color(red: 0.217, green: 0.337, blue: 0.528))
                    .fontWeight(.bold)
                    .cornerRadius(10)
                    .padding(.top, 50)
                    Spacer()
                
                HStack{
                    VStack{
                        Image("ke_720")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(100)
                        Text("Kanmani Elangovan")
                            .font(.callout)
                            .fontWeight(.bold)
                            .foregroundColor(Color(red: 0.217, green: 0.337, blue: 0.528))
                        Text("Ellicott City, MD. Interested in Mech-E!")
                            .font(.callout)
                    }//closing of VStack
                    .padding(.horizontal, 5)
                    
                    VStack{
                        Image("dsc08195_720")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(100)
                        Text("Medha Manda")
                            .font(.callout)
                            .fontWeight(.bold)
                            .foregroundColor(Color(red: 0.217, green: 0.337, blue: 0.528))
                        Text("Put Information Here")
                            .font(.callout)
                    }//Closing of VStack
                    .padding(.horizontal, 5)
                    
                }//closing of HStack
                .padding(.horizontal, 30)
                Spacer()
                
                HStack{
                    VStack{
                        Image("img_9223_720")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(100)
                        Text("Keely Hong")
                            .font(.callout)
                            .fontWeight(.bold)
                            .foregroundColor(Color(red: 0.217, green: 0.337, blue: 0.528))
                        Text("Greenville, SC. Interested in SWE!")
                            .font(.callout)
                    }//closing of VStack
                    .padding(.horizontal, 5)
                    
                    VStack{
                        Image("emilyPhoto")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(100)
                        Text("Emily Suriel")
                            .font(.callout)
                            .fontWeight(.bold)
                            .foregroundColor(Color(red: 0.217, green: 0.337, blue: 0.528))
                        Text("Teaneck, NJ. KWK Alumni!")
                            .font(.callout)
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

