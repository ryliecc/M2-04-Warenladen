import Foundation

// Aufgabe 1.1 Begrüßung

var store1: Store = Store()

store1.greet()

// Aufgabe 1.2 Nutzernamen speichern

print("Der Nutzername von Instanz store1 ist \(store1.userName).")

// 1.3 Eingabe einer Ganzzahl

print("Eingegebene Zahl: \(store1.enterInteger())")

// Aufgabe 1.4 Ja/Nein Eingabe

print("Bestätigung: \(store1.validation())")

// Aufgabe 2.2 Produkte erstellen und hinzufügen

let product1: Product = Product(name: "Nintendo 2DS", price: 99.99, description: "Handheld console from Nintendo that works just like the famous 3DS, just without the 3D feature.")
let product2: Product = Product(name: "Mario Kart 8", price: 34.99, description: "Mario Kart for the Switch!")
let product3: Product = Product(name: "The Sims 25th Anniversary Bundle", price: 30.00, description: "Includes The Sims and The Sims 2 with all add-ons.")
let product4: Product = Product(name: "The Sims 4: Parenthood", price: 39.99, description: "A Sims 4 Gameplay Pack that focuses on the joys of parenthood.")
let product5: Product = Product(name: "Animal Crossing New Leaf", price: 39.99, description: "The best Animal Crossing ever made for the 3DS.")
let product6: Product = Product(name: "Red Dead Redemption 2", price: 34.99, description: "A famous cowboy video game.")
let product7: Product = Product(name: "Blathers Amiibo", price: 19.99, description: "An Amiibo with an NFC Chip for Animal Crossing Games on WiiU, 3DS and Switch.")
let product8: Product = Product(name: "Mario T-Shirt", price: 12.99, description: "Show your loyalty to the moustache!")
let product9: Product = Product(name: "Howl's Movong Castle DVD", price: 11.89, description: "The best Ghibli movie - now on DVD to watch it again and again and again and again and...")
let product10: Product = Product(name: "XBox Controller", price: 24.99, description: "A controller for the XBox Console that also works with Windows PCs.")

store1.loadProducts(product1, product2, product3, product4, product5, product6, product7, product8, product9, product10)
print("Produkte in store1 Instanz: \(store1.products)")

store1.addProduct()
print("Das neue Produkt ist: \(store1.products[10])")

// Aufgabe 2.3 Produkt entfernen

store1.removeProduct()
print("Produkte in store1 Instanz: \(store1.products)")

// Aufgabe 2.4 Top Marken

store1.brands = ["Nintendo", "Xbox", "SanDisk", "Electronic Arts", "Studio Ghibli"]

store1.showTopBrands()

// Aufgabe 2.5 Nach Preis sortieren

store1.showProductsSortedByPrice()

// Aufgabe 3.1 Artikelnummern

store1.productNumbersWithProduct = [1 : product1, 2 : product2, 3 : product3, 4 : product4, 5 : product5, 6 : product6, 7 : product7, 8 : product8, 9 : product9, 10 : product10]

print("Die Liste der Produktnummern in Instanz store1 ist: \(store1.productNumbersWithProduct)")

// Aufgabe 3.2 Produkte abfragen

store1.searchProductByProductNumber()

// Aufgabe 3.3 Produkt registrieren

let product11: Product = Product(name: "240 GB SD Card", price: 19.99, description: "An SD Card to store all your favorite games")

store1.registerProduct(product: product11)
print("Die Liste der Produktnummern in Instanz store1 ist: \(store1.productNumbersWithProduct)")
