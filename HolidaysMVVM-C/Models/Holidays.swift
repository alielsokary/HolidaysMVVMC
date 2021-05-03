//
//  Holidays.swift
//  HolidaysMVVM-C
//
//  Created by Ali Elsokary on 23/04/2021.
//
//

import Foundation

// MARK: - Holidays
struct Holidays: Codable {
	let status: Int?
	let warning: String?
	let holidays: [Holiday]?
}

// MARK: - Holiday
struct Holiday: Codable {
	let name, date, observed: String?
	let isPublic: Bool?
	let country: String?
	let uuid: String?
	let weekday: Weekday?

	enum CodingKeys: String, CodingKey {
		case name, date, observed
		case isPublic = "public"
		case country, uuid, weekday
	}
}

// MARK: - Weekday
struct Weekday: Codable {
	let date, observed: DateClass?
}

// MARK: - DateClass
struct DateClass: Codable {
	let name, numeric: String?
}
