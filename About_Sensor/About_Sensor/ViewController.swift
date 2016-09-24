//
//  ViewController.swift
//  About_sensor
//
//  Created by 西本真也 on 2016/09/24.
//  Copyright © 2016年 murphy. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    @IBOutlet weak var rerRect: UIView!
    
    var motionManager: CMMotionManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("移動前のframe\(rerRect.frame)")
        
        //motionManagerを生成
        motionManager = CMMotionManager()
        
        //加速度センサの通知間隔を設定する(更新周期の設定)
        motionManager.accelerometerUpdateInterval = 0.1 / 30
        
        //加速度センサの取得を開始する
        motionManager.startAccelerometerUpdates(to: OperationQueue.main, withHandler: {(accelerometerData, error) in
            if let e = error {
             print(e.localizedDescription)
             return
            }
             guard let data = accelerometerData else {
             return
            }
             print(data.description)
            
            let fromX = self.rerRect.center.x
            let fromY = self.rerRect.center.y
            
            let lenX = CGFloat(data.acceleration.x) * 10
            let lenY = CGFloat(data.acceleration.y * -1) * 10
            
            let toX = fromX + lenX
            let toY = fromY + lenY
            
            self.rerRect.center = CGPoint(x: toX, y: toY)
            })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

