//
//  R3.swift
//  App928
//
//  Created by IGOR on 11/10/2024.
//

import SwiftUI

struct R3: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            LinearGradient(colors: [Color("prim"), .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                
                Image("R3")
                    .resizable()
                    .padding(.bottom, 220)
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    Text("Price transparency")
                        .foregroundColor(.white)
                        .font(.system(size: 32, weight: .bold))
                    
                    Text("You always have up-to-date pricing information at your fingertips. Easily set up and update your rates.")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 10)
                    
                    Spacer()
                    
                    Button(action: {
                        
                        status = true
                        
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
            
            VStack {
                
                Button(action: {
                    
                    status = true
                    
                }, label: {
                    
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .semibold))
                        .padding(5)
                        .background(Circle().fill(.black))
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.horizontal)
                
                Spacer()
            }
        }
    }
}

#Preview {
    R3()
}
