//
//  firstpage.swift
//  Example-Booking
//
//  Created by apple on 2022/5/17.
//

import Foundation
import SwiftUI

struct Firstpage: View {
    var body: some View{
        
        ScrollView(.vertical, showsIndicators: false, content: {
            LazyVStack(spacing: 15, pinnedViews: [.sectionFooters], content: {
                Section(footer: FootView1(), content: {
                    ZStack{
                        
                        
                     
                        Text("Welcome To").font(.title).fontWeight(.bold)
                        
                        Text("L'arome Restaurant").font(.title).fontWeight(.bold).padding(.top,70)
                    }
                    .frame(width: getRect().width / 1.2, height: getRect().height / 4, alignment: .center)
                    .padding(.top, 250)
                    
                })
                
            })
            
            
        })
            .background(Image("firstbg"))
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
                   
     
    }
}

struct FootView1:View{
    var body: some View{
        NavigationLink(destination: Home(), label: {
            
            Text("Enter")
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

struct FirstpageView_Previews: PreviewProvider {
    static var previews: some View {
        Firstpage()
    }
}
