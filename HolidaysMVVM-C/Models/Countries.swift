//
//  Countries.swift
//  HolidaysMVVM-C
//
//  Created by Ali Elsokary on 23/04/2021.
//
//
import ObjectMapper

struct Countries: Mappable {
    var countries: [Country]?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        countries <- map["countries"]
    }
}

struct Country: Mappable {
    var code: String?
    var name: String?
    var flag: String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        code <- map["code"]
        name <- map["name"]
        flag <- map["flag"]
    }
}
