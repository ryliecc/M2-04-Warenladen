//
//  Store.swift
//  Warenladen
//
//  Created by Rylie Castell on 26.03.25.
//

import Foundation

// Aufgabe 1.0 Einleitung: Store Struct

struct Store {
    // Aufgabe 1.1 Begrüßung
    // Aufgabe 1.2 Nutzernamen speichern
    
    var userName: String = ""
    
    mutating func greet() {
        print("Willkommen im Warenladen. Wie ist Ihr Name?")
        userName = readLine()!
        print("Herzlich Willkommen, \(userName)!")
    }
}
