//
//  popUp.swift
//  FinalProject
//
//  Created by Medha Manda on 7/15/25.
//

import SwiftUI

struct popUp: View {
    var body: some View {
        ZStack{
            Color(red: 0.97, green: 0.96, blue: 0.922)
                .ignoresSafeArea()
                VStack{
                    HStack {
                        Text("Pop-Ups")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color(red: 0.836, green: 0.332, blue: 0.313))
                            .padding()
                        Spacer()
                    }
                    HStack{
                        Text("Current Pop-Ups in your Area!")
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color(red: 0.217, green: 0.337, blue: 0.528))
                            .padding(.leading)
                        Spacer()
                    }
            ScrollView(.vertical, showsIndicators: true) {
                    VStack{
                        HStack{
                            ZStack{
                                RoundedRectangle(cornerRadius: 9).fill(Color(red: 0.836, green: 0.332, blue: 0.313))
                                    .padding(.all)
                                    .frame(height: 200.0)
                                VStack{
                                    Text("Panda Express' Orange Chicken Kitchen Pop-Up")
                                        .font(.title2)
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal)
                                    Text("July 15 - July 20")
                                        .multilineTextAlignment(.leading)
                                        .padding(.leading)
                                        .foregroundColor(.white)
                                    Text("📍835 3rd Ave, New York, NY")
                                        .font(.callout)
                                        .foregroundColor(.white)
                                    
                                }
                            }
                        }
                    }
                    Spacer()
                        .frame(height: 5)
                    VStack {
                        HStack{
                            ZStack{
                                RoundedRectangle(cornerRadius: 9).fill(Color(red: 0.217, green: 0.337, blue: 0.528))
                                    .padding(.all)
                                    .frame(height: 200.0)
                                VStack{
                                    Text("Laneige x Baskin Robbins National    Ice Cream Day")
                                        .font(.title2)
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal)
                                    Text("July 15 - August 4")
                                        .multilineTextAlignment(.leading)
                                        .padding(.leading)
                                        .foregroundColor(.white)
                                    Text("📍Times Square 45-46 Plaza                                1535 Broadway, New York, NY")
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal)
                                        .foregroundColor(.white)
                                    
                                }
                            }
                        }
                    }
                    Spacer()
                        .frame(height: 5)
                    VStack {
                        HStack{
                            ZStack{
                                RoundedRectangle(cornerRadius: 9).fill(Color(red: 0.836, green: 0.332, blue: 0.313))
                                    .padding(.all)
                                    .frame(height: 200.0)
                                VStack{
                                    Text("Crystal Hot Sauce x Morgenstern's         Ice Cream Collab")
                                        .font(.title2)
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal)
                                    Text("July 19 - July 20")
                                        .multilineTextAlignment(.leading)
                                        .padding(.leading)
                                        .foregroundColor(.white)
                                    Text("📍88 West Houston Street, New York, NY")
                                        .foregroundColor(.white)
                                    
                                }
                            }
                    }
                }
                Spacer()
                    .frame(height: 5)
                VStack {
                    HStack{
                        ZStack{
                            RoundedRectangle(cornerRadius: 9).fill(Color(red: 0.217, green: 0.337, blue: 0.528))
                                .padding(.all)
                                .frame(height: 200.0)
                            VStack{
                                Text("Greenberg's Bagels x              Hometoen Bar-B-Que")
                                    .font(.title2)
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                                Text("July 13 - July 19")
                                    .multilineTextAlignment(.leading)
                                    .padding(.leading)
                                    .foregroundColor(.white)
                                Text("📍210 Mercer Street, New York, NY")
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                                    .foregroundColor(.white)
                                
                            }
                        }
                    }
                }
                Spacer()
                    .frame(height: 5)
                VStack {
                    HStack{
                        ZStack{
                            RoundedRectangle(cornerRadius: 9).fill(Color(red: 0.836, green: 0.332, blue: 0.313))
                                .padding(.all)
                                .frame(height: 200.0)
                            VStack{
                                Text("Curry in a Hurry")
                                    .font(.title2)
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                                Text("July 19 - July 26")
                                    .multilineTextAlignment(.leading)
                                    .padding(.leading)
                                    .foregroundColor(.white)
                                Text("📍146 Broome Street, New York, NY")
                                    .foregroundColor(.white)
                                
                            }
                        }
                }
            }
            Spacer()
            }
        }
    }
}
}

    
    #Preview {
        popUp()
    }
