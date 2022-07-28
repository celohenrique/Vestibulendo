//
//  timerPage.swift
//  nano_3
//
//  Created by Marcelo Araujo on 27/04/22.
//


import UIKit
class timerPage: UIViewController{
    
    
    
    var timerBookNameString : String?
    var timerAuthorNameString : String?
    @IBOutlet weak var timerBookName: UILabel!
    @IBOutlet weak var timerAuthorName: UILabel!
    var bookIdTimerInt : Int?
    
    
    
    @IBOutlet weak var saveInfo: UIButton!
    @IBOutlet weak var startPage: UITextField!
    @IBOutlet weak var endPage: UITextField!
 
    
    
    
    
    var timer : Timer = Timer()
    var contador : Int = 0
    var contadorTimer : Bool = false
    
    
    @IBOutlet weak var relogioLabel: UILabel!
    @IBOutlet weak var comecarOutlet: UIButton!
    @IBOutlet weak var recomecarOutlet: UIButton!
    
    
    
    
    @IBAction func comecarButtom(_ sender: Any) {
        
        if contadorTimer {
            
            contadorTimer = false
            timer.invalidate()
            comecarOutlet.setTitle("Começar", for: .normal)
            comecarOutlet.backgroundColor = UIColor .green
            
        }
        else {
            
            contadorTimer = true
            comecarOutlet.setTitle("Parar", for: .normal)
            comecarOutlet.backgroundColor = UIColor .red //UIColor(red: 255/255, green: 69/255, blue: 58/255, alpha: 0.5)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(contadorDoTimer), userInfo: nil, repeats: true)
        }
        
    }
    
    
    
    
    @IBAction func recomecarButtom(_ sender: Any) {
        
        let alerta = UIAlertController(title: "Recomeçar o cronômetro?", message: "Gostaria realmente de recomeçar o cronômetro?", preferredStyle: .alert)
        alerta.addAction(UIAlertAction(title: "NÃO", style: .cancel, handler: { UIAlertAction in
            
        }))
        
        alerta.addAction(UIAlertAction(title: "SIM", style: .default, handler: { UIAlertAction in
            self.contador = 0
            self.timer.invalidate()
            self.relogioLabel.text = self.makeTimeString(hours: 0, minutes: 0, seconds: 0)
            self.comecarOutlet.setTitle("Começar", for: .normal)
            self.comecarOutlet.backgroundColor = UIColor .green
            
        }))
        
        self.present(alerta, animated: true, completion: nil)
        
    }
    
    @objc func contadorDoTimer() -> Void
        {
            contador = contador + 1
            let time = secondsToHoursMinutesSeconds(seconds: contador)
            let timeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
            relogioLabel.text = timeString
        }
        
        func secondsToHoursMinutesSeconds(seconds: Int) -> (Int, Int, Int)
        {
            return ((seconds / 3600), ((seconds % 3600) / 60),((seconds % 3600) % 60))
        }
        
        func makeTimeString(hours: Int, minutes: Int, seconds : Int) -> String
        {
            var timeString = ""
            timeString += String(format: "%02d", hours)
            timeString += " : "
            timeString += String(format: "%02d", minutes)
            timeString += " : "
            timeString += String(format: "%02d", seconds)
            return timeString
        }
    
    
    
    
    override func viewDidLoad() {
        
        if UserDefaults.standard.string(forKey: "end\(bookIdTimerInt!)") != nil{
            endPage.text = UserDefaults.standard.string(forKey: "end\(bookIdTimerInt!)")
        }
        
        
        if UserDefaults.standard.string(forKey: "r\(bookIdTimerInt!)") != nil{
            relogioLabel.text = UserDefaults.standard.string(forKey: "r\(bookIdTimerInt!)")
        }
        
        //UserDefaults.standard.string(forKey: "r\(bookIdTimerInt!)")
        
        
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DismissKeyboard))
        view.addGestureRecognizer(tap)
        
       // bookIdTimerInt = bookIdInt
        timerBookName.text = timerBookNameString
        timerAuthorName.text = timerAuthorNameString
        
        //bookIdTimerInt
        
        comecarOutlet.layer.cornerRadius = comecarOutlet.frame.width / 2
        comecarOutlet.layer.masksToBounds = true
        
        comecarOutlet.backgroundColor = UIColor .green
        
        super.viewDidLoad()
    
        
    }
    
    @objc func DismissKeyboard(){
        view.endEditing(true)
    }
    
    
    
    @IBAction func saveTimer(_ sender: Any) {
        
        let startpage = Int(startPage.text!) ?? 0
        let endpage = Int(endPage.text!) ?? 0
        let resultPages = endpage - startpage
        let relogiolabel = String(relogioLabel.text!)
         //resultPages = nresult
        //creat ntotal (totalNumOfPages) ntotal needs to come from bookDetail Screen
        //creat nresultFirst to receive nTotal/nResult
        //creat nValorDoProgressBar to receive 1 - nresultFirst
        
        
        
        switch bookIdTimerInt{
          
        case 0: UserDefaults.standard.set(endpage, forKey: "end0")
                UserDefaults.standard.set(resultPages, forKey: "result0")
                UserDefaults.standard.set(relogiolabel, forKey: "r0")
            
        case 1: UserDefaults.standard.set(endpage, forKey: "end1")
                UserDefaults.standard.set(resultPages, forKey: "result1")
            UserDefaults.standard.set(relogiolabel, forKey: "r1")
            
        case 2: UserDefaults.standard.set(endpage, forKey: "end2")
                UserDefaults.standard.set(resultPages, forKey: "result2")
            UserDefaults.standard.set(relogiolabel, forKey: "r2")
            
        case 3: UserDefaults.standard.set(endpage, forKey: "end3")
                UserDefaults.standard.set(resultPages, forKey: "result3")
            UserDefaults.standard.set(relogiolabel, forKey: "r3")
            
        case 4: UserDefaults.standard.set(endpage, forKey: "end4")
                UserDefaults.standard.set(resultPages, forKey: "result4")
            UserDefaults.standard.set(relogiolabel, forKey: "r4")
            
        case 5: UserDefaults.standard.set(endpage, forKey: "end5")
                UserDefaults.standard.set(resultPages, forKey: "result5")
            UserDefaults.standard.set(relogiolabel, forKey: "r5")
            
        case 6: UserDefaults.standard.set(endpage, forKey: "end6")
                UserDefaults.standard.set(resultPages, forKey: "result6")
            UserDefaults.standard.set(relogiolabel, forKey: "r6")
            
        case 7: UserDefaults.standard.set(endpage, forKey: "end7")
                UserDefaults.standard.set(resultPages, forKey: "result7")
            UserDefaults.standard.set(relogiolabel, forKey: "r7")
            
        default : UserDefaults.standard.set(endpage, forKey: "end8")
                  UserDefaults.standard.set(resultPages, forKey: "result8")
            UserDefaults.standard.set(relogiolabel, forKey: "r8")
            
        }
        
        
    }
    
    
}
