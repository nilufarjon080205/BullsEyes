//
//  ViewController.swift
//  Nilujon
//
//  Created by second_admin on 21/06/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var guessingLabel: UILabel!
    @IBOutlet weak var guessingScore: UILabel!
    @IBOutlet weak var guessingRound: UILabel!
    
    @IBOutlet weak var rulesLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
//    @IBOutlet weak var pinkView: UIView!
    @IBOutlet weak var pinkView: UIView!
    
    let gameManager = GameManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        pinkView.layer.cornerRadius = 10
        pinkView.layer.borderWidth = 2
        pinkView.layer.borderColor = UIColor.green.cgColor
        pinkView.backgroundColor = .green
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        pinkView.addGestureRecognizer(tapGesture)
        let thumbImage = UIImage(named: "nub")
        slider.setThumbImage(thumbImage, for: .normal)
        rulesLabel.text = rulesLabel.text? .uppercased ()
        updateLabels()

        print("I am in a ViewController")
        print("guess number", gameManager.guessingNumber)
        guessingLabel.text = String(gameManager.guessingNumber)
        guessingScore.text = String(gameManager.score)
        guessingRound.text = String(gameManager.round)
    }
    
    @objc func handleLongPressTap() {
        print("dolgoe zazhatie viewshki")
    }
    
    @objc func handleTap() {
        print("tapnuli menya")
    }
    
    @IBAction func handleButtomTap(_sender: Any) {
        print(slider.value)
    }
    
    @IBAction func handleButtonTap(_ sender: Any) {
        print("tap the button")
        print(slider.value)
        let selectedNumber = Int(slider.value)
        if selectedNumber == gameManager.guessingNumber {
            print("you guessed the number")
            gameManager.score = gameManager.score + 100
        } else if abs(gameManager.guessingNumber - selectedNumber) <= 10 {
            gameManager.score += 50
        }
        else {
            print("you did not guess the number")
        }
        if gameManager.round < 10 {
            gameManager.nextRound()
        } else {
            showAlert()
        }
        updateLabels()
    }
    func updateLabels() {
        guessingLabel.text = String(gameManager.guessingNumber)
        guessingScore.text = String(gameManager.score)
        guessingRound.text = String(gameManager.round)
        
    }
    
    func showAlert() {
        print("show alert and start a new game")
        let myAlert = UIAlertController(title: "game over", message: "u earned \(gameManager.score) units. wanna start a new game?", preferredStyle: .alert)
        let handler: ((UIAlertAction) -> Void)? = {
            action in print("start a new game")
            self.gameManager.startNewGame()
            self.updateLabels()
        }
        let action = UIAlertAction(title: "start", style: .default, handler: handler)
        myAlert.addAction(action)
        let cancelAction = UIAlertAction(title: "finish the game", style: .cancel, handler: handler)
        myAlert.addAction(cancelAction)
        show(myAlert, sender: self)
    }
}

