//
//  CoinStore.swift
//  CoiCoin
//
//  Created by Ievgen Gavrysh on 9/6/18.
//  Copyright © 2018 Stanislav Cherkasov. All rights reserved.
//

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

class CoinStore {
    var coins: [Coin]
    var countries: [Country]
    
    init() {
        self.coins = [Coin]()
        self.countries = [Country]()
    }
    
    convenience init(with coins:[Coin]) {
        self.init()
    }
    
    func loadCoins(from fileName: String) {
    }
    
    func addCoin(_ coin: Coin) {
    }
    
    func addCountry(_ country: Country) {
    }
    
    func addCountry(name: String, imageName: String) {
    }
    
    func removeCoin(_ coin: Coin) {
    }
    
    func allCounties() -> [Country] {
        return []
    }
    
    func country(with name: String) -> Country? {
        return nil
    }
    
    func coin(with name: String) -> Coin? {
        return nil
    }
    
    func coins(for country: Country) -> [Coin] {
        return []
    }
    
    func coins(for countryName: String) -> [Coin] {
        return []
    }
}
