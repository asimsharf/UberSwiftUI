//
//  RideRequestView.swift
//  UberSwiftUI
//
//  Created by asimsharf on 10/03/2024.
//

import SwiftUI

struct RideRequestView: View {
    var body: some View {
        VStack(content: {
            Capsule()
                .foregroundColor(Color(.systemGray5))
                .frame(width: 48, height: 6)
                .padding(.top, 8)
            
            
            // trip info view
            HStack(content: {
                
                // indicator view
                VStack(content: {
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width: 8, height: 8)
                    
                    Rectangle()
                        .fill(Color(.systemGray4))
                        .frame(width: 1, height: 32)
                    
                    Rectangle()
                        .fill(Color(.black))
                        .frame(width: 8, height: 8)
                })
                
                VStack(alignment: .leading, spacing: 24, content: {
                    
                    HStack(content: {
                        Text("Current location")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        Text("1:30 PM")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.gray)
                    })
                    .padding(.bottom, 10)
                    
                    HStack(content: {
                        Text("Starbucks Coffee")
                            .font(.system(size: 16, weight: .semibold))
                        
                        Spacer()
                        
                        Text("1:45 PM")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.gray)
                    })
                    
                })
                .padding(.leading, 8)
            })
            .padding()
            
            Divider()
            
            
            // ride type selection view
            Text("SUGGESTED RIDES")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding()
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal){
                HStack(spacing: 12, content: {
                    ForEach( RideType.allCases){ type in
                        VStack(content: {
                            Image(type.imageName)
                                .resizable()
                                .scaledToFit()
                            
                            VStack(spacing: 4, content: {
                                Text(type.description)
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundColor(.gray)
                                
                                Text("$22.04")
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundColor(.gray)
                            })
                            .padding(8)
                            
                        })
                        .frame(width: 112, height: 140)
                        .foregroundColor(type == selectedRideType ? .white : .black)
                        .background(Color(type == selectedRideType ? .systemBlue : .systemGroupedBackground))
                        .scaleEffect(type = selectedRideType ? 1.2 : 1.0)
                        .cornerRadius(10)
                        .onTapGesture {
                            withAnimation (.spring()) {
                                selectedRideType = type
                            }
                        }
                        
                    }
                })
            }
            .padding(.horizontal)
            
            
            Divider()
                .padding(.vertical, 8)
            
            // payment option view
            HStack(spacing: 8,content: {
                Text("Visa")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(6)
                    .background(.blue)
                    .cornerRadius(4)
                    .foregroundColor(.white)
                    .padding(.leading)
                
                Text("**** 1234")
                    .fontWeight(.bold)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .imageScale(.medium)
                    .padding()
                
            })
            .frame(height: 50)
            .background(Color(.systemGroupedBackground))
            .cornerRadius(10)
            .padding(.horizontal)
            
            // request ride button
            Button {
                
            } label: {
                Text("Confirm Ride")
                    .fontWeight(.bold)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                    .background(.blue)
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }

        })
        .padding(.bottom, 24)
        .background(.white)
        .cornerRadius(12)
    }
}

#Preview {
    RideRequestView()
}
