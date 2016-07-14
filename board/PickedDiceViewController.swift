//
//  PickedDiceViewController.swift
//  board
//
//  Created by Anna Chan on 7/7/16.
//  Copyright © 2016 Anna Chan. All rights reserved.
//

import UIKit

class PickedDiceViewController: UIViewController {
  var dice: [Die] = []
  var bag: Bag?
  var turn: Turn?
  
  @IBOutlet weak var dieOneLabel: UILabel!
  @IBOutlet weak var dieTwoLabel: UILabel!
  @IBOutlet weak var dieThreeLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    NSLog("IN SIDE PickedDiceViewController")
    // Do any additional setup after loading the view, typically from a nib.
    
    var dieNum = 1
    
    for die in dice {
      if dieNum == 1 {
        dieOneLabel.text = die.color as? String
        dieNum = dieNum + 1
      } else if dieNum == 2 {
        dieTwoLabel.text = die.color as? String
        dieNum = dieNum + 1
      } else if dieNum == 3 {
        dieThreeLabel.text = die.color as? String
      }
    }

  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    let rolledResultVC = segue.destinationViewController as? RolledResultViewController
    
    var results: [Result] = []
    
    for die in dice {
      let result = Result()
      result.result = die.roll(die) as String
      result.die = die
      
      results.append(result)
    }
    
    NSLog("Results \(results)")
    
    rolledResultVC?.results = results
    rolledResultVC?.turn = turn
  }
  

}
