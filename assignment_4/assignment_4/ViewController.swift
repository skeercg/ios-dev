//
//  ViewController.swift
//  assignment_4
//
//  Created by Алихан Абихас on 08.10.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelView: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    let dices: Array<String> = ["1_dot", "2_dots", "3_dots", "4_dots", "5_dots", "6_dots"]
    

    @IBOutlet weak var Dice2: UIImageView!
    @IBOutlet weak var Dice1: UIImageView!
    
    @IBAction func roll(_ sender: Any) {
        let values = Set(0..<6)
        let randomDice1 = values.randomElement()!
//        let randomDice2 = values.subtracting(Set([randomDice1])).randomElement()!
        let randomDice2 = values.randomElement()!
        

        self.Dice1.image = UIImage(named:self.dices[randomDice1])
        self.Dice2.image = UIImage(named:self.dices[randomDice2])
        
        if (randomDice1 == randomDice2) {
            self.labelView.text = "You won!"
        }
    }
}

