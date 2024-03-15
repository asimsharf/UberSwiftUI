//
//  LocationSearchView.swift
//  UberSwiftUI
//
//  Created by asimsharf on 03/03/2024.
//

import SwiftUI

struct LocationSearchView: View {
    
    @State private var startLocationText = ""
    @Binding var mapState: MapViewState
    @EnvironmentObject var viewModel: LocationSearchViewModel
    
    var body: some View {
        VStack {
            // Header View
            HStack(content: {
                VStack(
                    content: {
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width: 6, height: 6)
                    
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1, height: 24)
                    
                    Rectangle()
                        .fill(.black)
                        .frame(width: 6, height: 6)
                })
                
                VStack(
                    content: {
                        
                    TextField("Current location", text: $startLocationText)
                        .frame(height: 32)
                        .background(Color(.systemGroupedBackground))
                        .padding(.trailing)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: .none, height: 40)
                        .font(.system(size: 16, weight: .regular))
                        
                        TextField("Where to?", text: $viewModel.queryFragment)
                            .frame(height: 32)
                            .background(Color(.systemGroupedBackground))
                            .padding(.trailing)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: .none, height: 40)
                            .font(.system(size: 16, weight: .regular))

                })
            })
            .padding(.horizontal)
            .padding(.top, 64)

            Divider()
                .padding(.vertical)
            
            // List View
            ScrollView{
                VStack(alignment: .leading, content: {
                    ForEach(viewModel.results, id: \.self){
                        result in
                        
                        LocationSearchResultCell(
                            title: result.title, subTitle: result.subtitle
                        ).onTapGesture {
                            withAnimation(.spring()){
                                viewModel.selectLocation(result)
                                mapState = .locationSelected
                            }
                        }
                        
                    }
                })
            }
        }
        .background(.white)
    }
}

#Preview {
    LocationSearchView(mapState: .constant(.searchingForLocation))
}
