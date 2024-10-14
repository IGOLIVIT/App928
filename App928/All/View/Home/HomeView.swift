//
//  HomeView.swift
//  App928
//
//  Created by IGOR on 11/10/2024.
//

import SwiftUI
import StoreKit

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack(spacing: 17) {
                
                Text("Statistics")
                    .foregroundColor(.black)
                    .font(.system(size: 32, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical)
                
                ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 9) {
                    
                    Text("The two best workers")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    if viewModel.name1doc.isEmpty {
                        
                        VStack(spacing: 17) {
                            
                            Text("No doctors added")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .semibold))
                            
                            Text("Add your top two employees and compair their performance")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                                .multilineTextAlignment(.center)
                                .frame(width: 200)
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isAddTopDocs = true
                                }
                                
                            }, label: {
                                
                                Text("Add")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .medium))
                                    .frame(width: 120, height: 40)
                                    .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("prim")))
                            })
                        }
                        .frame(maxHeight: .infinity)
                        
                    } else {
                        
                        VStack {
                            
                            VStack(alignment: .leading, spacing: 5) {
                                
                                HStack {
                                    
                                    Text(viewModel.name1doc)
                                        .foregroundColor(.white)
                                        .font(.system(size: 18, weight: .medium))
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        
                                        withAnimation(.spring()) {
                                            
                                            viewModel.isAddTopDocs = true
                                        }
                                        
                                    }, label: {
                                        
                                        Image(systemName: "pencil.circle")
                                            .foregroundColor(.white)
                                            .font(.system(size: 17, weight: .regular))
                                    })
                                }
                                
                                Text(viewModel.spec1doc)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                
                                Rectangle()
                                    .fill(.white.opacity(0.4))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 1)
                                
                                HStack {
                                    
                                    Text("\(viewModel.ns1doc) services")
                                        .foregroundColor(.white)
                                        .font(.system(size: 14, weight: .regular))
                                    
                                    Spacer()
                                    
                                    Text("$\(viewModel.ear1doc)")
                                        .foregroundColor(.white)
                                        .font(.system(size: 18, weight: .semibold))
                                }
                                
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim")))
                            
                            VStack(alignment: .leading, spacing: 5) {
                                
                                HStack {
                                    
                                    Text(viewModel.name2doc)
                                        .foregroundColor(.white)
                                        .font(.system(size: 22, weight: .medium))
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        
                                        withAnimation(.spring()) {
                                            
                                            viewModel.isAddTopDocs = true
                                        }
                                        
                                    }, label: {
                                        
                                        Image(systemName: "pencil.circle")
                                            .foregroundColor(.white)
                                            .font(.system(size: 17, weight: .regular))
                                    })
                                }
                                
                                Text(viewModel.spec2doc)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                
                                Rectangle()
                                    .fill(.white.opacity(0.4))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 1)
                                
                                HStack {
                                    
                                    Text("\(viewModel.ns2doc) services")
                                        .foregroundColor(.white)
                                        .font(.system(size: 14, weight: .regular))
                                    
                                    Spacer()
                                    
                                    Text("$\(viewModel.ear2doc)")
                                        .foregroundColor(.white)
                                        .font(.system(size: 18, weight: .semibold))
                                }
                                
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim")))
                            .opacity(viewModel.name2doc.isEmpty ? 0 : 1)
                        }
                    }
                }
                .padding()
                .frame(height: 290)
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 25.0).fill(.white).shadow(radius: 4))
                .padding(4)
                
                HStack {
                    
                    Text("The other doctors")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddOtherDoc = true
                            
                        }
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 17, weight: .medium))
                    })
                    
                }
                    
                    if viewModel.doctors.isEmpty {
                        
                        VStack(spacing: 17) {
                            
                            Text("No doctors added")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .semibold))
                            
                            Text("Add your top two employees and compair their performance")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                                .multilineTextAlignment(.center)
                                .frame(width: 200)
                            
                            Button(action: {
                                
                                viewModel.isAddOtherDoc = true
                                
                            }, label: {
                                
                                Text("Add")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .medium))
                                    .frame(width: 120, height: 40)
                                    .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("prim")))
                            })
                        }
                        .frame(height: 270)
                        
                    } else {
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            LazyVStack {
                                
                                ForEach(viewModel.doctors, id: \.self) { index in
                                    
                                    VStack(alignment: .leading, spacing: 5) {
                                        
                                        HStack {
                                            
                                            Text(index.docName ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 22, weight: .medium))
                                            
                                            Spacer()
                                            
                                            Menu(content: {
                                                
                                                Button(action: {
                                                    
                                                    viewModel.selectedDoc = index
                                                    
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
                                                
                                                Image(systemName: "pencil.circle")
                                                    .foregroundColor(Color("prim"))
                                                    .font(.system(size: 17, weight: .regular))
                                            })
                                        }
                                        
                                        Text(index.docFunc ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 14, weight: .regular))
                                        
                                        Rectangle()
                                            .fill(.gray.opacity(0.4))
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 1)
                                        
                                        HStack {
                                            
                                            Text("\(index.docServices ?? "") services")
                                                .foregroundColor(.black)
                                                .font(.system(size: 14, weight: .regular))
                                            
                                            Spacer()
                                            
                                            Text("$\(index.docSum ?? "")")
                                                .foregroundColor(.black)
                                                .font(.system(size: 18, weight: .semibold))
                                        }
                                        
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                                }
                            }
                        }
                        .frame(height: 270)
                    }
                
                HStack {
                    
                    Text("More")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                    
                    Spacer()
                    
                }
                .padding(.vertical)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack {
                        
                        Button(action: {
                            
                            guard let url = URL(string: "https://www.termsfeed.com/live/59928f94-c718-49f6-8866-919b948a8513") else { return }
                            
                            UIApplication.shared.open(url)
                            
                        }, label: {
                            
                            VStack(spacing: 13) {
                                
                                Text("Usage Policy")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .semibold))
                                
                                Image(systemName: "doc.text.magnifyingglass")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 32, weight: .semibold))
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim").opacity(0.15)))
                                
                            }
                            .frame(width: 160, height: 140)
                            .background(RoundedRectangle(cornerRadius: 20).stroke(Color("prim")))
                            .padding(1)
                        })
                        
                        Button(action: {
                            
                            SKStoreReviewController.requestReview()
                            
                        }, label: {
                            
                            VStack(spacing: 13) {
                                
                                Text("Rate our app")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .semibold))
                                
                                Image(systemName: "heart")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 32, weight: .semibold))
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim").opacity(0.15)))
                                
                            }
                            .frame(width: 160, height: 140)
                            .background(RoundedRectangle(cornerRadius: 20).stroke(Color("prim")))
                            .padding(1)
                        })
                    }
                    
                }
                .frame(height: 110)
                
            }
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isAddTopDocs, content: {
            
            TopDoctors(viewModel: viewModel)
        })
        .onAppear {
            
            viewModel.fetchDocs()
        }
        .sheet(isPresented: $viewModel.isAddOtherDoc, content: {
            
            OtherDoc(viewModel: viewModel)
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
               
                        CoreDataStack.shared.deleteDoc(withDocFunc: viewModel.selectedDoc?.docFunc ?? "", completion: {
                            
                            viewModel.fetchDocs()
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
    HomeView()
}
