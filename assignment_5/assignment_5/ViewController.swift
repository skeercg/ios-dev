//
//  ViewController.swift
//  assignment_5
//
//  Created by Алихан Абихас on 20.10.2024.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var audioPlayer: AVAudioPlayer?
    
    @IBAction func onPressed(_ sender: UIButton) {
        if let title = sender.titleLabel?.text {
            print(title)
            playSound(title)
        }
    }
    
    func playSound(_ sound: String) {
        if let soundURL = Bundle.main.url(forResource: sound, withExtension: "wav") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.play()
            } catch {
                print("Error: Could not play sound file.")
            }
        } else {
            print("Error: Sound file not found.")
        }
    }
}

