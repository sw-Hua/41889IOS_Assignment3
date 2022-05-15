//
//  ContentView.swift
//  Example-Booking
//
//  Created by 华嵩文 on 2022/5/12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            Home().navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
