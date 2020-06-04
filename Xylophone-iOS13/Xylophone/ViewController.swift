import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            sender.alpha = 0.5
        }
        
        if let title = sender.currentTitle {
            playSound(soundName: title)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2 ) {
            UIView.animate(withDuration: 0.3) {
                sender.alpha = 1.0
            }
        }
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
