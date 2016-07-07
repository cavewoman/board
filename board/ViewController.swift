//
//  ViewController.swift
//  board
//
//  Created by Anna Chan on 7/6/16.
//  Copyright © 2016 Anna Chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  var colors = ["Red","Yellow","Green","Blue"]

  @IBOutlet weak var Picker: UIPickerView!
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return colors.count
  }
  
  func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
    return colors[row]
  }

}

