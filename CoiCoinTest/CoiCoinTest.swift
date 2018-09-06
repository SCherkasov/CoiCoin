//
//  CoiCoinTest.swift
//  CoiCoinTest
//
//  Created by Ievgen Gavrysh on 9/6/18.
//  Copyright © 2018 Stanislav Cherkasov. All rights reserved.
//

import XCTest

class CoiCoinTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func coin1Sample() -> Coin {
        let country1Name = "Ukraine"
        let country1FlagImageName = "ukraine_flag.png"
        let country1 = Country.init(
            name: country1Name,
            flagImageName: country1FlagImageName
        )
        let coin1Name = "5 kopeek"
        let coin1ImageName = "5_coins_ukr.png"
        let coin1 = Coin.init(
            name: coin1Name,
            imageName: coin1ImageName,
            country: country1
        )
        
        return coin1
    }
    
    func testCountryCreation() {
        let countryName = "Ukraine"
        let countryFlagImageName = "ukraine_flag.png"
        let country = Country.init(
            name: countryName,
            flagImageName: countryFlagImageName
        )
        
        XCTAssert(country.name == countryName)
        XCTAssert(country.flagImageName == countryFlagImageName)
    }
    
    func testCoinCreation() {
        let countryName = "Ukraine"
        let countryFlagImageName = "ukraine_flag.png"
        let country = Country.init(
            name: countryName,
            flagImageName: countryFlagImageName
        )
        let coinName = "5 coins"
        let coinImageName = "5_coins.png"
        let coin = Coin.init(
            name: coinName,
            imageName: coinImageName,
            country: country
        )
        
        XCTAssert(coin.country.name == countryName)
        XCTAssert(coin.country.flagImageName == countryFlagImageName)
        
        XCTAssert(coin.name == coinName)
        XCTAssert(coin.imageName == coinImageName)
        XCTAssert(coin.country === country)
    }
    
    func testCoinStoreCreation() {
        let country1Name = "Ukraine"
        let country1FlagImageName = "ukraine_flag.png"
        let country1 = Country.init(
            name: country1Name,
            flagImageName: country1FlagImageName
        )
        let coin1Name = "5 kopeek"
        let coin1ImageName = "5_coins_ukr.png"
        let coin1 = Coin.init(
            name: coin1Name,
            imageName: coin1ImageName,
            country: country1
        )
        
        let country2Name = "USA"
        let country2FlagImageName = "usa_flag.png"
        let country2 = Country.init(
            name: country2Name,
            flagImageName: country2FlagImageName
        )
        let coin2Name = "25 cents"
        let coin2ImageName = "5_coins_usa.png"
        let coin2 = Coin.init(
            name: coin2Name,
            imageName: coin2ImageName,
            country: country2
        )
        
        let coin3Name = "50 kopeek"
        let coin3ImageName = "50_coins_ukr.png"
        let coin3 = Coin.init(
            name: coin3Name,
            imageName: coin3ImageName,
            country: country1
        )
        
        let coinStore = CoinStore.init()
        coinStore.addCoin(coin1)
        coinStore.addCoin(coin2)
        coinStore.addCoin(coin3)
        
        XCTAssert(coinStore.coins.count == 3)
        XCTAssert(coinStore.countries.count == 2)
    }
    
    func testCoinStoreLoad() {
        let testFilename = "coins_test.plist"
        let coinsInTestFileCount = 3
        let countriesInTestFileCount = 2
        
        let store = CoinStore.init()
        store.loadCoins(from: testFilename)
        
        XCTAssert(store.coins.count == coinsInTestFileCount)
        XCTAssert(store.countries.count == countriesInTestFileCount)
    }
    
    func testCoinAddToCoinStore() {
        let coin = self.coin1Sample()
        let coinStore = CoinStore.init()
        coinStore.addCoin(coin)
        
        XCTAssert(coinStore.coin(with: coin.name) != nil)
        XCTAssert(coinStore.coin(with: coin.name) === coin)
    }
}
