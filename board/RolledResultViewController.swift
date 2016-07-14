//
//  RolledResultViewController.swift
//  board
//
//  Created by Anna Chan on 7/10/16.
//  Copyright © 2016 Anna Chan. All rights reserved.
//

import UIKit

class RolledResultViewController: UIViewController {
  var results: [Result] = []
  var turn: Turn?
  var diceInHand: [Die] = []
  
  @IBOutlet weak var die1result: UILabel!
  @IBOutlet weak var die2result: UILabel!
  @IBOutlet weak var die3result: UILabel!
  @IBOutlet weak var brainsCountLabel: UILabel!
  @IBOutlet weak var bangsCountLabel: UILabel!
  @IBOutlet weak var resultMessageLabel: UILabel!
  @IBOutlet weak var continueTurnButton: UIButton!
  @IBOutlet weak var finishTurnButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    NSLog("Results in results \(results)")
    
    var resultNum = 1
    var brains = 0
    var bangs = 0
    
    for result in results {
      if result.result == "brain" { brains += 1 }
      if result.result == "bang" { bangs += 1 }
      if result.result == "step" { diceInHand.append(result.die!) }
      if resultNum == 1 {
        die1result.text = result.result! as String
        resultNum = resultNum + 1
      } else if resultNum == 2 {
        die2result.text = result.result! as String
        resultNum = resultNum + 1
      } else if resultNum == 3 {
        die3result.text = result.result! as String
      }
    }
    
    turn!.brains = brains + (turn?.brains)!
    turn!.bangs = bangs + (turn?.bangs)!
    
    brainsCountLabel.text = String((turn?.brains)! as Int)
    bangsCountLabel.text = String((turn?.bangs)! as Int)
    
    if turn!.bangs > 2 {
      resultMessageLabel.text = "OH NO YOU DIED!"
      continueTurnButton.hidden = true
      finishTurnButton.setTitle("Continue", forState: UIControlState.Normal)
    } else if diceInHand.count < 1 {
      NSLog("Dice In Hand \(diceInHand)")
      resultMessageLabel.text = "Nice Job Surviving! Your turn is over"
      continueTurnButton.hidden = true
      finishTurnButton.setTitle("Continue", forState: UIControlState.Normal)
    } else {
      resultMessageLabel.text = "NICE JOB SURVIVING!"
      continueTurnButton.hidden = false
    }
    

  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    let vC = segue.destinationViewController as? ViewController

    vC!.turn = turn
    vC!.diceInHand = diceInHand
  }
  

}
