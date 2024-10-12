//
//  AddApp.swift
//  App928
//
//  Created by IGOR on 12/10/2024.
//

import SwiftUI

struct AddApp: View {

    @StateObject var viewModel: AppointmentsViewModel
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
                                .opacity(viewModel.apDName.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.apDName)
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
                                .opacity(viewModel.apDSpec.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.apDSpec)
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        .padding(.bottom)
                        
                        Text("Reception 1")
                            .foregroundColor(.black)
                            .font(.system(size: 17, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Patient's name")
                                .foregroundColor(.gray.opacity(0.5))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.apPName1.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.apPName1)
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        
                        ZStack(content: {
                            
                            Text("Service")
                                .foregroundColor(.gray.opacity(0.5))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.apServ1.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.apServ1)
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        
                        ZStack(content: {
                            
                            Text("Price")
                                .foregroundColor(.gray.opacity(0.5))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.apPrice1.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.apPrice1)
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        
                        HStack {
                            
                            Text("Date")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                            Spacer()
                            
                            DatePicker("", selection: $viewModel.apDate1, displayedComponents: .date)
                                .labelsHidden()
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        
                        HStack {
                            
                            Text("Time")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                            Spacer()
                            
                            DatePicker("", selection: $viewModel.apDate1, displayedComponents: .hourAndMinute)
                                .labelsHidden()
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        .padding(.bottom)
                        
                        Text("Reception 2")
                            .foregroundColor(.black)
                            .font(.system(size: 17, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Patient's name")
                                .foregroundColor(.gray.opacity(0.5))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.apPName2.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.apPName2)
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        
                        ZStack(content: {
                            
                            Text("Service")
                                .foregroundColor(.gray.opacity(0.5))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.apServ2.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.apServ2)
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        
                        ZStack(content: {
                            
                            Text("Price")
                                .foregroundColor(.gray.opacity(0.5))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.apPrice2.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.apPrice2)
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        
                        HStack {
                            
                            Text("Date")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                            Spacer()
                            
                            DatePicker("", selection: $viewModel.apDate2, displayedComponents: .date)
                                .labelsHidden()
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        
                        HStack {
                            
                            Text("Time")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                            Spacer()
                            
                            DatePicker("", selection: $viewModel.apDate2, displayedComponents: .hourAndMinute)
                                .labelsHidden()
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        .padding(.bottom)
                        
                        Button(action: {
                            
                            viewModel.apPhoto = viewModel.currentPhoto
                            
                            viewModel.addApp()
                            
                            viewModel.apDName = ""
                            viewModel.apDSpec = ""
                            viewModel.apPName1 = ""
                            viewModel.apPName2 = ""
                            viewModel.apServ1 = ""
                            viewModel.apServ2 = ""
                            viewModel.apPrice1 = ""
                            viewModel.apPrice2 = ""
                            viewModel.currentPhoto = ""
                            
                            viewModel.fetchApps()
                            
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

                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddApp(viewModel: AppointmentsViewModel())
}
