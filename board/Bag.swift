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
  
  func pickDice(num: NSNumber) -> [Die] {
    var bag = allDice()
    var picked: [Die] = []
    
    var i = 0
    
    while i < bag.count && bag.count > 0 {
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

    for _ in 0...6 {
      dice.append(createGreenDie())
    }
    
    for _ in 0...4 {
      dice.append(createYellowDie())
    }
    
    for _ in 0...2 {
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
    return greenDie
  }
  
  func createYellowDie() -> Die {
    let yellowDie = Die()
    yellowDie.color = "yellow"
    yellowDie.brains = 2
    yellowDie.steps = 2
    yellowDie.bangs = 2
    return yellowDie
  }
  
  func createRedDie() -> Die {
    let redDie = Die()
    redDie.color = "red"
    redDie.brains = 2
    redDie.steps = 2
    redDie.bangs = 2
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