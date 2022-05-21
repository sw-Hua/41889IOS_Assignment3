//
//  CustomerInfo.swift
//  Example-Booking
//
//  Created by Songwen Hua/Qingqing Dong/Chunsong Jin on 2022/5/20.
//

import Foundation

// MARK: - ResDecribe
struct ResDecribe: Codable, Hashable {
    var resInfo: [ResInfo]
}

// MARK: - ResInfo
struct ResInfo: Codable, Hashable {
    var describe: String
}
