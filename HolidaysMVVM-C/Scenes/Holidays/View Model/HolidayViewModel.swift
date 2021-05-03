//
//  HolidayViewModel.swift
//  HolidaysMVVM-C
//
//  Created by Ali Elsokary on 23/04/2021.
//
//

import RxSwift

struct HolidayViewModel {
    
    let didClose = PublishSubject<Void>()
    
    let title: String
    let date: String
    let country: String
    let isPublic: Bool
    
    init(holiday: Holiday) {
        
        self.title = holiday.name!
        self.date = holiday.date!
        self.country = holiday.country!
        self.isPublic = holiday.isPublic!
    }
    
}
