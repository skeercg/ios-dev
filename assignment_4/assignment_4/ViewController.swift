//
//  ViewController.swift
//  assignment_4
//
//  Created by Алихан Абихас on 08.10.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    let dices: Array<String> = ["1_dot", "2_dots", "3_dots", "4_dots", "5_dots", "6_dots"]
    

    @IBOutlet weak var Dice2: UIImageView!
    @IBOutlet weak var Dice1: UIImageView!
    
    @IBAction func roll(_ sender: Any) {
        let randomDice1 = Int.random(in: 0..<6)
        let randomDice2 = Int.random(in: 0..<6)

        self.Dice1.image = UIImage(named:self.dices[randomDice1])
        self.Dice2.image = UIImage(named:self.dices[randomDice2])
    }
}

