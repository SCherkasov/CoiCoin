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
    return "{coin: \(self.name) "
      + "imageName: \(self.imageName) "
      + "country: \(country)}"
  }
}

func getCountry(name: String, from countries: [Country]) -> Country? {
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
countries.append(Country(name: "USA", flagImageName: "usa_flag"))

var coins = [Coin]()

var countryOptional = getCountry(name: "Ukraine", from: countries)

var coinOptional: Coin? = nil

if let unwrappedCountry = countryOptional {
  coins.append(
    Coin(
      name: "25 coins",
      imageName: "25_coins_image",
      country: unwrappedCountry
    )
  )
  
  coins.append(
    Coin(
      name: "50 coins",
      imageName: "50_coins_image",
      country: unwrappedCountry
    )
  )
}

func loadCoins(from fileName: String) -> [Coin] {
  var countries = [Country]()
  var coins = [Coin]()
  let plistName = "/Users/Stanislav_Cherkasov/Desktop/CoiCoin/CoiCoin/coins.plist"
  if let myObjCNSDict = NSDictionary(contentsOfFile: plistName),
    let myDict = myObjCNSDict["coins"] as? [[String: AnyObject]] {
    for record in myDict {
      let coinName = record["name"] as? String
      let coinImageName = record["imageName"] as? String
      if let country = record["country"] as? [String: String],
        let countryName = country["name"],
        let countryFlagImageName = country["flagImageName"]
      {
        if country["name"] != country["name"] {
        countries.append(Country(name: countryName, flagImageName: countryFlagImageName))
        print(countries)
        }
      }
    }
  }
  //myCoin.append(Coin(name: coinName!, imageName: coinImageName!, country: ))
  
  return coins
}

loadCoins(from: "plistName")


