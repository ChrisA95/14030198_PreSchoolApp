//
//  ViewController.swift
//  Chris_PreSchoolApp
//
//  Created by Chris on 16/02/2017.
//  Copyright © 2017 Chris. All rights reserved.
//

import UIKit

import AVFoundation

var bgMusic = AVAudioPlayer()
var bgMusicSession = AVAudioSession.sharedInstance()
var correctSound = AVAudioPlayer()
var incorrectSound = AVAudioPlayer()

func playbgMusic(filename: String) {
    let url = Bundle.main.path(forResource: "relaxing", ofType: "mp3")
    do {
        bgMusic = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: url!))
        bgMusic.setVolume(0.5, fadeDuration: 0)
        bgMusic.numberOfLoops = -1
        bgMusic.prepareToPlay()
        bgMusic.play()
        do {
            try bgMusicSession.setCategory(AVAudioSessionCategoryAmbient)
        }
    }
    catch let error as NSError {
        print (error.description)
    }
}

func playCorrectSound(filename: String) {
    let url = Bundle.main.path(forResource: "chime", ofType: "mp3")
    do {
        correctSound = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: url!))
        correctSound.prepareToPlay()
        correctSound.play()
    }
    catch let error as NSError {
        print (error.description)
    }
}

func playIncorrectSound(filename: String) {
    let url = Bundle.main.path(forResource: "LowBeep", ofType: "mp3")
    do {
        incorrectSound = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: url!))
        incorrectSound.setVolume(1.2, fadeDuration: 0)
        incorrectSound.prepareToPlay()
        incorrectSound.play()
    }
    catch let error as NSError {
        print (error.description)
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tree: UIImageView!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    @IBOutlet weak var topPanel: UIView!
    @IBOutlet weak var bottomPanel: UIView!
    @IBOutlet weak var apple: UIImageView!
    
    @IBOutlet weak var congratsView: UIView!
    @IBOutlet weak var correctLabel: UILabel!
    @IBOutlet weak var starImage: UIImageView!
    @IBOutlet weak var starImage2: UIImageView!
    @IBOutlet weak var starImage3: UIImageView!
    @IBOutlet weak var starImage4: UIImageView!
    @IBOutlet weak var starImage5: UIImageView!
    @IBOutlet weak var thumbs1: UIImageView!
    @IBOutlet weak var thumbs2: UIImageView!
    @IBOutlet weak var thumbs3: UIImageView!
    
    
    //func handlePan(_ panGes: UIGestureRecognizer) {
        //let point: CGPoint = panGes.location(in: apple)
        //var appleBounds: CGRect = apple.bounds
        //let bottomPanelView: CGRect = bottomPanel.frame
        //var newX: CGFloat = min(point.x, appleBounds.size.width - bottomPanelView.size.width)
        //newX = max(newX, 0.0)
        //var newY: CGFloat = min(point.y, appleBounds.size.height - bottomPanelView.size.height)
        //newY = max(newY, 0.0)
        //appleBounds.origin.x = newX
        //appleBounds.origin.y = newY
        //bottomPanel.frame = bottomPanelView
    //}

    var ans = 0
    var rand1 = Int(arc4random_uniform(4))
    var rand2 = Int(arc4random_uniform(4))
    var sum = 0
    
    @IBAction func reset(_ sender: AnyObject) {
        answerLabel.alpha = 0
        congratsView.isHidden = true
        answerLabel.textColor = UIColor.red;
        ans = 0
        rand1 = Int(arc4random_uniform(5))
        rand2 = Int(arc4random_uniform(5))
        sum = rand1 + rand2
        questionLabel.text = String(rand1) + " + " + String(rand2) + " = "
        questionLabel.textColor = UIColor.white
    }
    
    @IBAction func button(_ sender: AnyObject) {
        ans = sender.tag
        
        if ans == sum {
            playCorrectSound(filename: "chime.wav")
            congratsView.isHidden = false
            correctLabel.text = String(rand1) + " + " + String(rand2) + " = " + String(sum) + "!"
            
            UIView.animate(withDuration: 0.5, delay: 0, options: [.autoreverse, .repeat], animations: {
                self.starImage.alpha = 0
                self.starImage2.alpha = 0
                self.starImage3.alpha = 0
                self.starImage4.alpha = 0
                self.starImage5.alpha = 0
            }, completion: nil)
            
            UIView.animate(withDuration: 20, delay: 0, options: .repeat, animations: {
                self.thumbs1.center.x = 500
            }, completion: nil)
            
            UIView.animate(withDuration: 20, delay: 0, options: .repeat, animations: {
                self.thumbs2.center.x = 500
            }, completion: nil)
            
            UIView.animate(withDuration: 20, delay: 0, options: .repeat, animations: {
                self.thumbs3.center.x = 500
            }, completion: nil)
        }
        else {
            playIncorrectSound(filename: "LowBeep.mp3")
            
            UIView.animate(withDuration: 0.8, animations: {
                self.answerLabel.alpha = 1
                self.answerLabel.alpha = 0
                self.answerLabel.alpha = 1
            }, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tree.alpha = 0.7
        topPanel.backgroundColor = UIColor.clear //white.withAlphaComponent(0.5)
        bottomPanel.backgroundColor = UIColor.clear
        
        //var appleBounds = apple.bounds
        //bottomPanel.frame = CGRect(x: 0, y: 260, width: 414, height: 476)
        
        playbgMusic(filename: "relaxing.mp3")
        
        //answerLabel.alpha = 0
        congratsView.isHidden = true
        answerLabel.textColor = UIColor.red;
        ans = 0
        rand1 = Int(arc4random_uniform(5))
        rand2 = Int(arc4random_uniform(5))
        sum = rand1 + rand2
        questionLabel.text = String(rand1) + " + " + String(rand2) + " = "
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
