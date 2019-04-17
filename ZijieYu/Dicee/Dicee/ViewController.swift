//
//  ViewController.swift
//  Dicee
//
//  Created by Zijie Yu on 2019/4/7.
//  Copyright © 2019 Zijie Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let diceArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    
    let background = ["background", "background_2", "background_3", "background_4", "background_5"]
    
    var randomDiceIndex1: Int = 0
    var randomDiceIndex2: Int = 0
    var randomBackground: Int = 0
    var count = 0;
    @IBOutlet weak var BackgroundColor: UIImageView!
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateDiceImages()
    }
    
    
    @IBAction func Background(_ sender: UIButton) {
        updateBackground()
    }
    
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        
        updateDiceImages()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateDiceImages()
    }
    

    
    func updateBackground(){
//        randomBackground = Int .random(in: 0...1)
//        BackgroundColor.image = UIImage (named:background[randomBackground])
        
        BackgroundColor.image = UIImage (named:background[count])
        count += 1
        if count == 4 {
            count = 0
        }
    }
    
    func updateDiceImages() {
        
        randomDiceIndex1 = Int .random(in: 0...5)
        randomDiceIndex2 = Int .random(in: 0...5)
        
        //        print(randomDiceIndex1)
        
        diceImageView1.image = UIImage (named: diceArray[randomDiceIndex1])
        
        diceImageView2.image = UIImage (named: diceArray[randomDiceIndex2])
    }
    
}

