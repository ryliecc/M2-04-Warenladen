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
        print("\(product.name): \(product.description)\nPreis: \(String(format: "%.2f", product.price))€\nSoll dieses Produkt wirklich der Produktliste hinzugefügt werden?")
        if validation() {
            products.append(product)
        }
    }
    
    // Aufgabe 2.3 Produkt entfernen
    
    mutating func removeProduct() {
        print("Bitte gib die Nummer des Produkts an, das du entfernen willst, zB. 1 für das erste Produkt.")
        var deleteIndex: Int = enterInteger()
        deleteIndex -= 1
        if deleteIndex < 0 || deleteIndex >= products.count {
            print("Produkt nicht gefunden.")
        } else if validation() {
            products.remove(at: deleteIndex)
        }
        
    }
    
    // Aufgabe 2.4 Top Marken
    
    var brands: [String] = []
    
    func showTopBrands() {
        let sortedBrands: [String] = brands.sorted()
        print("Top Marken: \(sortedBrands)")
    }
    
    // Aufgabe 2.5 Nach Preis sortieren
    
    func showProductsSortedByPrice() {
        let sortedProducts: [Product] = products.sorted {$0.price < $1.price}
        print("Nach Preis sortierte Produkte:")
        for product in sortedProducts {
            print("\(product.name): \(product.description)\nPreis: \(String(format: "%.2f", product.price))€")
        }
    }
    
    // Aufgabe 3.1 Artikelnummern
    
    var productNumbersWithProduct: [Int: Product] = [:]
    
    // Aufgabe 3.2 Produkte abfragen
    
    func searchProductByProductNumber() -> Product? {
        print("Bitte gib die Artikelnummer des gewünschten Produkts ein.")
        let productNumber: Int = enterInteger()
        let searchedProduct: Product? = productNumbersWithProduct[productNumber]
        if searchedProduct == nil {
            print("Produkt nicht gefunden.")
        } else {
            print("Das gesuchte Produkt ist \(searchedProduct!.name)")
        }
        return searchedProduct
    }
    
    // Aufgabe 3.3 Produkt registrieren
    
    mutating func registerProduct(product: Product) {
        var productNumber: Int = Int.random(in: 1...1000)
        while productNumbersWithProduct[productNumber] != nil {
            productNumber = Int.random(in: 1...1000)
        }
        productNumbersWithProduct[productNumber] = product
    }
    
    // Aufgabe 3.4 Barcode
    
    func encrypt(_ number: Int) -> String {
        let stringNumber: String = String(number)
        let code: String = stringNumber.replacing("0", with: " ").replacing("1", with: "▏").replacing("2", with: "▎").replacing("3", with: "▍").replacing("4", with: "▌").replacing("5", with: "▋").replacing("6", with: "▊").replacing("7", with: "▉").replacing("8", with: "█").replacing("9", with: "▐")
        return code
    }
    
    func decrypt(_ barcode: String) -> Int {
        let decodedString: String = barcode.replacing(" ", with: "0").replacing("▏", with: "1").replacing("▎", with: "2").replacing("▍", with: "3").replacing("▌", with: "4").replacing("▋", with: "5").replacing("▊", with: "6").replacing("▉", with: "7").replacing("█", with: "8").replacing("▐", with: "9")
        return Int(decodedString)!
    }
    
    // Aufgabe 3.5 Warenkorb
    
    var shoppingCart: [Product:Int] = [:]
    
    mutating func putProductInShoppingCart() {
        print("Welches Produkt möchten Sie kaufen?")
        let product: Product? = searchProductByProductNumber()
        if product != nil {
            print("Wieviele Produkte möchten Sie kaufen?")
            let amount: Int = enterInteger()
            print("Sind Sie sicher, dass Sie \(amount)x \(product!.name) in den Warenkorb legen möchten?")
            if validation() {
                shoppingCart[product!] = amount
            }
        }
    }
    
    // Aufgabe 4.1 Produkte ausgeben
    
    func printProducts() {
        for product in products {
            print("\(product.name): \(product.description)\nPreis: \(String(format: "%.2f", product.price))€")
        }
    }
    
    // Aufgabe 4.2 Artikelnummern ausgeben
    
    func printProductsWithProductNumber() {
        for productNumber in productNumbersWithProduct {
            print("ℹ️ \(productNumber.key) \(productNumber.value.name)")
        }
    }
}
