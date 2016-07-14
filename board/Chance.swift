//
//  Chance.swift
//  board
//
//  Created by Anna Chan on 7/13/16.
//  Copyright © 2016 Anna Chan. All rights reserved.
//

import Foundation

class Chance: NSObject, NSCoding {
  var brains: NSNumber = 0
  var bangs: NSNumber = 0
  
  override init() {
    super.init()
  }
  
  // failable initializer
  required init?(coder aDecoder: NSCoder) {
    self.brains = aDecoder.decodeObjectForKey("brains") as? NSNumber ?? 0
    self.bangs = aDecoder.decodeObjectForKey("bangs") as? NSNumber ?? 0
    super.init()
  }
  
  func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(brains, forKey: "brains")
    aCoder.encodeObject(bangs, forKey: "bangs")
  }


}