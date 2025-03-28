//
//  Product.swift
//  Warenladen
//
//  Created by Rylie Castell on 26.03.25.
//

import Foundation

// Aufgabe 2.1 Produkt modellieren

struct Product: Hashable {
    var name: String
    var price: Double
    var description: String
    
    // Aufgabe 5.1 Produkt Bewertungen
    var ratings: [String:Int] = [:]
    
    private func enterInteger() -> Int {
            let input: Int? = Int(readLine()!)
            if input == nil {
                return 0
            } else {
                return input!
            }
        }
    
    mutating func addRating(userName: String) {
        print("Bitte bewerten Sie das Produkt \(name) mit 1-5 Sternen. Bitte nutzen Sie ausschließlich Ganzzahlen.")
        var rating: Int = enterInteger()
        while rating < 1 && rating > 5 {
            print("Ungültige Eingabe. Bitte versuchen Sie es erneut.")
            rating = enterInteger()
        }
        
        ratings[userName] = rating
    }
    
    func calculateAverageRating() -> Double {
        var sumAllRatings: Double = 0
        var counter: Double = 0
        for rating in ratings {
            sumAllRatings += Double(rating.value)
            counter += 1
        }
        return sumAllRatings / counter
    }
}
