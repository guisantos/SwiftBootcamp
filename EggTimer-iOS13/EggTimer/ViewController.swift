//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft": 3, "Medium": 420, "Hard": 720]
    var timer = Timer()
    var totalTime: Float = 0
    var secondsPassed: Float = 0
    
    var player: AVAudioPlayer!
    
    @IBAction func hardnessSelection(_ sender: UIButton) {
        timer.invalidate()
        
        if let hardness = sender.currentTitle {
            if let time = eggTimes[hardness] {
                totalTime = Float(time)
                secondsPassed = 0
                progressBar.progress = 0
                titleLabel.text = hardness
                
                timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
            }
        }
        
    }
    
    @objc func timerAction() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = secondsPassed / totalTime
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!"
            playSound()
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
