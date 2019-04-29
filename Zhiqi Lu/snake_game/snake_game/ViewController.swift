//
//  ViewController.swift
//  snake_game
//
//  Created by Oliver on 4/15/19.
//  Copyright © 2019 Oliver. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //增加Food属性
    var timer: Timer!
    var food: Food!
    var snake: Snake!
    var isPause = false
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        //初始化food
        food = Food(view: view)
        snake = Snake(view: view)
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(walk), userInfo: nil, repeats: true)
    }
    
    @IBAction func pause(_ sender: UIBarButtonItem) {
        isPause = !isPause
        
        if (isPause) {
            sender.title = "Resume"
            timer.fireDate = NSDate.distantFuture
        } else {
            sender.title = "Pause"
            timer.fireDate = NSDate.distantPast
        }
        
    }
    
    @objc func walk() {
        if food.frame.origin == snake.head.frame.origin {
            food.changeFood(button: food)
            snake.eat()
            score += 10
            navigationItem.title = String(score)
        }
        
        for index in 0...score/10 {
            if food.frame.origin == snake.body.bodys[index].frame.origin {
                food.changeFood(button: food)
            }
        }
        snake.walk()
    }

    

    
    @IBAction func changeDirection(_ sender: UITapGestureRecognizer) {
        let tapPoint = sender.location(in: self.view)
        snake.changeDirection(point: tapPoint)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
