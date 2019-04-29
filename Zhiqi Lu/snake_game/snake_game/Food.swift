//
//  Food.swift
//  snake_game
//
//  Created by Oliver on 4/15/19.
//  Copyright © 2019 Oliver. All rights reserved.
//

import UIKit


class Food: UIButton {
    let foodX = 30
    let foodY = 30
    let screenX = 375
    let screenY = 734-30
    
    init(view: UIView) {
        //初始化在屏幕中央
        super.init(frame: CGRect(x: 180, y: 330, width: foodX, height: foodY))
        //设置食物的颜色为蓝色
        backgroundColor = UIColor.white
        //将Food添加到主view中显示
        view.addSubview(self)
        //注册点击事件
        //addTarget(self, action: #selector(changeFood), for: .touchDown)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func changeFood(button: UIButton) {
        button.frame.origin = randomPos()
    }
    
    func randomNum(num: Int) -> Int {
        return Int(arc4random_uniform(UInt32(num)))
    }
    
    func randomPos() -> CGPoint {
        //对产生的随机数按食物大小取整，方便后面蛇的吃食操作
        func round(value: Int) -> Int {
            return (value/foodX) * foodX
        }
        
        let curX = round(value: 30 + randomNum(num: screenX-foodX*2))
        let curY = round(value: 120 + randomNum(num: screenY-foodY*2))
        
//        if curX == ListBodyItem.frame.origin.x && curY == ListBodyItem.frame.origin.y {
//            let curX = round(value: 30 + randomNum(num: screenX-foodX*2))
//        }
        
        
        
        
        
        return CGPoint(x: curX, y: curY)
    }
}





