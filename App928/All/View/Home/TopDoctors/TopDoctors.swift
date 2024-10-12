//
//  TopDoctors.swift
//  App928
//
//  Created by IGOR on 11/10/2024.
//

import SwiftUI

struct TopDoctors: View {
    
    @StateObject var viewModel: HomeViewModel
    @Environment(\.presentationMode) var back
    
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                Button(action: {
                    
                    back.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                        .font(.system(size: 13, weight: .semibold))
                        .padding(5)
                        .background(Circle().fill(.gray.opacity(0.3)))
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                Text("Add two top doctors")
                    .foregroundColor(.black)
                    .font(.system(size: 20, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 12) {
                        
                        Text("The first doctor")
                            .foregroundColor(.black)
                            .font(.system(size: 17, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Name")
                                .foregroundColor(.gray.opacity(0.5))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.addName1Doc.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.addName1Doc)
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        
                        ZStack(content: {
                            
                            Text("Speciality")
                                .foregroundColor(.gray.opacity(0.5))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.addSpec1Doc.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.addSpec1Doc)
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        
                        ZStack(content: {
                            
                            Text("Number of services")
                                .foregroundColor(.gray.opacity(0.5))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.addNS1Doc.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.addNS1Doc)
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        
                        ZStack(content: {
                            
                            Text("Earnings")
                                .foregroundColor(.gray.opacity(0.5))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.addEar1Doc.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.addEar1Doc)
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                    .padding(.bottom)
                        
                        Text("The second doctor")
                            .foregroundColor(.black)
                            .font(.system(size: 17, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Name")
                                .foregroundColor(.gray.opacity(0.5))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.addName2Doc.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.addName2Doc)
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        
                        ZStack(content: {
                            
                            Text("Speciality")
                                .foregroundColor(.gray.opacity(0.5))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.addSpec2Doc.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.addSpec2Doc)
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        
                        ZStack(content: {
                            
                            Text("Number of services")
                                .foregroundColor(.gray.opacity(0.5))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.addNS2Doc.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.addNS2Doc)
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        
                        ZStack(content: {
                            
                            Text("Earnings")
                                .foregroundColor(.gray.opacity(0.5))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.addEar2Doc.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.addEar2Doc)
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                    .padding(.bottom)
                        
                        Button(action: {
                            
                            viewModel.name1doc = viewModel.addName1Doc
                            viewModel.name2doc = viewModel.addName2Doc
                            viewModel.spec1doc = viewModel.addSpec1Doc
                            viewModel.spec2doc = viewModel.addSpec2Doc
                            viewModel.ns1doc = viewModel.addNS1Doc
                            viewModel.ns2doc = viewModel.addNS1Doc
                            viewModel.ear1doc = viewModel.addEar1Doc
                            viewModel.ear2doc = viewModel.addEar2Doc
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddTopDocs = false
                            }
                            
                        }, label: {
                            
                            Text("Add")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("prim")))
                        })
                    }
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    TopDoctors(viewModel: HomeViewModel())
}
