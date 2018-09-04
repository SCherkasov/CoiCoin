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

func loadCoins(from fileName: String) -> ([Coin], [Country]) {
  var countries = [Country]()
  var coins = [Coin]()
  
  if let myObjCNSDict = NSDictionary(contentsOfFile: fileName),
    let coinArray = myObjCNSDict["coins"] as? [[String: AnyObject]] {
    
    for coinDict in coinArray {
      
      if let coinName = coinDict["name"] as? String,
        let coinImageName = coinDict["imageName"] as? String,
        let countryDict = coinDict["country"] as? [String: String],
        let countryName = countryDict["name"],
        let countryFlagImageName = countryDict["flagImageName"]
      {
        if let getTheCountry = getCountry(name: countryName, from: countries) {
          coins.append(Coin(name: coinName, imageName: coinImageName,
                            country: getTheCountry))
        } else {
          let country = Country(name: countryName,
                                flagImageName: countryFlagImageName)
          countries.append(country)
          coins.append(Coin(name: coinName, imageName: coinImageName,
                            country: country))
        }
      }
    }
  }
  
  return (coins, countries)
}

func getCoins(forCountry country: Country, from coins: [Coin]) -> [Coin] {
  
  var result = [Coin]()
  
  for coin in coins {
    if coin.country === country {
      result.append(coin)
    }
  }
  return result
}

func getCoins(withCountryName countryName: String, from coins: [Coin],
              countries: [Country]) -> [Coin] {
  
  if let country = getCountry(name: countryName, from: countries) {
    
    return getCoins(forCountry: country, from: coins)
  }
  return []
}

//*****************************__task_7__***************************************

func getCountries(for coins: [Coin]) -> [Country] {
  var result = [Country]()
  
  for coin in coins {
    if coin === coin.country {
      result.append(coin.country)
    }
  }
  return result
}

//******************************************************************************

let (coins, countries) = loadCoins(from: "coins.plist")

let x = getCoins(withCountryName: "USA", from: coins, countries: countries)
//print(x)

let y = getCountries(for: coins)
print(y)
