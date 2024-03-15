//
//  LocationSearchResultCell.swift
//  UberSwiftUI
//
//  Created by asimsharf on 03/03/2024.
//

import SwiftUI

struct LocationSearchResultCell: View {
    let title: String
    let subTitle: String
    
    var body: some View {
        HStack(content: {
            
            Image(systemName: "mappin.circle.fill")
                .resizable()
                .foregroundColor(.blue)
                .accentColor(.white)
                .frame(width: 40, height: 40)
            
            VStack(alignment: .leading, spacing: 4, content: {
                
                Text(title)
                    .font(.body)
                
                Text(subTitle)
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                
                Divider()
                
            })
            .padding(.leading, 8)
            .padding(.vertical, 8)
        })
        .padding(.leading)

    }
}

#Preview {
    LocationSearchResultCell(
        title: "Location title", subTitle: "Location SubTitle"
    )
}
