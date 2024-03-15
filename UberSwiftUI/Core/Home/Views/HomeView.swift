//
//  HomeView.swift
//  UberSwiftUI
//
//  Created by asimsharf on 02/03/2024.
//

import SwiftUI

struct HomeView: View {
    @State private var mapState = MapViewState.noInput
    @EnvironmentObject var locationViewModel: LocationSearchViewModel
    
    var body: some View {
        ZStack(alignment: .bottom, content: {
            ZStack(alignment: .top, content: {
                
                UberMapViewRepresentable(mapState: $mapState).ignoresSafeArea()
                
                if mapState == .searchingForLocation {
                    LocationSearchView(mapState:$mapState)
                } else if mapState == .noInput {
                    LocationSearchActivationView().padding(.top, 72).onTapGesture {
                            withAnimation(.spring()){
                                mapState = .searchingForLocation
                            }
                        }
                }
                
                MapViewActionButton(mapState: $mapState)
                    .padding(.leading, 25)
                    .padding(.top, 4)
                
            })
            
            if mapState == .locationSelected {
                RideRequestView()
                    .transition(.move(edge: .bottom))
            }
        })
        .edgesIgnoringSafeArea(.bottom)
        .onReceive(LocationManager.shared.$userLocation, perform: { location in
            if let location = location {
                locationViewModel.userLocation = location
            }
        })
    }
}

#Preview {
    HomeView()
}
