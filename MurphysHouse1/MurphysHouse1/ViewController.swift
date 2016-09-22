//
//  ViewController.swift
//  MurphysHouse1
//
//  Created by 西本真也 on 2015/09/03.
//  Copyright (c) 2015年 まーふぃー. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fieldA: UITextField!
    
    @IBOutlet weak var fieldB: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func calculate(sender: AnyObject) {
        var resultA:Int? = fieldA.text.toInt()
        var resultB:Int? = fieldB.text.toInt()
        
        if(resultA != nil && resultB != nil){
            resultLabel.text = "答えは" + toString(resultA!*resultB!)
        }else{
            resultLabel.text = "入力値が不正です"
        }
    }
}

