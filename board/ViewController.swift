//
//  ViewController.swift
//  board
//
//  Created by Anna Chan on 7/6/16.
//  Copyright © 2016 Anna Chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  var turn: Turn?
  var diceInHand: [Die] = []
  
  @IBOutlet weak var brainsCountLabel: UILabel!
  @IBOutlet weak var bangsCountLabel: UILabel!
  @IBOutlet weak var brainChancesLabel: UILabel!
  @IBOutlet weak var bangChancesLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    brainsCountLabel.text = String(turn!.brains)
    bangsCountLabel.text = String(turn!.bangs)
    
    var brainChances  = 0
    var bangChances = 0
    
    let _bagChances = bagChances(turn!.bag.dice!)

    
    if diceInHand.count < 1 {
      brainChances = _bagChances.brains as Int
      bangChances = _bagChances.bangs as Int
    } else {
      brainChances = 1
      bangChances = 1
      for die in diceInHand {
        brainChances = brainChances*(die.chances!.brains as Int)
        bangChances = bangChances*(die.chances!.bangs as Int)
      }
      if (_bagChances.brains as Int) > 0 { brainChances = brainChances*(_bagChances.brains as Int) }
      if (_bagChances.bangs as Int) > 0 { bangChances = bangChances*(_bagChances.bangs as Int)}
    }
    
    brainChancesLabel.text = String(brainChances)
    bangChancesLabel.text = String(bangChances)
    
    
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  func bagChances(dice: [Die]) -> Chance {
    var brains = 0
    var bangs = 0
    
    for die in dice {
      brains += die.brains as Int
      bangs += die.bangs as Int
    }
    
    let brainsChance = (Double(brains)/Double(dice.count * 6))*100
    let bangsChance = (Double(bangs)/Double(dice.count * 6))*100
    
    NSLog("CHANCES")
    NSLog("brains \(brainsChance)")
    NSLog("bangs \(bangsChance)")
    let chances = Chance()
    chances.brains = brainsChance
    chances.bangs = bangsChance
    return chances
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
      let pickedDiceVC = segue.destinationViewController as? PickedDiceViewController
      
      var bag = turn?.bag
      var dice = bag!.allDice()
      NSLog("Passed in bag count \(dice.count)")
      
      if dice.count < 1 {
        bag = Bag().createDefaultBag()
        dice = bag!.dice!
      }
    
      var picked: [Die]?
    
      let numOfDiceToPick = 3 - (diceInHand.count)
      if numOfDiceToPick > 0 {
        picked = bag!.pickDice(numOfDiceToPick)
      } else {
        picked = diceInHand
      }
      NSLog("Bag after dice picked count \(bag?.allDice().count)")
      turn!.bag = bag!
      pickedDiceVC?.dice = picked!
      pickedDiceVC?.bag = bag
      pickedDiceVC?.turn = turn
  }

  @IBAction func dicePicker(sender: UIButton) {}

}

