//
//  ViewController.swift
//  assignment_6
//
//  Created by Алихан Абихас on 22.10.2024.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var countdownTimer: Timer?
    var totalTime: Float = 0.0
    var timeRemaining: Float = 0.0
    var audioPlayer: AVAudioPlayer?
    
    @IBAction func onTouchDown(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1) {
            sender.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }
    }
    
    @IBAction func onTouchUp(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1, animations: {
            sender.transform = CGAffineTransform.identity
        })
        
        switch (sender.tag) {
        case 1:
            startCountdown(5)
        case 2:
            startCountdown(10)
        case 3:
            startCountdown(15)
        default:
            break
        }
        
    }
    
    func startCountdown(_ seconds: Float) {
        countdownTimer?.invalidate()
        
        progressView.progress = 1.0
        totalTime = seconds
        timeRemaining = seconds
        
        countdownTimer = Timer.scheduledTimer(timeInterval: 0.016, target: self, selector: #selector(updateProgress), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateProgress() {
        if timeRemaining > 0 {
            timeRemaining -= 0.016
            progressView.progress = timeRemaining / totalTime
        } else {
            countdownTimer?.invalidate()
            playSound()
        }
    }
    
    func playSound() {
        if let soundURL = Bundle.main.url(forResource: "Alarm", withExtension: "wav") {
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

