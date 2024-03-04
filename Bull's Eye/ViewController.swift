//
//  ViewController.swift
//  Bull's Eye
//
//  Created by Cem TAŞKIN on 26.02.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var slider : UISlider!
    @IBOutlet weak var lblTarget : UILabel!
    @IBOutlet weak var lblScore : UILabel!
    @IBOutlet weak var lblRound : UILabel!
    
    var currentValue = 0
    var targetValue = 0
    var round=0
    var score=0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View Did Loaded")
        startNewRound()
        
    }
    
    func startNewRound(){
        targetValue  = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        round+=1
        updateLabels()
       
    }
    
    func updateLabels(){
        lblTarget.text="\(targetValue)"
        lblRound.text="\(round)"
        lblScore.text="\(score)"
        
    }

    
    @IBAction func showAlert(){
        let diff = abs(currentValue-targetValue)
        var point  = 100 - diff
        
        let title : String
        if (diff==0){
            point+=100
            title="Perfect!"
        }else if (diff<5){
            point+=50
            title="You almost done it"
        }else if (diff<10){
            title="Pretty good!"
        }else{
            title="Not even close..."
        }
        score+=point
        let message="You scored \(point) points"
    
        let alert = UIAlertController(title:title,message: message,preferredStyle:.alert)
        let action = UIAlertAction(title: "OK", style: .default,handler: nil)
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
        startNewRound()
    }
    @IBAction func test(){
        print("This is a test function")
    }
    
    @IBAction func sliderMoved (_ slider:UISlider){
        //print("The value of slider is now : \(slider.value)")
        currentValue = lroundf(slider.value)
    }
    
    
    
    
    
    
    

}

