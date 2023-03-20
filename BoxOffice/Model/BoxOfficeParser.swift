//
//  BoxOfficeParser.swift
//  BoxOffice
//
//  Created by goat, 송준 on 2023/03/20.
//

import UIKit

enum BoxOfficeParser {
    
    static func boxOfficeParse() -> BoxOffice {
        var boxOffice = BoxOffice(boxOfficeResult: BoxOfficeResult(boxOfficeType: "", showRange: "", dailyBoxOfficeList: []))
        let jsonDecoder = JSONDecoder()
        
        guard let jsonData: NSDataAsset = NSDataAsset(name: "box_office_sample") else {
            print("jsonData 없음")
            return boxOffice
        }
        
//        do {
//            boxOffice = try jsonDecoder.decode(BoxOffice.self, from: jsonData.data)
//            return boxOffice
//        } catch {
//            print("decode없음")
//            return boxOffice
//        }
        if let data = try? jsonDecoder.decode(BoxOffice.self, from: jsonData.data) {
            print("data = \(data.boxOfficeResult.boxOfficeType)")
            return data
        }
        return boxOffice
    }
}
