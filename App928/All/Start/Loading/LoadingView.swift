//
//  LoadingView.swift
//  App928
//
//  Created by IGOR on 11/10/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("Llogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
                
                Spacer()
                
                ProgressView()
            }
            .padding(.vertical, 240)
        }
    }
}

#Preview {
    LoadingView()
}
