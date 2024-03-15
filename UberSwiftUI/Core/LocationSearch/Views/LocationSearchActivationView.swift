//
//  LocationSearchActivationView.swift
//  UberSwiftUI
//
//  Created by asimsharf on 02/03/2024.
//

import SwiftUI

struct LocationSearchActivationView: View {
    var body: some View {
        HStack{
            
            Rectangle()
                .fill(.black)
                .frame(width: 8, height: 8)
                .padding(.horizontal)
            
            Text("Where to?")
                .foregroundColor(Color(.darkGray))
            

            Spacer()
            
        }
        .frame(width: UIScreen.main.bounds.width - 64 ,height: 50)
        .background(RoundedRectangle(cornerRadius: 10, style: .continuous).fill(.white).shadow(color: .black, radius: 6))
    }
}

#Preview {
    LocationSearchActivationView()
}
