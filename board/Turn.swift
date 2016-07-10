//
//  Turn.swift
//  board
//
//  Created by Anna Chan on 7/10/16.
//  Copyright © 2016 Anna Chan. All rights reserved.
//

import Foundation

class Turn: NSObject, NSCoding {
  var bag: Bag = Bag()
  var brains: NSNumber = 0
  var bangs: NSNumber = 0
  
  override init() {
    super.init()
  }
  
  required init?(coder aDecoder: NSCoder) {
    self.bag = (aDecoder.decodeObjectForKey("bag") as! Bag?)!
    self.brains = aDecoder.decodeObjectForKey("brains") as? NSNumber ?? 0
    self.bangs = aDecoder.decodeObjectForKey("bangs") as? NSNumber ?? 0
    super.init()
  }
  
  func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(bag, forKey: "bag")
    aCoder.encodeObject(brains, forKey: "brains")
    aCoder.encodeObject(bangs, forKey: "bangs")
  }

}