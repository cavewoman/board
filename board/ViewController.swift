//
//  ViewController.swift
//  board
//
//  Created by Anna Chan on 7/6/16.
//  Copyright © 2016 Anna Chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    //if segue.identifier == "ShowPickedDice" {
      let pickedDiceVC = segue.destinationViewController as? PickedDiceViewController
      
      var bag = Bag()
      var dice = bag.allDice()
      
      if dice.count < 1 {
        bag = Bag().createDefaultBag()
        dice = bag.dice!
      }
      
      let picked = Bag.pickDice(bag)
      pickedDiceVC?.dice = picked
      
    //}
  }

  @IBAction func dicePicker(sender: UIButton) {
    var bag = Bag()
    var dice = bag.allDice()
    
    if dice.count < 1 {
      bag = Bag().createDefaultBag()
      dice = bag.dice!
    }
    
    let picked = Bag.pickDice(bag)
    
  }

}

