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
