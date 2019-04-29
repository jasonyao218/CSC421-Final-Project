//
//  Snake.swift
//  snake_game
//
//  Created by Oliver on 4/15/19.
//  Copyright © 2019 Oliver. All rights reserved.
//

import UIKit

class Snake {
    let head = SnakeHead()
    let body = SnakeBody()
    
    //保存弱引用，避免互相引用引起的内存泄露
    weak var mainView: UIView!
    var direction = Direction.RIGHT
    
    init(view: UIView) {
        mainView = view
        head.nextItem = body.bodys[0]
        
        view.addSubview(head)
        view.addSubview(body.bodys[0])
    }
    
    func walk() {
        direction.walk(point: &head.frame.origin)
        head.touchEdge()
    }
    
    func eat() {
        body.addOne(view: mainView)
    }
    
    func changeDirection(point: CGPoint) {
        direction.changeDirection(cur: head.frame.origin, target: point)
    }
    
}

extension Direction {
    func walk( point: inout CGPoint) {
        switch self {
        case .UP: point.y -= CGFloat(30)
        case .DOWN: point.y += CGFloat(30)
        case .LEFT: point.x -= CGFloat(30)
        case .RIGHT: point.x += CGFloat(30)
        }
    }
    
    mutating func changeDirection(cur: CGPoint, target: CGPoint) {
        switch self {
        case .UP: self = cur.x > target.x ? .LEFT : .RIGHT
        case .DOWN: self = cur.x > target.x ? .LEFT : .RIGHT
        case .LEFT: self = cur.y > target.y ? .UP : .DOWN
        case .RIGHT: self = cur.y > target.y ? .UP : .DOWN
        }
    }
}
