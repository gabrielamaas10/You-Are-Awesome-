//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by Gabriela Maas on 9/16/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var imageNumber = -1
    var messageNumber = -1
    var soundNumber = -1
    let totalNumberOfImages = 10
    let totalNumberOfSounds = 6
    var audioPlayer: AVAudioPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func playSound(name: String){
        if let sound = NSDataAsset(name: name) {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("ERROR: \(error.localizedDescription)Could not initialize AVAudioPlayer object.")
            }
            
        } else {
            print("ERROR: Could not read the data from file sound0")
        }
    }
    
    func noneRepeatingRandom(originalNumber: Int, upperLimit: Int) -> Int{
        var newNumber: Int
        repeat {
            newNumber = Int.random(in: 0...upperLimit)
        } while originalNumber == newNumber
        return newNumber
    }
    

    @IBAction func messageButtonPressed(_ sender: UIButton) {
        let messages = ["You Are Awesome!",
                        "You Are Great",
                        "You Are Fantastic!",
                        "When the Genius Bar Needs Help, They Call You!",
                        "Fabulous? That's You!",
                        "You've Got The Design Skills of Johy Ive"]
        
        messageNumber = noneRepeatingRandom(originalNumber: messageNumber, upperLimit: messages.count - 1)
        var newMessageNumber: Int
        repeat {
            newMessageNumber = Int.random(in: 0...messages.count-1)
        } while messageNumber == newMessageNumber
        messageNumber = newMessageNumber
        messageLabel.text = messages[messageNumber]
        

        imageNumber = noneRepeatingRandom(originalNumber: imageNumber, upperLimit: totalNumberOfImages - 1)
        imageView.image = UIImage(named: "image\(imageNumber)")
        
        
     
        soundNumber = noneRepeatingRandom(originalNumber: soundNumber, upperLimit: totalNumberOfSounds - 1)
        print("*** The new sound number is \(soundNumber)")
        playSound(name: "sound\(soundNumber)")
        
    }
}

