//
//  Turn.swift
//  board
//
//  Created by Anna Chan on 7/10/16.
//  Copyright © 2016 Anna Chan. All rights reserved.
//

import Foundation

class Turn: NSObject, NSCoding {
  var bag: Bag = Bag().createDefaultBag()
  var playerNumber: Int = 0
  var brains: Int = 0
  var bangs: Int = 0
  
  override init() {
    super.init()
  }
  
  required init?(coder aDecoder: NSCoder) {
    self.bag = (aDecoder.decodeObjectForKey("bag") as! Bag?)!
    self.playerNumber = aDecoder.decodeObjectForKey("playerNumber") as? Int ?? 0
    self.brains = aDecoder.decodeObjectForKey("brains") as? Int ?? 0
    self.bangs = aDecoder.decodeObjectForKey("bangs") as? Int ?? 0
    super.init()
  }
  
  func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(bag, forKey: "bag")
    aCoder.encodeObject(brains, forKey: "brains")
    aCoder.encodeObject(bangs, forKey: "bangs")
  }

}