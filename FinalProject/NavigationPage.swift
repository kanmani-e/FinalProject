//
//  NavigationPage.swift
//  FinalProject
//
//  Created by Indiana Suriel on 7/16/25.
//

import SwiftUI

struct NavigationPage: View {
    var body: some View {
        NavigationStack{
            VStack{
                Text("Placeholder")
                    .font(.custom("Lobster-Regular", size: 48))
                    .fontWeight(.bold)
                    .padding(.top, 50)
                Spacer()
                
                NavigationLink(destination: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Destination@*/Text("Destination")/*@END_MENU_TOKEN@*/) {
                    Text("Pop ups")
                        .font(.custom("Lobster-Regular", size: 30))
                        .foregroundColor(Color(red: 0.835, green: 0.333, blue: 0.314))
                        .background(Color(red: 0.97, green: 0.96, blue: 0.922))
                        .cornerRadius(10)
                        .padding(.bottom, 100)
                }//closing of NavLink
                
                NavigationLink(destination: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Destination@*/Text("Destination")/*@END_MENU_TOKEN@*/) {
                    Text("Resturants")
                        .font(.custom("Lobster-Regular", size: 30))
                        .foregroundColor(Color(red: 0.835, green: 0.333, blue: 0.314))
                        .background(Color(red: 0.97, green: 0.96, blue: 0.922))
                        .cornerRadius(10)
                        .padding(.bottom, 100)
                }//closing of NavLink
                
                NavigationLink(destination: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Destination@*/Text("Destination")/*@END_MENU_TOKEN@*/) {
                    Text("About Us")
                        .font(.custom("Lobster-Regular", size: 30))
                        .foregroundColor(Color(red: 0.835, green: 0.333, blue: 0.314))
                        .background(Color(red: 0.97, green: 0.96, blue: 0.922))
                        .cornerRadius(10)
                        .padding(.bottom, 200)
                }//closing of NavLink
            }//closing of VStack
        }//closing of NavStack
    }
}

#Preview {
    NavigationPage()
}
