//
//  AppointmentsView.swift
//  App928
//
//  Created by IGOR on 11/10/2024.
//

import SwiftUI

struct AppointmentsView: View {
    
    @StateObject var viewModel = AppointmentsViewModel()
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Appointments")
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
                
                if viewModel.appointments.isEmpty {
                    
                    VStack(spacing: 17) {
                        
                        Text("No doctor's appointments")
                            .foregroundColor(.black)
                            .font(.system(size: 17, weight: .semibold))
                        
                        Text("Create an appointment list for your doctor so you don't forget")
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
                            
                            ForEach(viewModel.appointments, id: \.self) { index in
                                
                                VStack {
                                
                                VStack(alignment: .leading, spacing: 6) {
                                    
                                    HStack {
                                        
                                        Image(index.apPhoto ?? "")
                                            .resizable()
                                            .frame(width: 80, height: 80)
                                        
                                        VStack(alignment: .leading, spacing: 5) {
                                            
                                            Text(index.apDName ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 22, weight: .semibold))
                                            
                                            Text(index.apDSpec ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 18, weight: .medium))
                                            
                                        }
                                        
                                        Spacer()
                                        
                                        VStack {
                                            
                                            Menu(content: {
                                                
                                                Button(action: {
                                                    
                                                    viewModel.selectedApp = index
                                                    
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
                                    
                                    Text("Reception")
                                        .foregroundColor(.black)
                                        .font(.system(size: 18, weight: .medium))
                                    
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 20).fill(.white).shadow(radius: 4).padding(4))
                                    
                                    VStack {
                                        
                                        VStack(alignment: .leading, spacing: 5) {
                                            
                                            HStack {
                                                
                                                Text("\((index.apDate1 ?? Date()).convertDate(format: "dd.MM.yyyy"))")
                                                    .foregroundColor(Color("prim"))
                                                    .font(.system(size: 14, weight: .regular))
                                                    .padding(8)
                                                    .padding(.horizontal, 6)
                                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim").opacity(0.2)))
                                                
                                                Text("\((index.apTime1 ?? Date()).convertDate(format: "HH:mm"))")
                                                    .foregroundColor(Color("prim"))
                                                    .font(.system(size: 14, weight: .regular))
                                                    .padding(8)
                                                    .padding(.horizontal, 6)
                                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim").opacity(0.2)))
                                            }
                                            
                                            Text(index.apPName1 ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 18, weight: .semibold))
                                            
                                            HStack {
                                                
                                                Text(index.apServ1 ?? "")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 13, weight: .regular))
                                                
                                                Spacer()
                                                
                                                Text(index.apPrice1 ?? "")
                                                    .foregroundColor(Color("prim"))
                                                    .font(.system(size: 17, weight: .semibold))
                                            }
                                        }
                                        .padding()
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(RoundedRectangle(cornerRadius: 20).stroke(Color("prim")))
                                        .padding(1)
                                        
                                        VStack(alignment: .leading, spacing: 5) {
                                            
                                            HStack {
                                                
                                                Text("\((index.apDate2 ?? Date()).convertDate(format: "dd.MM.yyyy"))")
                                                    .foregroundColor(Color("prim"))
                                                    .font(.system(size: 14, weight: .regular))
                                                    .padding(8)
                                                    .padding(.horizontal, 6)
                                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim").opacity(0.2)))
                                                
                                                Text("\((index.apTime2 ?? Date()).convertDate(format: "HH:mm"))")
                                                    .foregroundColor(Color("prim"))
                                                    .font(.system(size: 14, weight: .regular))
                                                    .padding(8)
                                                    .padding(.horizontal, 6)
                                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim").opacity(0.2)))
                                            }
                                            
                                            Text(index.apPName2 ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 18, weight: .semibold))
                                            
                                            HStack {
                                                
                                                Text(index.apServ2 ?? "")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 13, weight: .regular))
                                                
                                                Spacer()
                                                
                                                Text(index.apPrice2 ?? "")
                                                    .foregroundColor(Color("prim"))
                                                    .font(.system(size: 17, weight: .semibold))
                                            }
                                        }
                                        .padding()
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(RoundedRectangle(cornerRadius: 20).stroke(Color("prim")))
                                        .padding(1)
                                    }
                                    .padding(.horizontal)
                                    .padding(.bottom)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 20).fill(.gray.opacity(0.1)))
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchApps()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddApp(viewModel: viewModel)
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
               
                        CoreDataStack.shared.deleteAp(withApServ1: viewModel.selectedApp?.apServ1 ?? "", completion: {
                            
                            viewModel.fetchApps()
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
    AppointmentsView()
}
