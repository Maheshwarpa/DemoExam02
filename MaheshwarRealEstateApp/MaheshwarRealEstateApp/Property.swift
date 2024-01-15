//
//  Property.swift
//  MaheshwarRealEstateApp
//
//  Created by Maheshwar Punyam Anand on 1/14/24.
//

import Foundation

struct Property{
    let name:String
    let address:String
    let price:Double
    let propertyImage:String
    let numberOfBedrooms:Int
    let numberOfBathrooms:Int
    
    
    static var data:[Property] = [
    Property(name: "Property 1", address: "123 Main St", price: 500000, propertyImage: "property1", numberOfBedrooms: 3, numberOfBathrooms: 2),
    Property(name: "Property 2", address: "123 Quin St", price: 600000, propertyImage: "property2", numberOfBedrooms: 4, numberOfBathrooms: 1),
    Property(name: "Property 3", address: "456 Mapple Ave", price: 750000, propertyImage: "property3", numberOfBedrooms: 4, numberOfBathrooms: 3),
    Property(name: "Property 4", address: "456 Mulburry Ave", price: 800000, propertyImage: "property4", numberOfBedrooms: 5, numberOfBathrooms: 2),
    Property(name: "Property 5", address: "789 Oak St", price: 1100000, propertyImage: "property5", numberOfBedrooms: 5, numberOfBathrooms: 4),
    Property(name: "Property 6", address: "321 Elm St", price: 1500000, propertyImage: "property6", numberOfBedrooms: 9, numberOfBathrooms: 5),
    ]
    
    static var first:[Property] = []
    static var second:[Property] = []
    static var third:[Property] = []
    static var purchased:[Property] = []
    
    
    static var section = ["$500,000 - $750,000","$750,000 - $1,000,000","Over $1000,000","Purchased"]
    
}
