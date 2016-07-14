//
//  Result.swift
//  board
//
//  Created by Anna Chan on 7/13/16.
//  Copyright © 2016 Anna Chan. All rights reserved.
//

import Foundation

class Result: NSObject, NSCoding {
  var result: String?
  var die: Die?
  
  override init() {
    super.init()
  }
  
  // failable initializer
  required init?(coder aDecoder: NSCoder) {
    self.result = aDecoder.decodeObjectForKey("result") as? String
    self.die = aDecoder.decodeObjectForKey("die") as? Die
    super.init()
  }
  
  func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(result, forKey: "result")
    aCoder.encodeObject(die, forKey: "die")
  }
  
  
}
