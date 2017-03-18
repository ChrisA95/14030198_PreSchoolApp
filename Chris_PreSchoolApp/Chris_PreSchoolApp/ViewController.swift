//
//  ViewController.swift
//  Chris_PreSchoolApp
//
//  Created by Chris on 16/02/2017.
//  Copyright © 2017 Chris. All rights reserved.
//

import UIKit

import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    @IBOutlet weak var congratsView: UIView!
    
    @IBOutlet weak var correctLabel: UILabel!
    @IBOutlet weak var incorrectLabel: UILabel!
    
    @IBOutlet weak var starImage: UIImageView!
    @IBOutlet weak var starImage2: UIImageView!
    @IBOutlet weak var thumbs1: UIImageView!
    @IBOutlet weak var thumbs2: UIImageView!
    @IBOutlet weak var thumbs3: UIImageView!
    
    
    
    @IBAction func playAgain(_ sender: AnyObject) {
        self.viewDidLoad()
        //audioPlayer.play
    }
    
    var ans = 0
    var rand1 = Int(arc4random_uniform(5))
    var rand2 = Int(arc4random_uniform(5))
    var sum = 0
    var sound = AVAudioPlayer()
    var check = 0
    var counter = 1
    var timer = Timer()
    //let url = Bundle.main.url(forResource: "win", withExtension: "mp3")!
    
    @IBAction func button(_ sender: AnyObject) {
        ans = sender.tag
        if ans == sum {
            congratsView.isHidden = false
            correctLabel.text = String(rand1) + " + " + String(rand2) + " = " + String(sum)
            UIView.animate(withDuration: 0.5, delay: 0, options: [.autoreverse, .repeat], animations: {
                self.starImage.alpha = 0
                self.starImage2.alpha = 0
            }, completion: nil)
        }
        else {
            UIView.animate(withDuration: 0.8, animations: {
                self.incorrectLabel.alpha = 1
                self.incorrectLabel.alpha = 0
                self.incorrectLabel.alpha = 1
                self.incorrectLabel.alpha = 0
            }, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        incorrectLabel.alpha = 0
        congratsView.isHidden = true
        answerLabel.textColor = UIColor.red;
        ans = 0
        rand1 = Int(arc4random_uniform(5))
        rand2 = Int(arc4random_uniform(5))
        sum = rand1 + rand2
        questionLabel.text = String(rand1) + " + " + String(rand2) + " = "

        UIView.animate(withDuration: 30, delay: 0, options: .repeat, animations: {
            self.thumbs1.center.x = 500
            }, completion: nil)
        
        UIView.animate(withDuration: 40, delay: 0, options: .repeat, animations: {
            self.thumbs2.center.x = 500
            }, completion: nil)
        
        UIView.animate(withDuration: 50, delay: 0, options: .repeat, animations: {
            self.thumbs3.center.x = 500
            }, completion: nil)
        
        func playSound(filename: String) {
            let url = Bundle.main.url(forResource: "win", withExtension: "mp3")
            guard let newURL = url else {
                print ("Could not find file: \(filename)")
                return
            }
            do {
                sound = try AVAudioPlayer(contentsOf: newURL)
                sound.numberOfLoops = -1
                sound.prepareToPlay()
                sound.play()
            } catch let error as NSError {
                print (error.description)
            }
        }
        
        //if (check == 0) {
            //do {
                //sound = try AVAudioPlayer(contentsOf: url)
                //guard let sound = sound else {return}
            //}
    }
        
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
