//
//  StartTurnViewController.swift
//  board
//
//  Created by Anna Chan on 7/12/16.
//  Copyright © 2016 Anna Chan. All rights reserved.
//

import UIKit

class StartTurnViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    let vC = segue.destinationViewController as? ViewController
    
    let turn = Turn()
    vC!.turn = turn
  }


}
