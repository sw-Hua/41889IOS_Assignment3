//
//  Booking.swift
//  Example-Booking
//
//  Created by 华嵩文 on 2022/5/15.
//

import SwiftUI

struct Booking: View {
    
    @State var bookedTables: [Int] = [0, 5, 10]
    @State var selectedSelects : [Int] = []
    @State var date: Date = Date()
    
    @State var selectedTime = "11:00"
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            // Text("Placeholder");
            // 滚动视图的可滚动轴。
            HStack{
                Button (action: {
                    print(123)
                }, label: {
                    Image(systemName: "chevron.left").font(.title2).foregroundColor(.white )
                })
                Spacer()
            }
            .overlay(
                Text("Select Tables").font(.title2).fontWeight(.semibold).foregroundColor(.white)
            )
            .padding()
            
            
            
            // let totalTables = 60
            let totalTables = 0..<12
            Text("Maximum Select 3 Tables").font(.title3).foregroundColor(.white).fontWeight(.bold)
            HStack(spacing: 30){
                
                let columns = Array(repeating: GridItem(.flexible(), spacing: 13), count: 3)
                
                LazyVGrid(columns: columns, spacing: 13,content: {
                    
                    ForEach(totalTables, id: \.self){index in
                        // 得到正确的Tables  12
                        let table = index <= 14 ? index  : index
                        
                        Table(index: index, table: table, selectedTables: $selectedSelects, bookedTables: $bookedTables ).contentShape(Rectangle()).onTapGesture {
                            // print(table)
                            // check and adding
                            if selectedSelects.contains(table){
                                // removing...
                                selectedSelects.removeAll { (removeTable) -> Bool in
                                    return removeTable == table
                                }
                                return
                            }
                            
                            if (selectedSelects.count <= 2){
                                //adding...
                                selectedSelects.append(table)
                            
                                print(table)
                            }
                            
                            
                            
                        }.disabled(bookedTables.contains(table))// disable if table is booked...
                    }
                })
            }.padding().padding(.top, -6)
            
            HStack(spacing: 17){
                
                // Booked Tables
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.white, lineWidth: 2)
                    .frame(width: 20, height: 20)
                    .overlay(
                        Image(systemName: "xmark").font(.caption).foregroundColor(.white)
                    ).background(Color.gray)
                Text("Booked").font(.caption).foregroundColor(.white)
                
                // selected Selects
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.white, lineWidth: 2)
                    .frame(width: 20, height: 20)
                    .background(Color.blue)
                Text("Selected").font(.caption).foregroundColor(.white)
                
                // Available
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.white, lineWidth: 2)
                    .frame(width: 20, height: 20)
                    
                Text("Available").font(.caption).foregroundColor(.white)
            }.padding(.top, 20)
            
            HStack{
                
                Text("Date:").font(.title3).fontWeight(.bold).foregroundColor(.white)
                
                Spacer()
                
                DatePicker("", selection: $date, displayedComponents: .date).background(.white).cornerRadius(10).font(.title3).frame(width: 130).shadow(color: Color.white, radius: 5, x: 0, y: 0).foregroundColor(.white)
                
            }.padding().padding(.top)
            
            HStack{
                Text("Time:").font(.title3).fontWeight(.bold).foregroundColor(.white)
                
                Spacer()
                
                HStack{
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        HStack(spacing: 15){
                            ForEach(time, id:\ .self){timing in
                                Text(timing).fontWeight(.bold).foregroundColor(selectedTime == timing ? Color.blue: Color.white).padding(.vertical, 15).padding(.horizontal, 40).background(Color.white.opacity(selectedTime == timing ? 1: 0.2)).cornerRadius(20).onTapGesture {
                                    selectedTime = timing
                                }
                            }
                        }.padding(.horizontal).padding(10)
                        
                    })
                }.background(Color.black).cornerRadius(10).opacity(0.8)
                           
            }.padding()
            
            HStack(spacing: 30){
                    
                VStack(alignment: .leading, spacing: 10, content:{
                    Text("\(selectedSelects.count) Tables")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    
                    Text("per $30")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    
                    Text("$\(selectedSelects.count * 30)")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.yellow)
                }).frame(width: 100)
                
                Button(action: {
                    print(selectedSelects)
                }, label: {
                    Text("Book Now").fontWeight(.bold).foregroundColor(.white).padding(.vertical).frame(maxWidth: .infinity)
                }).background(.blue).cornerRadius(20)
            }.padding()
            
            

            
        })
            .background(Color.indigo.ignoresSafeArea())
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
}

struct Table : View{
    var index : Int;
    var table: Int
    
    @Binding var selectedTables: [Int]
    @Binding var bookedTables: [Int]
    
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 6 ).stroke(Color.white, lineWidth: 3).frame(width: 70, height: 50)
                .background(//blue
                    // selectedTables.contains(table) ? Color.blue : Color.clear
                    bookedTables.contains(table) ? Color.gray : Color.clear
                ).background(
                    selectedTables.contains(table) ? Color.blue : Color.clear
                )
                // .opacity(index == 7 || index == 10 ? 0 : 1)
            
            
            if bookedTables.contains(table){
                Image(systemName: "xmark").foregroundColor(bookedTables.contains(table) ? Color.white : Color.clear
                )
            }
            
        }
    }
}




struct Booking_Previews: PreviewProvider {
    static var previews: some View {
        Booking()
    }
}
