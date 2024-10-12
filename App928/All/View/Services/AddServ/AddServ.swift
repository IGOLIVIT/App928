//
//  AddServ.swift
//  App928
//
//  Created by IGOR on 12/10/2024.
//

import SwiftUI

struct AddServ: View {
    
    @StateObject var viewModel: ServicesViewModel
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
                
                Text("Create a doctor's card")
                    .foregroundColor(.black)
                    .font(.system(size: 20, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical)
                
                Menu(content: {
                    
                    ForEach(viewModel.docPhotos, id: \.self) { index in
                        
                        Button(action: {
                            
                            viewModel.currentPhoto = index
                            
                        }, label: {
                            
                            Image(index)
                        })
                        
                    }
                    
                }, label: {
                    
                    if viewModel.currentPhoto.isEmpty {
                        
                        VStack(spacing: 8) {
                            
                            Image(systemName: "photo")
                                .foregroundColor(.gray.opacity(0.5))
                                .font(.system(size: 58, weight: .medium))
                                .frame(maxWidth: .infinity)
                                .frame(height: 220)
                                .background(RoundedRectangle(cornerRadius: 20).fill(.gray.opacity(0.2)))
                            
                            Text("Select photo")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 15, weight: .regular))
                        }
                        
                    } else {
                        
                        VStack(spacing: 8) {
                            
                            Image(viewModel.currentPhoto)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 220)
                            
                            Text("Select photo")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 15, weight: .regular))
                        }
                    }
                })
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 12) {
                        
                        Text("About the doctor")
                            .foregroundColor(.black)
                            .font(.system(size: 17, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Doctor's Name")
                                .foregroundColor(.gray.opacity(0.5))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.servName.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.servName)
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
                                .opacity(viewModel.servSpec.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.servSpec)
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        
                        ZStack(content: {
                            
                            Text("Lenght of service")
                                .foregroundColor(.gray.opacity(0.5))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.servLen.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.servLen)
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        .padding(.bottom)
                        
                        Text("Services")
                            .foregroundColor(.black)
                            .font(.system(size: 17, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Service 1")
                                .foregroundColor(.gray.opacity(0.5))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.servServ1.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.servServ1)
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        
                        ZStack(content: {
                            
                            Text("Price 1")
                                .foregroundColor(.gray.opacity(0.5))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.servPrice1.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.servPrice1)
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        
                        ZStack(content: {
                            
                            Text("Service 2")
                                .foregroundColor(.gray.opacity(0.5))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.servServ2.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.servServ2)
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        
                        ZStack(content: {
                            
                            Text("Price 2")
                                .foregroundColor(.gray.opacity(0.5))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.servPrice2.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.servPrice2)
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        .padding(.bottom)
                        
                        Button(action: {
                            
                            viewModel.servPhoto = viewModel.currentPhoto
                            
                            viewModel.addServ()
                            
                            viewModel.servName = ""
                            viewModel.servSpec = ""
                            viewModel.servLen = ""
                            viewModel.servServ1 = ""
                            viewModel.servServ2 = ""
                            viewModel.servPrice1 = ""
                            viewModel.servPrice2 = ""
                            
                            viewModel.fetchServs()
                            
                            viewModel.currentPhoto = ""
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                            
                        }, label: {
                            
                            Text("Add")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("prim")))
                        })
                        .opacity(viewModel.servName.isEmpty || viewModel.servSpec.isEmpty || viewModel.servServ1.isEmpty || viewModel.servPrice1.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.servName.isEmpty || viewModel.servSpec.isEmpty || viewModel.servServ1.isEmpty || viewModel.servPrice1.isEmpty ? true : false)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddServ(viewModel: ServicesViewModel())
}
