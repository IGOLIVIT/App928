//
//  ServicesView.swift
//  App928
//
//  Created by IGOR on 11/10/2024.
//

import SwiftUI

struct ServicesView: View {
    
    @StateObject var viewModel = ServicesViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Services")
                        .foregroundColor(.black)
                        .font(.system(size: 32, weight: .bold))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 18, weight: .medium))
                    })
                }
                
                if viewModel.services.isEmpty {
                    
                    VStack(spacing: 17) {
                        
                        Text("No doctors added")
                            .foregroundColor(.black)
                            .font(.system(size: 17, weight: .semibold))
                        
                        Text("Add doctors to your list and fill out their services")
                            .foregroundColor(.gray)
                            .font(.system(size: 13, weight: .regular))
                            .multilineTextAlignment(.center)
                            .frame(width: 200)
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }
                            
                        }, label: {
                            
                            Text("Add")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                                .frame(width: 120, height: 40)
                                .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("prim")))
                        })
                    }
                    .padding(.vertical, 100)
                    
                    Spacer()
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.services, id: \.self) { index in
                                
                                VStack(alignment: .leading, spacing: 6) {
                                    
                                    HStack {
                                        
                                        Image(index.servPhoto ?? "")
                                            .resizable()
                                            .frame(width: 80, height: 80)
                                        
                                        VStack(alignment: .leading, spacing: 5) {
                                            
                                            Text(index.servName ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 22, weight: .semibold))
                                            
                                            Text(index.servSpec ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 18, weight: .medium))
                                            
                                            Text(index.servLen ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 15, weight: .regular))
                                        }
                                        
                                        Spacer()
                                        
                                        VStack {
                                            
                                            Menu(content: {
                                                
                                                Button(action: {
                                                    
                                                    viewModel.selectedServ = index
                                                    
                                                    withAnimation(.spring()) {
                                                        
                                                        viewModel.isDelete = true
                                                    }
                                                    
                                                }, label: {
                                                    
                                                    HStack {
                                                        
                                                        Text("Delete")
                                                        
                                                        Spacer()
                                                        
                                                        Image(systemName: "trash")
                                                    }
                                                })
                                                
                                            }, label: {
                                                
                                                Image(systemName: "line.3.horizontal.circle")
                                                    .foregroundColor(Color("prim"))
                                                    .font(.system(size: 17, weight: .regular))
                                            })
                                            
                                            Spacer()
                                        }
                                    }
                                    .frame(height: 90)
                                    
                                    Rectangle()
                                        .fill(.gray.opacity(0.2))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 1)
                                    
                                    VStack(alignment: .leading, spacing: 5) {
                                        
                                        Text("Reception")
                                            .foregroundColor(.black)
                                            .font(.system(size: 18, weight: .medium))
                                        
                                        HStack {
                                            
                                            Text(index.servServ1 ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 13, weight: .regular))
                                            
                                            Spacer()
                                            
                                            Text(index.servPrice1 ?? "")
                                                .foregroundColor(Color("prim"))
                                                .font(.system(size: 17, weight: .semibold))
                                        }
                                        
                                        HStack {
                                            
                                            Text(index.servServ2 ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 13, weight: .regular))
                                            
                                            Spacer()
                                            
                                            Text(index.servPrice2 ?? "")
                                                .foregroundColor(Color("prim"))
                                                .font(.system(size: 17, weight: .semibold))
                                        }
                                    }
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 20).fill(.white).shadow(radius: 4).padding(4))
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchServs()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddServ(viewModel: viewModel)
        })
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Delete")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Are you sure you want to delete?")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
               
                        CoreDataStack.shared.deleteServ(withServServ1: viewModel.selectedServ?.servServ1 ?? "", completion: {
                            
                            viewModel.fetchServs()
                        })
          
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false

                        }
                                
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.red)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                    .padding(.top, 25)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                        
                    }, label: {
                        
                        Text("Close")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                .padding()
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    ServicesView()
}
