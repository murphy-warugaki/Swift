//
//  ViewController.swift
//  Gyroscope_ex
//
//  Created by 西本真也 on 2016/09/25.
//  Copyright © 2016年 murphy. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    @IBOutlet weak var redRect: UIView!
    var motionManager: CMMotionManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        motionManager = CMMotionManager()
        
        motionManager.deviceMotionUpdateInterval = 0.1
        
        // 加速度の取得を開始.
        motionManager.startDeviceMotionUpdates(to: OperationQueue.main, withHandler: {(deviceMotionData, error) in
            if let e = error {
                print(e.localizedDescription)
                return
            }
            guard let data = deviceMotionData else {
                return
            }
            // print(data.description)
            
            let xAngle = 180 * data.attitude.roll / M_PI
            let yAngle = 180 * data.attitude.pitch / M_PI
            
            let lenX = CGFloat(xAngle)
            let lenY = CGFloat(yAngle)
            
            let width = self.view.frame.size.width
            let height = self.view.frame.size.height
            
            print("幅：\(width)")
            print("高：\(height)")
            
            let fromX = self.redRect.center.x
            let fromY = self.redRect.center.y
            
            var toX = fromX + lenX
            var toY = fromY + lenY
            
            let adjustX = self.redRect.frame.size.width * 0.5
            let adjustY = self.redRect.frame.size.height * 0.5
            
            // X軸の画面の両端に壁を作成します
            if toX < 0 + adjustX {
                print("X座標が0以下です")
                toX = 0 + adjustX
            } else if toX > width - adjustX {
                toX = width - adjustX
            }
            
            // Y軸の画面の両端に壁を作成します
            if toY < 0 + adjustY {
                print("Y座標が0以下です")
                toY = 0 + adjustY
            } else if toY > height - adjustY {
                toY = height - adjustY
            }
            
            // 座標を設定する
            self.redRect.center = CGPoint(x: toX, y: toY)
            print(self.redRect.center)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

