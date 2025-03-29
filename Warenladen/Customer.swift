//
//  Customer.swift
//  Warenladen
//
//  Created by Rylie Castell on 29.03.25.
//

import Foundation

// Aufgabe 5.4 Kunden Struct

struct Customer {
    var name: String
    var password: String
    var age: Int
    var adress: String
    var balance: Double
    
    mutating func addBalance() {
        print("Wieviel Guthaben möchten Sie hinzufügen?")
        let input: Double? = Double(readLine()!)
        if input != nil {
            balance += input!
        }
    }
}
