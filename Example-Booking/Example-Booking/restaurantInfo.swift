//
//  restaurantInfo.swift
//  Example-Booking
//
//  Created by 华嵩文 on 2022/5/14.
//
import Foundation
import SwiftUI
import CoreImage.CIFilterBuiltins

var describe = "J'Go L'arome brings the latest Parisian trend, Bistronomie, to Sydney, with its Michelin quality and the relaxation of a corner bistro. The large, open kitchen is a popular feature, bringing the chef closer to the guests and making the preparation process more enjoyable and relaxing. With a few strokes of the brush, you can sense the French freedom and romantic elegance with just a glance. A graduate of the Paul Bocuse Institute, Lyon, France's top western culinary and hospitality school, Fang Fang's chef has worked in several Michelin-starred restaurants in France, and is particularly adept at presenting the art of French cuisine in a simple, natural yet refined way."

var menu = ["Salade", "Ratatouille", "Cassoulet", "bourguignon", "Soufflé", "Flamiche", "Escargot", "Entrées", "Crêpe"]

var time = ["11:00", "11:45",
            "6:00", "6:45"]

let array = [15, 33, 36, 723, 77, 4]

var storeUrl = "www.shop.com"

var orderList : [OrderInfo] = []

struct OrderInfo{
    var date:String = ""
    var time:String = ""
    var selectedTable0:String = ""
    var selectedTable1:String = ""
    var price:String = ""
    
    
    init(date: String, time: String, selectedTable0: String, selectedTable1:String, price:String){
        self.date = date
        self.time = time
        self.selectedTable0 = selectedTable0
        self.selectedTable1 = selectedTable1
        self.price = price
    }
}


let context = CIContext()
let filter = CIFilter.qrCodeGenerator()

func generateQRCodeImage(_ url: String) -> UIImage{
    // in the future
    let data = Data(url.utf8)
    filter.setValue(data, forKey: "inputMessage")
    
    if let qrCodeImage = filter.outputImage{
        if let qrCodeCGImage = context.createCGImage(qrCodeImage, from: qrCodeImage.extent ){
            return UIImage(cgImage: qrCodeCGImage)
        }
    }
        return UIImage(systemName: "xmark") ?? UIImage()
    }
