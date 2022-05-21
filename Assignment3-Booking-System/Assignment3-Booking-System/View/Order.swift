//
//  Order.swift
//  Example-Booking
//
//  Created by Songwen Hua on 2022/5/20.
//
import Foundation
import SwiftUI
import CoreImage.CIFilterBuiltins


struct Order: View {

    @State var myArray : [Int] = []
    @State var alertIsTure = false
    @State var alertIsTure2 = false
    
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
                Text("Select Tables").font(.title2).fontWeight(.semibold).foregroundColor(.white)
            )
            .padding()
            
            VStack{
                HStack{
                    Text("Date: ").font(.title3).foregroundColor(.white).fontWeight(.bold)
                    
                    
                    Text(UserDefaults.standard.string(forKey: "Date") ?? "").font(.title3).foregroundColor(.white).fontWeight(.bold)
                }.padding()
                
                
                HStack{
                    Text("Spesific Time: ").font(.title3).foregroundColor(.white).fontWeight(.bold)
                    
                    
                    Text(UserDefaults.standard.string(forKey: "selectedTiming") ?? "").font(.title3).foregroundColor(.white).fontWeight(.bold)
                }.padding()
                
                HStack{
                    Text("Selected Table Number: ").font(.title3).foregroundColor(.white).fontWeight(.bold)
                    
                    
                    Text(UserDefaults.standard.string(forKey: "selectedTable0") ?? "").font(.title3).foregroundColor(.white).fontWeight(.bold)
                    
                    
                    
                    
                    
            }.padding()

                HStack{
                    Text("Total Price: $ ").font(.title3).foregroundColor(.white).fontWeight(.bold)
                    
                    
                    Text(UserDefaults.standard.string(forKey: "totalPrice") ?? "").font(.title3).foregroundColor(.white).fontWeight(.bold)
                    
            
                
                    
            }.padding()

                
                
                HStack{
                    Text("Booking QR Code:  ").font(.title3).foregroundColor(.white).fontWeight(.bold)
                    
                    Image(uiImage: generateQRCodeImage(url)).interpolation(.none).resizable().frame(width: 140, height: 140, alignment: .center).cornerRadius(10)
                    
            
                
                    
            }.padding()

            }.padding().padding(.top, 50).padding(.bottom, 50).background(.white.opacity(0.08)).cornerRadius(20)
            
            HStack{
                Button(action: {
                    let thisOrer = OrderInfo(date: UserDefaults.standard.string(forKey: "Date") ?? "", time: UserDefaults.standard.string(forKey: "selectedTiming") ?? "", selectedTable0: UserDefaults.standard.string(forKey: "selectedTable0") ?? "", price: UserDefaults.standard.string(forKey: "totalPrice") ?? "")
                    
                
                    orderList.append(thisOrer)

                    for value in orderList{
                        print(value.date)
                    }
                    
                    // UserDefaults.standard.set(orderList, forKey: "orderListt")
                    
                }, label: {
                    Text("Save").fontWeight(.bold).foregroundColor(.white).padding(.vertical).frame(maxWidth: 150)
                }).background(.black.opacity(0.7)).cornerRadius(20).padding()
                
                
                NavigationLink(destination: OrderList(url: storeUrl), label: {
                    Text("History Order").fontWeight(.bold).foregroundColor(.white).padding(.vertical).frame(maxWidth: 150)
                }).background(.black.opacity(0.7)).cornerRadius(20).padding()
                
                
            }
            

            
            
        }).background(Color.indigo.ignoresSafeArea())
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
//    func generateQRCodeImage(_ url: String) -> UIImage{
//        // in the future
//        let data = Data(url.utf8)
//        filter.setValue(data, forKey: "inputMessage")
//
//        if let qrCodeImage = filter.outputImage{
//            if let qrCodeCGImage = context.createCGImage(qrCodeImage, from: qrCodeImage.extent ){
//                return UIImage(cgImage: qrCodeCGImage)
//            }
//        }
//            return UIImage(systemName: "xmark") ?? UIImage()
//        }
        
    }
    





struct Order_Previews: PreviewProvider {
    static var previews: some View {
        Order(url: storeUrl)
    }
}
