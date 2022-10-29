//
//  Car.swift
//  carmatch
//
//  Created by Sogah Mainib on 10/28/22.
//

import Foundation


struct Car:Identifiable {
    var id: Int
    var vin: String
    var year: Int
    var make: String
    var model: String
    var trim: String
    var miles: Int
    var price: Int
    var sellerID: Int
    var imgs: [String]
}

