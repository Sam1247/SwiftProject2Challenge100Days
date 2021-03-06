//
//  ViewController.swift
//  Project2
//
//  Created by Abdalla Elsaman on 2/20/19.
//  Copyright © 2019 Dumbies. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var numberOfQuestion = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(showScore))
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        askQuestion()
    }

    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        title = countries[correctAnswer].uppercased()
    }
    
    @objc func showScore () {
        let ACShowScore =  UIAlertController(title: "SCORE", message: "your score is \(score)", preferredStyle: .alert)
        ACShowScore.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil))
        present(ACShowScore, animated: true)
    }

    @IBAction func buttonTaped(_ sender: UIButton) {
        numberOfQuestion += 1
        if sender.tag == correctAnswer {
            score += 1
            title = countries[correctAnswer].uppercased()
        } else {
            score -= 1
            title = countries[correctAnswer].uppercased()
        }
        if numberOfQuestion == 10 {
            let ACShareScore =  UIAlertController(title: "SCORE", message: "your score is \(score)", preferredStyle: .alert)
            ACShareScore.addAction(UIAlertAction(title: "Share", style: .default, handler: shareScore))
            ACShareScore.addAction(UIAlertAction(title: "cancel", style: .default, handler: nil))
            present(ACShareScore, animated: true)
            score = 0
            numberOfQuestion = 0
        }
        askQuestion()
//        let ac: UIAlertController
//        if sender.tag == correctAnswer {
//            score += 1
//            ac = UIAlertController(title: "Correct", message: "your score is \(score)", preferredStyle: .alert)
//            title = countries[correctAnswer].uppercased() + " - Score: \(score)"
//        } else {
//            score -= 1
//            ac = UIAlertController(title: "Wrong", message: "That's a flag of \(countries[sender.tag]) \n your score is \(score)", preferredStyle: .alert)
//            title = countries[correctAnswer].uppercased() + " - Score: \(score)"
//        }
//        if numberOfQuestion == 10 {
//            ac.addAction(UIAlertAction(title: "Restart", style: .default, handler: askQuestion))
//            score = 0
//            numberOfQuestion = 0
//        } else {
//            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
//        }
//        present(ac, animated: true)
    }
    
    func shareScore (action: UIAlertAction! = nil) {
        let vc = UIActivityViewController(activityItems: [score], applicationActivities: [])
        // this line for compatablity with iPad
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}

