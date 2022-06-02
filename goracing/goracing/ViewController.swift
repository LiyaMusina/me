//
//  ViewController.swift
//  goracing
//
//  Created by Студент on 31.05.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pcCar: UIImageView!
    
    @IBOutlet weak var userCar: UIImageView!
    
    
    @IBOutlet weak var finishLabel: UILabel!
    
    
    @IBOutlet weak var semaforLabel: UILabel!
    
    
    @IBOutlet weak var startButton: UIButton!
    
    
    @IBOutlet weak var driveButton: UIButton!
    
    
    @IBOutlet weak var linefinish: UIImageView!
    
    var stateSemafor: Int = 1 //  типа стоит
    var timerGame: Timer!
    var timerPC: Timer!
    @IBAction func driveCar(_ sender: Any) {
        if stateSemafor == 2{
            userCar.center.x += 10
        }
        if stateSemafor == 1{
            userCar.center.x -= 10
        }
        if userCar.center.x >
            linefinish.center.x {
            finishLabel.isHidden = false
            finishLabel.text = "ну шо.. выиграл получается"
            finishLabel.textColor = .green
            timerGame.invalidate()
            //timerPC.invalidate()
            driveButton.isEnabled = false
        }
    }
    
    
    @IBAction func startGame(_ sender: Any) {
        startButton.isHidden = true
        semaforLabel.isHidden = false
        timerGame = Timer.scheduledTimer(timeInterval: Double.random(in: 1...5),
                                         target: self,
                                         selector: #selector(intervalTimer),
                                         userInfo: nil, repeats: true)
        timerPC = Timer.scheduledTimer(timeInterval: 0.5, target: self,
                                       selector: #selector(pcDrive),
                                       userInfo: nil, repeats: true)
        
    }
    
    @objc func intervalTimer() {
        stateSemafor += 1
        if stateSemafor > 2 {
            stateSemafor = 1
        }
        switch stateSemafor {
        case 1:
            semaforLabel.text = "СТОПЭ БЛИН.."
            semaforLabel.textColor = .red
        case 2:
            semaforLabel.text = "Чо встал?! Едь давай!!"
            semaforLabel.textColor = .green
        default:
            break
        }
    }
    @objc func pcDrive(){
        if stateSemafor == 2{
            pcCar.center.x += 10
        }
        if pcCar.center.x > linefinish.center.x {
            finishLabel.isHidden = false
            finishLabel.text = "Ну ты балбесина!"
            finishLabel.textColor = .red
            timerGame.invalidate()
            timerPC.invalidate()
            driveButton.isEnabled = false
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        finishLabel.isHidden = true
        semaforLabel.isHidden = true
    }


}

