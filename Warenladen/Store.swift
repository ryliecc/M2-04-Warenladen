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
    
    // 1.3 Eingabe einer Ganzzahl
    
    func enterInteger() -> Int {
        print("Bitte gib eine Ganzzahl ein.")
        let input: Int? = Int(readLine()!)
        if input == nil {
            return 0
        } else {
            return input!
        }
    }
    
    // Aufgabe 1.4 Ja/Nein Eingabe
    
    func validation() -> Bool {
        print("Bitte bestätigen Sie: (ja/nein)")
        var input: String = readLine()!
        while input.lowercased() != "nein" && input.lowercased() != "ja" {
            print("Falsche Eingabe.")
            print("Bitte bestätigen Sie: (ja/nein)")
            input = readLine()!
        }
        return input.lowercased() == "ja"
    }
    
    // Aufgabe 2.2 Produkte erstellen und hinzufügen
    
    var products: [Product] = []
    
    mutating func loadProducts(_ product1: Product,_ product2: Product,_ product3: Product,_ product4: Product,_ product5: Product,_ product6: Product,_ product7: Product,_ product8: Product,_ product9: Product,_ product10: Product) {
        products = [product1, product2, product3, product4, product5, product6, product7, product8, product9, product10]
    }
    
    mutating func addProduct() {
        var product: Product = Product(name: "", price: 0, description: "")
        print("Bitte gib den Namen des Produkts ein.")
        product.name = readLine()!
        print("Bitte gib den Preis des Produkts ein.")
        let input: Double? = Double(readLine()!)
        if input != nil {
            product.price = input!
        }
        print("Bitte gib eine kurze Produktbeschreibung ein.")
        product.description = readLine()!
        products.append(product)
    }
    
    mutating func removeProduct() {
        print("Bitte gib die Nummer des Produkts an, das du entfernen willst, zB. 1 für das erste Produkt.")
        var deleteIndex: Int = enterInteger()
        deleteIndex -= 1
        if deleteIndex < 0 || deleteIndex >= products.count {
            print("Produkt nicht gefunden.")
        } else {
            products.remove(at: deleteIndex)
        }
        
    }
    
    // Aufgabe 3.1 Artikelnummern
    
    var productNumbersWithProduct: [Int: Product] = [:]
    
    // Aufgabe 3.2 Produkte abfragen
    
    func searchProductByProductNumber() {
        print("Bitte gib die Artikelnummer des gewünschten Produkts ein.")
        let productNumber: Int = enterInteger()
        let searchedProduct: Product? = productNumbersWithProduct[productNumber]
        if searchedProduct == nil {
            print("Produkt nicht gefunden.")
        } else {
            print("Das gesuchte Produkt ist \(searchedProduct!)")
        }
    }
    
    // Aufgabe 3.3 Produkt registrieren
    
    mutating func registerProduct(product: Product) {
        var productNumber: Int = Int.random(in: 1...1000)
        while productNumbersWithProduct[productNumber] != nil {
            productNumber = Int.random(in: 1...1000)
        }
        productNumbersWithProduct[productNumber] = product
    }
}
