//
//  Store.swift
//  Warenladen
//
//  Created by Rylie Castell on 26.03.25.
//

import Foundation

// Aufgabe 1.0 Einleitung: Store Struct

struct Store {
    // Zusatz weil ich so schönere Printausgaben bauen kann.
    var name: String
    
    // Aufgabe 1.1 Begrüßung
    // Aufgabe 1.2 Nutzernamen speichern
    
    var currentUser: String = ""
    
    mutating func greet() {
        print("Willkommen im Laden '\(name)'. Wie ist Ihr Username?")
        currentUser = readLine()!
        if let currentCustomer = customers.first(where: { $0.name == currentUser }) {
            checkPassword(currentCustomer)
        } else {
            createNewUser()
        }
        print("Herzlich Willkommen, \(currentUser)!")
    }
    
    // 1.3 Eingabe einer Ganzzahl
    
    private func enterInteger() -> Int {
        let input: Int? = Int(readLine()!)
        if input == nil {
            return 0
        } else {
            return input!
        }
    }
    
    // Aufgabe 1.4 Ja/Nein Eingabe
    
    private func validation() -> Bool {
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
        print("\(product.name): \(product.description)\nPreis: \(String(format: "%.2f", product.price))€\nSoll dieses Produkt wirklich der Produktliste von \(name) hinzugefügt werden?")
        if validation() {
            products.append(product)
        }
    }
    
    // Aufgabe 2.3 Produkt entfernen
    
    mutating func removeProduct() {
        print("Bitte gib die Nummer des Produkts an, das du aus der Produktliste von \(name) entfernen willst.")
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
        print("Nach Preis sortierte Produkte von \(name):")
        for product in sortedProducts {
            print("\(product.name): \(product.description)\nPreis: \(String(format: "%.2f", product.price))€")
        }
    }
    
    // Aufgabe 3.1 Artikelnummern
    
    var productNumbersWithProduct: [Int: Product] = [:]
    
    // Aufgabe 3.2 Produkte abfragen
    
    func searchProductByProductNumber() -> Product? {
        print("Bitte gib die Artikelnummer des gewünschten Produkts aus der Produktliste von \(name) ein.")
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
        var productNumber: Int = Int.random(in: 1...99999)
        while productNumbersWithProduct[productNumber] != nil {
            productNumber = Int.random(in: 1...99999)
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
        print("Produktliste des Ladens \(name)")
        for product in products {
            let averageRating: Double = product.calculateAverageRating()
            print("\(product.name): \(product.description)\nPreis: \(String(format: "%.2f", product.price))€\nBewertung: \(averageRating > 0 ? String(format: "%.1f", averageRating) + " Sterne" : "Noch keine Bewertungen")")
        }
    }
    
    // Aufgabe 4.2 Artikelnummern ausgeben
    
    func printProductsWithProductNumber() {
        print("Artikelnummerliste des Ladens \(name)")
        for productNumber in productNumbersWithProduct {
            print("ℹ️ \(productNumber.key) \(productNumber.value.name)")
        }
    }
    
    // Aufgabe 4.3 Range an Produkten ausgeben
    
    func printProcutsWithRange() {
        print("Bitte geben Sie den Bereich an, den Sie erhalten möchten, beginnend bei 1.")
        print("Alle Produkte AB:")
        let indexStart: Int = enterInteger() - 1
        print("Alle Produkte BIS:")
        let indexEnd: Int = enterInteger() - 1
        for (index, product) in products.enumerated() {
            if index >= indexStart && index <= indexEnd {
                print("\(product.name): \(product.description)\nPreis: \(String(format: "%.2f", product.price))€")
            }
        }
    }
    
    // Aufgabe 4.4 Gesamtwert berechnen
    
    func calculateTotalValue() {
        var totalValue: Double = 0
        for product in products {
            totalValue += product.price
        }
        print("Der Gesamtwert im Lager von \(name) liegt bei \(String(format: "%.2f", totalValue))€")
    }
    
    // Aufgabe 4.5 Checkout
    
    func checkout() {
        var totalValue: Double = 0
        for product in shoppingCart {
            totalValue += product.key.price * Double(product.value)
        }
        print("Der Gesamtpreis aller Artikel im Warenkorb beträgt \(String(format: "%.2f", totalValue))€.")
    }
    
    // Aufgabe 5.2
    
    func filterProducts() {
        print("Folgende Filter sind verfügbar:\n1 - Nach Preis filtern\n2 - Nach Bewertung filtern\n3 - Nach Namen filtern\nBitte geben Sie die Zahl des gewünschten Filters ein:")
        var chosenFilter: Int = enterInteger()
        while chosenFilter <= 0 || chosenFilter >= 4 {
            print("Falsche Eingabe. Bitte versuchen Sie es erneut.")
            chosenFilter = enterInteger()
        }
        if chosenFilter == 1 {
            print("Bitte geben Sie einen Maximalpreis in ganzen Euro ein.")
            let maxPrice: Int = enterInteger()
            for product in products {
                if product.price <= Double(maxPrice) {
                    let averageRating: Double = product.calculateAverageRating()
                    print("\(product.name): \(product.description)\nPreis: \(String(format: "%.2f", product.price))€\nBewertung: \(averageRating > 0 ? String(format: "%.1f", averageRating) + " Sterne" : "Noch keine Bewertungen")")
                }
            }
        }
        if chosenFilter == 2 {
            print("Bitte geben Sie eine Mindestanzahl an Sternen (1-5) ein.")
            var minStars: Int = enterInteger()
            while minStars <= 0 || minStars >= 6 {
                print("Falsche Eingabe. Bitte versuchen Sie es erneut.")
                minStars = enterInteger()
            }
            for product in products {
                let averageRating: Double = product.calculateAverageRating()
                if Double(minStars) <= averageRating {
                    print("\(product.name): \(product.description)\nPreis: \(String(format: "%.2f", product.price))€\nBewertung: \(averageRating > 0 ? String(format: "%.1f", averageRating) + " Sterne" : "Noch keine Bewertungen")")
                }
            }
        }
        if chosenFilter == 3 {
            print("Bitte geben Sie den Namen oder Teil des Namens der gesuchten Artikel ein.")
            let filterText: String = readLine()!
            for product in products {
                if product.name.contains(filterText) {
                    let averageRating: Double = product.calculateAverageRating()
                    print("\(product.name): \(product.description)\nPreis: \(String(format: "%.2f", product.price))€\nBewertung: \(averageRating > 0 ? String(format: "%.1f", averageRating) + " Sterne" : "Noch keine Bewertungen")")
                }
            }
        }
    }
    
    // Aufgabe 5.4 Kunden Struct
    
    var customers: [Customer]
    
    mutating func createNewUser() {
        print("Willkommen zum Registrierungsprozess.")
        print("Bitte geben Sie Ihr gewünschtes Passwort ein.")
        let password: String = readLine()!
        print("Bitte geben Sie Ihr Alter ein.")
        var age: Int
        let input: Int? = Int(readLine()!)
        if input == nil {
            age = 0
        } else {
            age = input!
        }
        print("Bitte geben Sie Ihre Adresse ein.")
        let adress: String = readLine()!
        let bonusNumber: Int = Int.random(in: 1...5)
        var balance: Double = 0
        if bonusNumber == 3 || bonusNumber == 4 {
        print("Herzlichen Glückwunsch. Sie haben ein gratis Startguthaben von 10€ gewonnen.")
            balance = 10
        } else if bonusNumber == 5 {
        print("Herzlichen Glückwunsch. Sie haben ein gratis Startguthaben von 30€ gewonnen.")
            balance = 30
        }
        let newCustomer: Customer = Customer(name: currentUser, password: password, age: age, adress: adress, balance: balance)
        customers.append(newCustomer)
    }
    
    private func checkPassword(_ customer: Customer) {
        print("Bitte geben Sie Ihr Password ein.")
        var input: String = readLine()!
        var isPasswordCorrect: Bool = input == customer.password
        while !isPasswordCorrect {
            print("Falsches Passwort. Bitte versuchen Sie es erneut.")
            input = readLine()!
            isPasswordCorrect = input == customer.password
        }
    }
}
