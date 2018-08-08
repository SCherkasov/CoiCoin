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

func loadCoins(from fileName: String) -> [Coin] {
  var countries = [Country]()
  var coins = [Coin]()
  
  if let myObjCNSDict = NSDictionary(contentsOfFile: fileName),
    let myDict = myObjCNSDict["coins"] as? [[String: AnyObject]] {
    for record in myDict {
      if let coinName = record["name"] as? String,
        let coinImageName = record["imageName"] as? String {
        if let country = record["country"] as? [String: String],
          let countryName = country["name"],
          let countryFlagImageName = country["flagImageName"],
          getCountry(name: countryName, from: countries) == nil
        {
          countries.append(Country(name: countryName,
                                   flagImageName: countryFlagImageName))
          
          coins.append(Coin(name: coinName, imageName: coinImageName, country: <#T##Country#>))
        }
      }
    }
  }
  print(countries)
  
  return coins
}

loadCoins(from: "/Users/Stanislav_Cherkasov/Desktop/CoiCoin/CoiCoin/coins.plist")

