//
//  restaurantInfo.swift
//  Example-Booking
//
//  Created by Songwen Hua/Qingqing Dong/Chunsong Jin on 2022/5/14.
//

//
import Foundation
import CoreImage.CIFilterBuiltins

var describe = ""
var index = 0
var menu = ["Salade", "Ratatouille", "Cassoulet", "bourguignon", "Soufflé", "Flamiche", "Escargot", "Entrées", "Crêpe"]

var time = ["11:00", "11:45","6:00", "6:45"]
let array = [15, 33, 36, 723, 77, 4]
var storeUrl = "www.shop.com"
var orderList : [OrderInfo] = []
let context = CIContext()
let filter = CIFilter.qrCodeGenerator()


struct OrderInfo{
    var date:String = ""
    var time:String = ""
    var selectedTable0:String = ""
    //var selectedTable1:String = ""
    var price:String = ""
    
    
    init(date: String, time: String, selectedTable0: String, price:String){
        self.date = date
        self.time = time
        self.selectedTable0 = selectedTable0
        //self.selectedTable1 = selectedTable1
        self.price = price
    }
}



