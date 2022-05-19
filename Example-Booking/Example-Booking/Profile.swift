//
//  Profile.swift
//  Example-Booking
//
//  Created by 华嵩文 on 2022/5/20.
//

import SwiftUI

struct Profile: View {
    var body: some View {
    
        ScrollView(.vertical, showsIndicators: false, content: {
            HStack{
                NavigationLink(destination: Home(), label: {
                    
                    Image(systemName: "chevron.left").font(.title2).foregroundColor(.white )
                })
            Spacer()
                Button(action: {}, label: {
                    Image(systemName: "person.text.rectangle").font(.title2)
                })
            }
            .overlay(
                Text("Personal Prifile").font(.title2).fontWeight(.semibold)
            )
            .padding()
            .foregroundColor(.white)
            
            VStack{
                VStack{
                    Image("adult").resizable().frame(width: 130/0.7, height: 130).clipShape(Circle())
                    Text(cusName == "" ? "Olivia Parker" : cusName).fontWeight(.bold).font(.title).foregroundColor(.white)
                    
                }
                Spacer().frame(height: 20)
                
                VStack(alignment: .leading, spacing: 13){
                    HStack{
                        Image(systemName: "envelope")
                        Text(cusEmail == "" ? "Olivia@outlook" : cusEmail)
                    }
                    
                    HStack{
                        Image(systemName: "phone")
                        Text(cusPhone == "" ? "0485600034" : cusPhone)
                    }
                    
                    HStack{
                        Image(systemName: "rectangle.stack.badge.person.crop.fill")
                        Text(cusAddress == "" ? "15 Broadway, Ultimo NSW" : cusAddress)
                    }
                }.foregroundColor(.white)
                
                Spacer().frame(height: 30)
                
                NavigationLink(destination: updateProfile(), label: {
                    Text("Update Profile").fontWeight(.bold).foregroundColor(.white).padding(.vertical).frame(maxWidth: .infinity)
                }).background(.black.opacity(0.8)).cornerRadius(20).padding()
            }
            
            
        })
            .background(Color.indigo.ignoresSafeArea())
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }

}




struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
