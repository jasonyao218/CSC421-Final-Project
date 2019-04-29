//
//  ListBodyItem.swift
//  snake_game
//
//  Created by Oliver on 4/15/19.
//  Copyright © 2019 Oliver. All rights reserved.
//

import UIKit

class ListBodyItem: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.green
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var frame: CGRect {
        set {
            if let next = nextItem {
                next.frame.origin = frame.origin
            }
            
            super.frame.origin = newValue.origin
        }
        
        get {
            return super.frame
        }
    }
    
    var nextItem: ListBodyItem?
    
}

class SnakeHead: ListBodyItem {
    init() {
        super.init(frame: CGRect(x: 90, y: 120, width: 30, height: 30))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func touchEdge(){
        if (frame.origin.x < 0) {
            frame.origin.x = 360
        } else if (frame.origin.x > 360) {
            frame.origin.x = 0
        } else if (frame.origin.y < 120) {
            frame.origin.y = 780
        } else if (frame.origin.y > 780) {
            frame.origin.y = 120
        }
    }
    
}


class SnakeBody {
    var bodys = [ListBodyItem]()
    
    //初始化身体时只有一段
    init() {
        bodys.append(conBody(frame: CGRect(x: 60, y: 120, width: 30, height: 30)))
    }
    
    //为蛇添加一段(完成一次吃食后调用)
    func addOne(view: UIView) {
        let curLast = bodys.last!
        
        bodys.append(conBody(frame: curLast.frame))
        curLast.nextItem = bodys.last
        
        view.addSubview(bodys.last!)
    }
    
    //构造一个bodyItem
    func conBody(frame: CGRect) -> ListBodyItem {
        let body = ListBodyItem(frame: frame)
        
        return body
    }
}

