//
//  Order.swift
//  Example-Booking
//
//  Created by Songwen Hua on 2022/5/20.
//

import SwiftUI



struct OrderList: View {

    @State var myArray : [Int] = []
    // @State var orderList : [OrderInfo] = []
    
    let url:String
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false, content: {
            
            HStack{
                NavigationLink(destination: Booking(), label: {
                    Image(systemName: "chevron.left").font(.title2).foregroundColor(.white )
                })
                
                
                
                Spacer()
            }
            .overlay(
                Text("History Orders").font(.title2).fontWeight(.semibold).foregroundColor(.white)
            )
            .padding()
            
            VStack{
                Text("My Orders: ").fontWeight(.bold).foregroundColor(.white).frame(maxWidth: .infinity).padding()
                
                VStack{
                    ForEach(orderList, id: \.date){item in
                        
                        VStack{
                            Text("Date: \(item.date)").fontWeight(.bold).foregroundColor(.white).padding(.vertical).frame(maxWidth: .infinity)
                            Text("time: \(item.time)").fontWeight(.bold).foregroundColor(.white).padding(.vertical)
                            Text("selectedTable: \(item.selectedTable0)").fontWeight(.bold).foregroundColor(.white).padding(.vertical)
                            Text("price: \(item.price)").fontWeight(.bold).foregroundColor(.white).padding(.vertical).padding(.bottom, 20)
                            HStack{
                                Text("Booking QR Code:  ").font(.title3).foregroundColor(.white).fontWeight(.bold)
                                
                                Image(uiImage: generateQRCodeImage(url)).interpolation(.none).resizable().frame(width: 100, height: 100, alignment: .center).cornerRadius(10)
                                
                        
                            
                                
                        }.padding()
                        }.padding().padding(.top, 20).padding(.bottom, 20).background(.white.opacity(0.08)).cornerRadius(20).frame(width: 300)
                        Spacer()
                    }
                }
            
                
                
            }
            
            NavigationLink(destination: Home(), label: {
                Text("Finish").fontWeight(.bold).foregroundColor(.white).padding(.vertical).frame(maxWidth: .infinity)
            }).background(.black.opacity(0.8)).cornerRadius(20).padding()


        
        }).background(Color.indigo.ignoresSafeArea())
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}


struct OrderList_Previews: PreviewProvider {
    static var previews: some View {
        OrderList(url: storeUrl)
    }
}
