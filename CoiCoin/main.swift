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

extension Country: CustomStringConvertible {
  var description: String {
    return "{country: \(self.name) flagImageName: \(self.flagImageName)}"
  }
}

extension Coin: CustomStringConvertible {
  var description: String {
    return "{coin: \(self.name) imageName: \(self.imageName) country: \(country)}"
  }
}

func getCountry(name: String, countries: [Country]) -> Country? {
  
  var result: Country?
  for country in countries {
    if country.name == name {
      result = country
    }
  }
  return result
}

var countries = [Country]()
// Add Ukraine to countries array
countries.append(Country(name: "Ukraine", flagImageName: "ukraine_flag"))
// Add the USA to countries array
countries.append(Country(name: "USA", flagImageName: "usa_flag"))

var coins = [Coin]()

var countryOptional = getCountry(name: "Ukraine", countries: countries)

var coinOptional: Coin? = nil

if countryOptional != nil {
  let unwrappedCountry = countryOptional!
  coinOptional = Coin?.some(Coin(name: "25 coins", imageName: "25_coins_image",
                                 country: unwrappedCountry))
} else {
  print("error")
}

if coinOptional != nil {
  let unwrappedCoin = coinOptional!
  coins.append(unwrappedCoin)
} else {
  print("error")
}

print(coins)
