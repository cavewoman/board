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

  func calcSingleDieChances(die: Die) -> Chance {
    let chances = Chance()
    chances.brains = Double(die.brains)/6
    chances.bangs = Double(die.bangs)/6
    return chances
  }
  
  func calcDiceChances(bag: Bag, diceInHand: [Die]) -> Chance {
    var brainChances  = 0.0
    var bangChances = 0.0
    
    let _bagChances = bagChances(bag.dice!)
    
    
    if diceInHand.count < 1 {
      brainChances = Double(_bagChances.brains)
      bangChances = Double(_bagChances.bangs)
    } else {
      brainChances = 1
      bangChances = 1
      NSLog("Chances dice in hand \(diceInHand[0])")
      NSLog("Dice In Hand brains \(diceInHand[0].chances!.brains)")
      for die in diceInHand {
        brainChances = brainChances*Double(die.chances!.brains)
        bangChances = bangChances*Double(die.chances!.bangs)
      }
      if Double(_bagChances.brains) > 0 { brainChances = brainChances*Double(_bagChances.brains) }
      if Double(_bagChances.bangs) > 0 { bangChances = bangChances*Double(_bagChances.bangs)}
    }
    
    let chances = Chance()
    chances.brains = brainChances
    chances.bangs = bangChances
    return chances
  }
  
  func bagChances(dice: [Die]) -> Chance {
    var brains = 0
    var bangs = 0
    
    for die in dice {
      brains += die.brains as Int
      bangs += die.bangs as Int
    }
    
    let brainsChance = (Double(brains)/Double(dice.count * 6))
    let bangsChance = (Double(bangs)/Double(dice.count * 6))
    
    NSLog("CHANCES")
    NSLog("brains \(brainsChance)")
    NSLog("bangs \(bangsChance)")
    let chances = Chance()
    chances.brains = brainsChance
    chances.bangs = bangsChance
    return chances
  }

}