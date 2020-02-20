//
//  ViewController.swift
//  Dicee
//
//  Created by Gabarron on 10/08/2019.
//  Copyright © 2019 Marco Gabarron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let diceArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    
    var randomDiceIndex1 : Int = 0
    var randomDiceIndex2 : Int = 0
    
    @IBOutlet weak var randomDice1: UIImageView!
    
    @IBOutlet weak var randomDice2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateArray()
    }

    @IBAction func rollButton(_ sender: UIButton) {
        
        updateArray()
        
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateArray()
    }
    
    func updateArray(){
        
        randomDiceIndex1 = Int.random(in: 0 ... 5)
        randomDiceIndex2 = Int.random(in: 0 ... 5)
        
        randomDice1.image = UIImage(named: diceArray[randomDiceIndex1])
        randomDice2.image = UIImage(named: diceArray[randomDiceIndex2])
    }
    
}

