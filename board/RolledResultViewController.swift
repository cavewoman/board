//
//  RolledResultViewController.swift
//  board
//
//  Created by Anna Chan on 7/10/16.
//  Copyright © 2016 Anna Chan. All rights reserved.
//

import UIKit

class RolledResultViewController: UIViewController {
  var results: [NSString] = []
  
  @IBOutlet weak var die1result: UILabel!
  @IBOutlet weak var die2result: UILabel!
  @IBOutlet weak var die3result: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    NSLog("Results in results \(results)")
    
    var resultNum = 1
    
    for result in results {
      if resultNum == 1 {
        die1result.text = result as String
        resultNum = resultNum + 1
      } else if resultNum == 2 {
        die2result.text = result as String
        resultNum = resultNum + 1
      } else if resultNum == 3 {
        die3result.text = result as String
      }
    }

  }
}
