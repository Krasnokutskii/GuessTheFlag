//
//  ViewController.swift
//  Project2
//
//  Created by Ярослав on 3/17/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var amountOfQuestion = 0{
        didSet{
            if amountOfQuestion == 10{
                let ac = UIAlertController(title: "end of game", message: "Yor score is \(score) out of 10", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: newGame))
                present(ac, animated: true)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany","ireland","italy","monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1

        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor

        askQuestion()
    }
    func newGame(action: UIAlertAction! = nil){
        score = 0
        amountOfQuestion = 0
    }

    func askQuestion(action: UIAlertAction! = nil){
        countries.shuffle()
        
//        if amountOfQuestion == 10{
//            let ac = UIAlertController(title: "Finish", message: "Your score \(score) of 10", preferredStyle: .actionSheet)
//            ac.addAction(UIAlertAction(title: "new game",
//                                       style: .default,
//                                       handler: newGame))
//        }
        
        correctAnswer = Int.random(in: 0...2)
        title = countries[correctAnswer].uppercased() + " \(score)"
        
        amountOfQuestion += 1
        print(countries)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        
        
            if sender.tag == self.correctAnswer {
            title = "Correct"
                self.score += 1
        }else{
            title = "Wrong. It was flag of \(self.countries[sender.tag].uppercased())"
            self.score -= 1
        }
        
        
        print(sender.tag)
            print(self.amountOfQuestion)
        
//            let ac = UIAlertController(title: title, message: "Yor score is \(self.score)", preferredStyle: .alert)
//            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: self.askQuestion))
        
    
            let ac = UIAlertController(title: title, message: "Yor score is \(self.score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: self.askQuestion))
            self.present(ac, animated: true)
        
    }
}

