//
//  fileService.swift
//  Example-Booking
//
//  Created by Songwen Hua/Qingqing Dong/Chunsong Jin on 2022/5/20.


import Foundation

class fileService{
    func fetchJsonFile() -> ResDecribe?{
        guard let url = Bundle.main.url(forResource: "data", withExtension: "json") else {
            return nil
        }
        do{
            let data  = try Data(contentsOf: url)
            do{
                let fileData = try JSONDecoder().decode(ResDecribe.self, from: data)
                return fileData
            }catch{
                print(error.localizedDescription)
            }
        }catch{
            print(error.localizedDescription)
        }
        return nil
    }
}
