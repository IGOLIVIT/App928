//
//  U1.swift
//  App928
//
//  Created by IGOR on 11/10/2024.
//

import SwiftUI

struct U1: View {
    var body: some View {

        ZStack {
            
            LinearGradient(colors: [Color("prim"), .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                
                Image("U1")
                    .resizable()
                    .padding(.bottom, 300)
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    Text("Start now and earn more")
                        .foregroundColor(.white)
                        .font(.system(size: 32, weight: .bold))
                    
                    Text("A proven way to make easy money.")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 10)
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        Reviews()
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
    }
}

#Preview {
    U1()
}
