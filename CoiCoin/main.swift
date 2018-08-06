////
////  main.swift
////  CoiCoin
////
////  Created by Stanislav Cherkasov on 02.08.2018.
////  Copyright © 2018 Stanislav Cherkasov. All rights reserved.

import Foundation

class Coin {
  var name: String
  var imageName: String
  var country: Country

  init(name: String, imageName: String, country: Country) {
    self.name = name
    self.imageName = imageName
    self.country = country
  }
}

class Country {
  var name: String
  var flagImageName: String

  init(name: String, flagImageName: String) {
    self.name = name
    self.flagImageName = flagImageName
  }

}

let andorra = Country(name: "Andorra", flagImageName: "AndorraIm")
let austria = Country(name: "Austria", flagImageName: "AustriaIm")
let belgium = Country(name: "Belgium", flagImageName: "BelgiumIm")

var countrysArray = [andorra, austria, belgium]

let andorraCoin1: Optional<Country> = Optional<Country>.some(
  Coin(name: "1 euro", imageName: "1 euro im", country: getCountry(name: "Andorra", countries: countrysArray)))
let andorraCoin2 = Coin(name: "2 euro", imageName: "2 euro im", country: getCountry(name: "Austria", countries: countrysArray)!)
let austriaCoin = Coin(name: "2 euro", imageName: "2 euro im", country: getCountry(name: "Belgium", countries: countrysArray)!)
let belgiumCoin = Coin(name: "5 euro cent", imageName: "5 euro cent im", country: getCountry(name: "Austria", countries: countrysArray)!)


var coinsArray = [Coin]()
coinsArray.append(andorraCoin1)
coinsArray.append(andorraCoin2)
coinsArray.append(austriaCoin)
coinsArray.append(belgiumCoin)
