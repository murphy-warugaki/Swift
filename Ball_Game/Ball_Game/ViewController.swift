//
//  ViewController.swift
//  Ball_Game
//
//  Created by 西本真也 on 2016/09/22.
//  Copyright © 2016年 murphy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redRect: UIView!
    //IOOutlet:ストーリーボートから作られた
    //weak:変数が弱参照である
    //redRect:変数名
    //UIView:変数の型
    // ! :変数がアンラップオプショナルであることを明示
    
    @IBAction func doMove(sender: AnyObject) {
        //@IBAはstorybordから追加されたイベンドであることを示す
        //sender:Anyhogeは関数の引数でsenderにはUIBottunの情報が渡されている
        print("doNoveがタップされました")
        print("移動前の座標:\(redRect.center)")
        
        let x = redRect.center.x + 10
        let y = redRect.center.y
        let newPoint = CGPointMake(x, y)
        redRect.center = newPoint
        print("そして移動後の座標:\(redRect.center)")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

