//
//  ViewController.swift
//  Counter
//
//  Created by 西本真也 on 2015/01/06.
//  Copyright (c) 2015年 西本真也. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let timer = NSTimer.scheduledTimerWithTimeInterval(
            1,
            target: self,
            selector: Selector("countUp"),
            userInfo: nil,
            repeats: true
        )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func countUp(){
        counterLabel.text = toString(++count)
    }


}

