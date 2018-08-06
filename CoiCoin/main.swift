////
////  main.swift
////  CoiCoin
////
////  Created by Stanislav Cherkasov on 02.08.2018.
////  Copyright © 2018 Stanislav Cherkasov. All rights reserved.
////
//
////import Foundation
////
////class Coin {
////  var name: String
////  var imageName: String
////  var country: Country
////
////  init(name: String, imageName: String, country: Country) {
////    self.name = name
////    self.imageName = imageName
////    self.country = country
////  }
////}
////
////class Country {
////  var name: String
////  var flagImageName: String
////
////  init(name: String, flagImageName: String) {
////    self.name = name
////    self.flagImageName = flagImageName
////  }
////
////}
////
////extension Country: CustomStringConvertible {
////  var description: String {
////    return "Country: \(self.name) image flag: \(self.flagImageName)"
////  }
////}
////
////let andorra = Country(name: "Andorra", flagImageName: "AndorraIm")
////let austria = Country(name: "Austria", flagImageName: "AustriaIm")
////let belgium = Country(name: "Belgium", flagImageName: "BelgiumIm")
////
////var countrysArray = [andorra, austria, belgium]
////
////func getCountry(name: String, countries: [Country]) -> Country? {
////
////  var result: Country?
////  for country in countrysArray {
////    if country.name == name {
////      result = country
////    }
////  }
////  return result
////}
////
////
////let andorraCoin1: Optional<Country> = Optional<Country>.some(
////  Coin(name: "1 euro", imageName: "1 euro im", country: getCountry(name: "Andorra", countries: countrysArray)))
////let andorraCoin2 = Coin(name: "2 euro", imageName: "2 euro im", country: getCountry(name: "Austria", countries: countrysArray)!)
////let austriaCoin = Coin(name: "2 euro", imageName: "2 euro im", country: getCountry(name: "Belgium", countries: countrysArray)!)
////let belgiumCoin = Coin(name: "5 euro cent", imageName: "5 euro cent im", country: getCountry(name: "Austria", countries: countrysArray)!)
////
////
////var coinsArray = [Coin]()
////coinsArray.append(andorraCoin1)
////coinsArray.append(andorraCoin2)
////coinsArray.append(austriaCoin)
////coinsArray.append(belgiumCoin)
//
//import Foundation
//
//// Define Coin class
//class Coin {
//  
//  var name: String
//  
//  var imageName: String
//  
//  var country: Country
//  
//  init(name: String, imageName: String, country: Country) {
//    self.name = name
//    self.imageName = imageName
//    self.country = country
//  }
//}
//
//// Define Country class
//class Country {
//  
//  var name: String
//  
//  var flagImageName: String
//  
//  init(name: String, flagImageName: String) {
//    self.name = name
//    self.flagImageName = flagImageName
//  }
//}
//
//// Make Country print more user-friendly
//extension Country: CustomStringConvertible {
//  var description: String {
//    return "{country: \(self.name) flagImageName: \(self.flagImageName)}"
//  }
//}
//
//// Make Coin print more user-friendly
//extension Coin: CustomStringConvertible {
//  var description: String {
//    return "{coin: \(self.name) imageName: \(self.imageName) country: \(country)}"
//  }
//}
//
//// Get Country by name from countries array passed as an argument
//// If there is no matched country return nil
//// Otherwise return optional wrapped country that matched
//func getCountry(named name:String, from counries: Array<Country>)
//  -> Optional<Country>
//{
//  return counries
//    .filter({ (country: Country) -> Bool in
//      return country.name == name
//    })
//    .first
//}
//
//// ==================== STAGE 1 - Create countries =============================
//// Create empty Array of countries that will store Country objects
//var countries: Array<Country> = Array<Country>.init()
//// Add Ukraine to countries array
//countries.append(Country.init(name: "Ukraine", flagImageName: "ukraine_flag"))
//// Add the USA to countries array
//countries.append(Country.init(name: "USA", flagImageName: "usa_flag"))
//
//// ==================== STAGE 2 - Create coins =================================
//// Create empty Array of coins that will store Coin objects
//var coins: Array<Coin> = Array<Coin>.init()
//
//// ==================== STAGE 3 - Get "USA"-named country ======================
//// Get a countryOptional with the USA name
//var countryOptional: Optional<Country> = getCountry(named: "Ukraine", from: countries)
//
//// ==================== STAGE 4 - Create Empty coinOptional ====================
//// Create Optional wrapped Coin - coinOptional. Fill it with none value
//var coinOptional: Optional<Coin> = Optional<Coin>.none
//
//// ==================== STAGE 5 - Analyze countryOptional ======================
//// =========== if it is not empty, then create coin with that country ==========
//// =========== if it is empty, then do nothing =================================
//// Check if we found a country with a name USA by checking countryOptional value
////  * if yes, then unwrap it
////  * if no go out of switch with a break statement
//switch countryOptional {
//// * if we fail to find country with a name of USA go out
//case .none:
//  break
//  
//// * if we find country with a name of USA then
//case .some(let unwrappedCountry):
//  // create 25 coint, use found unwrapped country for the name USA
//  // in coin initialization
//  coinOptional = Optional<Coin>
//    .some(
//      Coin.init(
//        name: "25_cents",
//        imageName: "25_cents_usa",
//        country: unwrappedCountry
//      )
//  )
//}
//
//// ======= STAGE 6 - Analyze coinOptional created with countryOptional =========
//// =========== if it is not empty, then add it to coins array ==================
//// =========== if it is empty, then do nothing =================================
//// * if we managed to fill coinOptional witn a some Coin value, then add
////    unwrapped coin to coins array
//// * if we fail to fill coinOptional with a some Coin value, then do nothing
////    with break statement
////    e.g. just exit switch statement WITHOUT adding any coin to coins array
//switch coinOptional {
//case .none:
//  break
//case .some(let unwrappedCoin):
//  coins.append(unwrappedCoin)
//}
//print(coins)

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
  coinOptional = Coin?.some(Coin(name: "25 coins", imageName: "25_coins_image", country: unwrappedCountry))
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
