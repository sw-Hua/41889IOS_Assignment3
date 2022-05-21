//
//  Profile.swift
//  Example-Booking
//
//  Created by Chunsong Jin on 2022/5/20.
//

import SwiftUI

struct updateProfile: View {
    
    @State var name:String = ""
    @State var email:String = ""
    @State var phone:String = ""
    @State var address:String = ""
    
    
    var body: some View {
    
        ScrollView(.vertical, showsIndicators: false, content: {
            HStack{
                NavigationLink(destination: Profile(), label: {
                    
                    Image(systemName: "chevron.left").font(.title2).foregroundColor(.white )
                })
            Spacer()
                Button(action: {}, label: {
                    Image(systemName: "pencil.circle").font(.title2)
                })
            }
            .overlay(
                Text("Update Prifile").font(.title2).fontWeight(.semibold)
            )
            .padding()
            .foregroundColor(.white)
            
            VStack{

                Spacer().frame(height: 20)
                
                VStack{
                    HStack{
                        Text("Name: ").font(.title2).foregroundColor(.white).fontWeight(.bold).padding().frame(width: 130)
                        
                        TextField("Name", text: $name).textFieldStyle(RoundedBorderTextFieldStyle()).padding().frame(width: .infinity)
                    }.padding(.top, 20)
        
                    HStack{
                        Text("Email: ").font(.title2).foregroundColor(.white).fontWeight(.bold).padding().frame(width: 130)
                        
                        TextField("Email", text: $email).textFieldStyle(RoundedBorderTextFieldStyle()).padding().frame(width: .infinity)
                    }
                    
                    HStack{
                        Text("Phone: ").font(.title2).foregroundColor(.white).fontWeight(.bold).padding().frame(width: 130)
                        
                        TextField("Phone", text: $phone).textFieldStyle(RoundedBorderTextFieldStyle()).padding().frame(width: .infinity)
                    }
                    
                    HStack{
                        Text("Address: ").font(.title2).foregroundColor(.white).fontWeight(.bold).padding().frame(width: 130)
                        
                        TextField("Address", text: $address).textFieldStyle(RoundedBorderTextFieldStyle()).padding().frame(width: .infinity)
                    }.padding(.bottom, 100)
                    HStack{
                        Button(action: {
                            cusName = name
                            cusEmail = email
                            cusPhone = phone
                            cusAddress = address
        //                    print(name)
        //                    print(email)
        //                    print(phone)
        //                    print(website)

                        }, label: {
                            Text("Save").fontWeight(.bold).foregroundColor(.white).padding(.vertical).frame(maxWidth: .infinity)
                        }).background(.black.opacity(0.8)).cornerRadius(20).padding()
                        
                        NavigationLink(destination: Profile(), label: {
                            Text("Update").fontWeight(.bold).foregroundColor(.white).padding(.vertical).frame(maxWidth: .infinity)
                        }).background(.black.opacity(0.8)).cornerRadius(20).padding()
                    }
                    
                }


            }
            
            
        })
            .background(Color.indigo.ignoresSafeArea())
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }

}




struct updateProfile_Previews: PreviewProvider {
    static var previews: some View {
        updateProfile()
    }
}
