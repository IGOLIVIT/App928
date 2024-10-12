//
//  Reviews.swift
//  App928
//
//  Created by IGOR on 11/10/2024.
//

import SwiftUI
import StoreKit

struct Reviews: View {
    var body: some View {

        ZStack {
            
            LinearGradient(colors: [Color("prim"), .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                
                Image("Reviews")
                    .resizable()
                    .padding(.bottom, 290)
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    Text("Rate our app in the AppStore")
                        .foregroundColor(.white)
                        .font(.system(size: 32, weight: .bold))
                        .multilineTextAlignment(.center)
                    
                    Text("Help make the app even better.")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 10)
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        Not()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 25.0).fill(.black))
                    })
                    .padding(.bottom, 30)
                }
                .padding(30)
                .frame(height: 340)
                .frame(maxWidth: .infinity)
                .background(Color("prim"))
            }
            .ignoresSafeArea()
        }
        .onAppear {
            
            SKStoreReviewController.requestReview()
        }
    }
}

#Preview {
    Reviews()
}
