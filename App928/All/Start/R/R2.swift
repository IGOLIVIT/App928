//
//  R2.swift
//  App928
//
//  Created by IGOR on 11/10/2024.
//

import SwiftUI

struct R2: View {
    var body: some View {

        ZStack {
            
            LinearGradient(colors: [Color("prim"), .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                
                Image("R2")
                    .resizable()
                    .padding(.bottom, 220)
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    Text("Records management")
                        .foregroundColor(.white)
                        .font(.system(size: 32, weight: .bold))
                    
                    Text("Easily add, edit and delete appointments. You'll always know who is available and when you have an appointment.")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 10)
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        R3()
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
    R2()
}
