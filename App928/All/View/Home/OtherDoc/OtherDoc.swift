//
//  OtherDoc.swift
//  App928
//
//  Created by IGOR on 11/10/2024.
//

import SwiftUI

struct OtherDoc: View {

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
                
                Text("Add other doctors")
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
                            
                            Text("Doctor's Name")
                                .foregroundColor(.gray.opacity(0.5))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.docName.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.docName)
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
                                .opacity(viewModel.docFunc.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.docFunc)
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
                                .opacity(viewModel.docServices.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.docServices)
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
                                .opacity(viewModel.docSum.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.docSum)
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                    .padding(.bottom)
                        
                        Button(action: {
                  
                            viewModel.addDoc()
                            
                            viewModel.docName = ""
                            viewModel.docSum = ""
                            viewModel.docServices = ""
                            viewModel.docFunc = ""
                            
                            viewModel.fetchDocs()
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddOtherDoc = false
                            }
                            
                        }, label: {
                            
                            Text("Add")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("prim")))
                        })
                        .opacity(viewModel.docSum.isEmpty || viewModel.docName.isEmpty || viewModel.docServices.isEmpty || viewModel.docFunc.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.docSum.isEmpty || viewModel.docName.isEmpty || viewModel.docServices.isEmpty || viewModel.docFunc.isEmpty ? true : false)
                    }
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    OtherDoc(viewModel: HomeViewModel())
}
