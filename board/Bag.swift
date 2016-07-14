//
//  Bag.swift
//  board
//
//  Created by Anna Chan on 7/6/16.
//  Copyright © 2016 Anna Chan. All rights reserved.
//

import Foundation

class Bag: NSObject {
  var dice: [Die]?
  
  override init() {
    super.init()
  }
  
  // failable initializer
  required init?(coder aDecoder: NSCoder) {
    self.dice = aDecoder.decodeObjectForKey("dice") as? [Die]
    super.init()
  }
  
  func addDice(dice: [Die]) -> Void {
    var diceOnDisk = allDice()
    
    // save interaction to disk
    diceOnDisk.appendContentsOf(dice)
    saveDice(diceOnDisk)
  }
  
  func emptyBag() -> Void {
    saveDice([])
  }
  
  func pickDice(num: Int) -> [Die] {
    var bag = allDice()
    var picked: [Die] = []
    
    var i = 0
    
    while i < num && bag.count > 0 {
      let randomIndex = Int(arc4random_uniform(UInt32(bag.count)))
      let die = bag[randomIndex]
      picked.append(die)
      bag.removeAtIndex(randomIndex)
      i += 1
    }
    
    saveDice(bag)
    return picked
  }
  
  func createDefaultBag() -> Bag {
    emptyBag()
    let bag = Bag()
    var dice: [Die] = []

    for _ in 0...7 {
      dice.append(createGreenDie())
    }
    
    for _ in 0...5 {
      dice.append(createYellowDie())
    }
    
    for _ in 0...3 {
      dice.append(createRedDie())
    }
    saveDice(dice)
    bag.dice = dice
    return bag
  }
  
  func createGreenDie() -> Die {
    let greenDie = Die()
    greenDie.color = "green"
    greenDie.brains = 3
    greenDie.steps = 2
    greenDie.bangs = 1
    greenDie.chances = Chance().calcSingleDieChances(greenDie)
    
    return greenDie
  }
  
  func createYellowDie() -> Die {
    let yellowDie = Die()
    yellowDie.color = "yellow"
    yellowDie.brains = 2
    yellowDie.steps = 2
    yellowDie.bangs = 2
    yellowDie.chances = Chance().calcSingleDieChances(yellowDie)
    return yellowDie
  }
  
  func createRedDie() -> Die {
    let redDie = Die()
    redDie.color = "red"
    redDie.brains = 2
    redDie.steps = 2
    redDie.bangs = 2
    redDie.chances = Chance().calcSingleDieChances(redDie)
    return redDie
  }
  
  func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(dice, forKey: "dice")
  }
  
  private func archiveFilePath() -> String {
    let documentsDirectory = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
    return documentsDirectory.URLByAppendingPathComponent("bagOfDice.archive").path!
  }
  
  func allDice() -> [Die] {
    return NSKeyedUnarchiver.unarchiveObjectWithFile(archiveFilePath()) as? [Die] ?? []
  }
  
  private func saveDice(dice: [Die]) -> Bool {
    return NSKeyedArchiver.archiveRootObject(dice, toFile: archiveFilePath())
  }
}