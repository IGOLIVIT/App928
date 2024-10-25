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
            
            LinearGradient(colors: [Color("prim2"), .black], startPoint: .top, endPoint: .bottom)
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
                        .foregroundColor(.black)
                        .font(.system(size: 34, weight: .bold))
                        .multilineTextAlignment(.center)
                    
                    Text("Easily add, edit and delete appointments. You'll always know who is available and when you have an appointment.")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .regular))
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
                            .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("prim2")))
                    })
                    .padding(.bottom, 30)
                }
                .padding(30)
                .frame(height: 340)
                .frame(maxWidth: .infinity)
                .background(Color(.white))
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    R2()
}
