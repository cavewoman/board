//
//  Die.swift
//  board
//
//  Created by Anna Chan on 7/6/16.
//  Copyright © 2016 Anna Chan. All rights reserved.
//

import Foundation

class Die: NSObject, NSCoding {
  var color: NSString?
  var brains: NSNumber = 0
  var steps: NSNumber = 0
  var bangs: NSNumber = 0
  var chances: Chance?
  
  override init() {
    super.init()
  }
  
  // failable initializer
  required init?(coder aDecoder: NSCoder) {
    self.brains = aDecoder.decodeObjectForKey("brains") as? NSNumber ?? 0
    self.bangs = aDecoder.decodeObjectForKey("bangs") as? NSNumber ?? 0
    self.steps = aDecoder.decodeObjectForKey("steps") as? NSNumber ?? 0
    self.color = aDecoder.decodeObjectForKey("color") as! NSString?
    self.chances = aDecoder.decodeObjectForKey("chances") as? Chance
    super.init()
  }
  
  func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(brains, forKey: "brains")
    aCoder.encodeObject(bangs, forKey: "bangs")
    aCoder.encodeObject(steps, forKey: "steps")
    aCoder.encodeObject(color, forKey: "color")
    aCoder.encodeObject(chances, forKey: "chances")
  }
  
  func roll(die: Die) -> NSString {
    let options: NSMutableArray = []
    
    for _ in 0...((brains as Int) + 1) {
      options.addObject("brain")
    }
    
    for _ in 0...((steps as Int) + 1) {
      options.addObject("step")
    }
    
    for _ in 0...((bangs as Int) + 1) {
      options.addObject("bang")
    }
    
    let randomIndex = Int(arc4random_uniform(UInt32(options.count)))
    let side = options[randomIndex]
    return side as! NSString
  }
  
  
}
