//
//  Not.swift
//  App928
//
//  Created by IGOR on 11/10/2024.
//

import SwiftUI

struct Not: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            LinearGradient(colors: [Color("prim"), .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                
                Image("Not")
                    .resizable()
                    .padding(.bottom, 220)
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    Text("Don’t miss anything")
                        .foregroundColor(.white)
                        .font(.system(size: 32, weight: .bold))
                        .multilineTextAlignment(.center)
                    
                    Text("Don’t miss the most userful information.")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 10)
                    
                    Spacer()
                    
                    Button(action: {
                        
                        status = true
                        
                    }, label: {
                        
                        Text("Enable notifications")
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
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .semibold))
                        .padding(5)
                        .background(Circle().fill(.white))
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
                
                Spacer()
            }
        }
    }
}

#Preview {
    Not()
}
