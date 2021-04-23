//
//  Holidays.swift
//  HolidaysMVVM-C
//
//  Created by Ali Elsokary on 23/04/2021.
//
//

import ObjectMapper

struct Holidays: Mappable {
    var holidays: [Holiday]?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        holidays <- map["holidays"]
    }
}

struct Holiday: Mappable {
    var name: String?
    var date: String?
    var country: String?
    var `public`: Bool?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        name     <- map["name"]
        date     <- map["date"]
        country  <- map["country"]
        `public` <- map["public"]
    }
}
