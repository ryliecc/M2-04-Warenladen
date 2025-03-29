import Foundation

// Ablage für später benötigte Instanzen

var product1: Product = Product(name: "Nintendo 2DS", price: 99.99, description: "Handheld console from Nintendo that works just like the famous 3DS, just without the 3D feature.")
var product2: Product = Product(name: "Mario Kart 8", price: 34.99, description: "Mario Kart for the Switch!")
var product3: Product = Product(name: "The Sims 25th Anniversary Bundle", price: 30.00, description: "Includes The Sims and The Sims 2 with all add-ons.")
var product4: Product = Product(name: "The Sims 4: Parenthood", price: 39.99, description: "A Sims 4 Gameplay Pack that focuses on the joys of parenthood.")
var product5: Product = Product(name: "Animal Crossing New Leaf", price: 39.99, description: "The best Animal Crossing ever made for the 3DS.")
var product6: Product = Product(name: "Red Dead Redemption 2", price: 34.99, description: "A famous cowboy video game.")
var product7: Product = Product(name: "Blathers Amiibo", price: 19.99, description: "An Amiibo with an NFC Chip for Animal Crossing Games on WiiU, 3DS and Switch.")
var product8: Product = Product(name: "Mario T-Shirt", price: 12.99, description: "Show your loyalty to the moustache!")
var product9: Product = Product(name: "Howl's Movong Castle DVD", price: 11.89, description: "The best Ghibli movie - now on DVD to watch it again and again and again and again and...")
var product10: Product = Product(name: "XBox Controller", price: 24.99, description: "A controller for the XBox Console that also works with Windows PCs.")

var customer1: Customer = Customer(name: "isabelleFan13", password: "iNeed99Bells!", age: 28, adress: "Sterniweg 4, 02642 Mori", balance: 382.42)
var customer2: Customer = Customer(name: "nookLover22", password: "TomNookIsRich!", age: 35, adress: "Inselstraße 7, 12345 Nooktown", balance: 1050.75)
var customer3: Customer = Customer(name: "kappnRider", password: "BoatTrip4Life", age: 42, adress: "Hafenweg 12, 56789 Schildkrötenbucht", balance: 259.30)

var store1: Store = Store(name: "Game Paradise", customers: [customer1, customer2, customer3])

// Aufgabe 1.1 Begrüßung

//store1.greet()

// Aufgabe 1.2 Nutzernamen speichern
// Test erfolgreich, siehe erweiterete Methode .greet()

// 1.3 Eingabe einer Ganzzahl
// Test erfolgreich, wurde in entsprechenden Methoden integriert

// Aufgabe 1.4 Ja/Nein Eingabe
// Test erfolgreich, wurde in entsprechenden Methoden integriert

// Aufgabe 2.2 Produkte erstellen und hinzufügen


store1.loadProducts(product1, product2, product3, product4, product5, product6, product7, product8, product9, product10)
    // Aufgabe 4.1 Produkte ausgeben
//store1.printProducts()
//
//store1.addProduct()
//store1.printProducts()

// Aufgabe 2.3 Produkt entfernen

//store1.removeProduct()
//store1.printProducts()

// Aufgabe 2.4 Top Marken

store1.brands = ["Nintendo", "Xbox", "SanDisk", "Electronic Arts", "Studio Ghibli"]

//store1.showTopBrands()

// Aufgabe 2.5 Nach Preis sortieren

//store1.showProductsSortedByPrice()

// Aufgabe 3.1 Artikelnummern

for product in store1.products {
    store1.registerProduct(product: product)
}
        // Aufgabe 4.2 Artikelnummern ausgeben
//store1.printProductsWithProductNumber()

// Aufgabe 3.2 Produkte abfragen

//print(String(describing:store1.searchProductByProductNumber()))

// Aufgabe 3.3 Produkt registrieren
// Test erfolgreich, in Test für 3.1 integriert

// Aufgabe 3.4 Barcode

//print("Barcode von 324435523: \(store1.encrypt(324435523))")
//print("Zahl von Barcode ▍▎▌▌▍▋▋▎▍: \(store1.decrypt("▍▎▌▌▍▋▋▎▍"))")

// Aufgabe 3.5 Warenkorb

//store1.putProductInShoppingCart()
//print("Der aktuelle Warenkorb von \(store1.currentUser):")
//for product in store1.shoppingCart {
//    print("\(product.value)x \(product.key.name)\nGesamtpreis: \(product.key.price * Double(product.value))€")
//}

// Aufgabe 4.3 Range an Produkten ausgeben

//store1.printProcutsWithRange()

// Aufgabe 4.4 Gesamtwert berechnen

//store1.calculateTotalValue()

// Aufgabe 4.5 Checkout

//store1.checkout()

// Aufgabe 5.1 Produkt Bewertungen

//product1.addRating(userName: store1.currentUser)
//product1.addRating(userName: "Anonymous")
//product1.addRating(userName: "RandomUser123")
//print("Die durschnittliche Bewertung von \(product1.name) ist \(String(format: "%.1f", product1.calculateAverageRating())) Sterne")

// Aufgabe 5.2 Filter
// 3 Aufrufe zum Testen aller 3 Filter :)

//store1.filterProducts()
//store1.filterProducts()
//store1.filterProducts()

// Aufgabe 5.3 Konsolenprogramm

store1.run()
