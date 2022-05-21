//
//  Home.swift
//  Booking-System
//
//  Created by Qingqing Dong on 2022/5/19.
//

import SwiftUI

struct Home: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            LazyVStack(spacing: 15, pinnedViews: [.sectionFooters], content: {
                    Section(footer: FootView(), content: {
                        
                        HStack{
                            NavigationLink(destination: Firstpage(), label: {
                                
                                Image(systemName: "chevron.left").font(.title2).foregroundColor(.white )
                            })
                        
                      
                        Spacer()
                    
              
                            
                            NavigationLink(destination: {
                                Profile()
                            }, label: {
                                Image(systemName: "person").font(.title2)
                            })
                        }
                        .overlay(
                            Text("Detail Restaurant").font(.title2).fontWeight(.semibold)
                        )
                        .padding()
                        .foregroundColor(.white)
                        
                        
                       
                        
                        
                        ZStack{
                            // A view that overlays its children, aligning them in both axes.
                            // Bottom Shadows ....
                            
                            RoundedRectangle(cornerRadius: 15).fill(Color.white.opacity(0.2)).padding(.horizontal).offset(y: 14)
                            
                            Image("restaurant").resizable().aspectRatio(contentMode: .fill).frame(width: getRect().width / 1.2, height: getRect().height / 4, alignment: .center).cornerRadius(15)
                        }
                        .frame(width: getRect().width / 1.2, height: getRect().height / 4, alignment: .center)
                        .padding(.top, 20)
                        
                        VStack(alignment: .leading, spacing: 15, content: {
                            //
                            Text("L'arome  Restaurant").font(.title2).fontWeight(.bold).foregroundColor(.white)
                            
                            Text("Contact Number: 0448300023").foregroundColor(.white)
                            
                            
                            Text("Menu:").font(.title3).fontWeight(.bold).foregroundColor(.white)
                            
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], alignment: .leading, content: {
                                ForEach(menu, id: \.self){
                                    menuText in
                                    Text(menuText).font(.caption).padding(.vertical, 13).frame(maxWidth: .infinity).foregroundColor(.white).background(Color.white.opacity(0.1)).clipShape(Capsule())
                                    
                                }
                            }).padding(.top, 10)
                            


                            
                            Text("Describe").font(.title2).fontWeight(.bold).foregroundColor(.white).padding(.vertical)
                            
                            VStack{
                                ForEach(viewModel.restInfo, id: \.self){value in
                                    Text(value.describe).foregroundColor(.white)
                                    
                                }
                            }.onAppear{
                                viewModel.fetchData()
                            }
                            
                            // Text(describe).foregroundColor(.white)
                            
                            
                        })
                            .padding(.top,55)
                            .padding(.horizontal)
                            .padding(.leading, 10)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    })
            })
        })
        
            .background(Color.indigo.ignoresSafeArea())
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        // Color.brown
        // Color.red
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
.previewInterfaceOrientation(.portrait)
    }
}

struct FootView:View{
    var body: some View{
        NavigationLink(destination: Booking(), label: {
            
            Text("Book Tables ")
                .fontWeight(.bold)
                .foregroundColor(.white).padding(.vertical)
                .frame(width: getRect().width / 2)
                .background(Color.black).cornerRadius(30)
                .opacity(0.8)
                .shadow(color: Color.black.opacity(0.2), radius: 2, x: 2, y: -2)
                .shadow(color: Color.black.opacity(0.2), radius: 2, x: 2, y: -2)
            
        })
    }
}
extension Home{
    class ViewModel: ObservableObject{
        let service = fileService()
        
        @Published var restInfo: [ResInfo] = []

        func fetchData(){
            if let resInfoo = service.fetchJsonFile(){
                self.restInfo = resInfoo.resInfo
            }
        }
    }
}

// extending view to get RECT...
extension View{
    func getRect() ->CGRect{
        return UIScreen.main.bounds
    }
}

