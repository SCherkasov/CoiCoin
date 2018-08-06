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
