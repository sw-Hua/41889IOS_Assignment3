//
//  Order.swift
//  Example-Booking
//
//  Created by 华嵩文 on 2022/5/17.
//

import SwiftUI



struct Order: View {

    @State var myArray : [Int] = []

    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false, content: {
            HStack{
                NavigationLink(destination: Home(), label: {
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
                    
                    Text(", ").foregroundColor(.white).fontWeight(.bold) // 表达式
                    
                    Text(UserDefaults.standard.string(forKey: "selectedTable1") ?? "").font(.title3).foregroundColor(.white).fontWeight(.bold)
                    
                    
            }.padding()

                HStack{
                    Text("Total Price: $ ").font(.title3).foregroundColor(.white).fontWeight(.bold)
                    
                    
                    Text(UserDefaults.standard.string(forKey: "totalPrice") ?? "").font(.title3).foregroundColor(.white).fontWeight(.bold)
                    

                    
                    
            }.padding()
                
                
            }.padding().padding(.top, 150).padding(.bottom, 150).background(.black.opacity(0.5)).cornerRadius(20)
            
            
            NavigationLink(destination: Home(), label: {
                Text("Finish").fontWeight(.bold).foregroundColor(.white).padding(.vertical).frame(maxWidth: 150)
            }).background(.blue).cornerRadius(20).padding()
            
            
        }).background(Color.indigo.ignoresSafeArea())
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}


struct Order_Previews: PreviewProvider {
    static var previews: some View {
        Order()
    }
}
