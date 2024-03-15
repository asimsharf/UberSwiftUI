//
//  HomeView.swift
//  UberSwiftUI
//
//  Created by asimsharf on 02/03/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        UberMapViewRepresentable()
            .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}
