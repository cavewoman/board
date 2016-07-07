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