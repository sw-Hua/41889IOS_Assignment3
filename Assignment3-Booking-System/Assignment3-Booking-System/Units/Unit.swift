//
//  Unit.swift
//  Assignment3-Booking-System
//
//  Created by Songwen Hua/Qingqing Dong/Chunsong Jin on 2022/5/21.

import Foundation
import CoreImage.CIFilterBuiltins
import SwiftUI

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
