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
    
//    init() {
//        print("Willkommen zum Registrierungsprozess.")
//        print("Bitte geben Sie Ihren Namen ein.")
//        name = readLine()!
//        print("Bitte geben Sie Ihr gewünschtes Passwort ein.")
//        password = readLine()!
//        print("Bitte geben Sie Ihr Alter ein.")
//        let input: Int? = Int(readLine()!)
//        if input == nil {
//            age = 0
//        } else {
//            age = input!
//        }
//        print("Bitte geben Sie Ihre Adresse ein.")
//        adress = readLine()!
//        let bonusNumber: Int = Int.random(in: 1...5)
//        if bonusNumber == 3 || bonusNumber == 4 {
//            print("Herzlichen Glückwunsch. Sie haben ein gratis Startguthaben von 10€ gewonnen.")
//            balance = 10
//        } else if bonusNumber == 5 {
//            print("Herzlichen Glückwunsch. Sie haben ein gratis Startguthaben von 30€ gewonnen.")
//            balance = 30
//        } else {
//            balance = 0
//        }
//    }
}
