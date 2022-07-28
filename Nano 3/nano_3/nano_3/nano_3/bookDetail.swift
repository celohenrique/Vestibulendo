//
//  bookDetail.swift
//  nano_3
//
//  Created by Marcelo Araujo on 25/04/22.
//

import UIKit
class bookDetail: UIViewController{

    var bookNameString : String?
    var authorNameString : String?
    var BookPic : UIImage?
    var indexPathBookD : String?
    
    
    @IBOutlet weak var bookName: UILabel!
    @IBOutlet weak var bookCover: UIImageView!
    @IBOutlet weak var authorName: UILabel!
    var bookIdInt : Int?
    
    @IBOutlet weak var NumeroTotaldePaginas: UITextField!
    
    
    var info : TheBooks?
    
    @IBAction func progressButton(_ sender: Any) {
        if let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "relatorio") as? relatorioPage{ //progresso de leitura
            
            
            //vc2.progressBar =
            
            vc2.bookIdIntelatorio = self.bookIdInt
            
            vc2.tituloRelatorioPageString = self.bookNameString
            
            vc2.authorRelatorioPageString = self.authorNameString
            
            
            self.navigationController?.pushViewController(vc2, animated: true)
            
        }
        
        
    }
    
    
    @IBAction func newSessionButton(_ sender: Any) {
        
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "timer") as? timerPage{
            
            vc.bookIdTimerInt = self.bookIdInt
            
            vc.timerBookNameString = self.bookNameString
            
            vc.timerAuthorNameString = self.authorNameString
            
            self.navigationController?.pushViewController(vc, animated: true)
        
        }
        
    }

    
override func viewDidLoad() {
    
    bookCover.layer.masksToBounds = true
    bookCover.layer.borderWidth = 8.5
    bookCover.layer.borderColor = CGColor(red: 123/255, green: 201/255, blue: 220/255, alpha: 0.5)
    
    
    if UserDefaults.standard.string(forKey: "b\(bookIdInt!)") != nil{
        NumeroTotaldePaginas.text = UserDefaults.standard.string(forKey: "b\(bookIdInt!)")
    }
    
    
    let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DismissKeyboard))
    view.addGestureRecognizer(tap)
    
    
    
    bookName.text = bookNameString
    bookCover.image = BookPic
    authorName.text = authorNameString

    super.viewDidLoad()

    
}
    @objc func DismissKeyboard(){
        view.endEditing(true)
    }

    
    @IBAction func save(_ sender: Any) {
        
        
        
        switch bookIdInt{
            
        case 0 : UserDefaults.standard.set(NumeroTotaldePaginas.text, forKey: "b0")
            
        case 1 : UserDefaults.standard.set(NumeroTotaldePaginas.text, forKey: "b1")
            
        case 2 : UserDefaults.standard.set(NumeroTotaldePaginas.text, forKey: "b2")
            
        case 3 : UserDefaults.standard.set(NumeroTotaldePaginas.text, forKey: "b3")
            
        case 4 : UserDefaults.standard.set(NumeroTotaldePaginas.text, forKey: "b4")
            
        case 5 : UserDefaults.standard.set(NumeroTotaldePaginas.text, forKey: "b5")
            
        case 6 : UserDefaults.standard.set(NumeroTotaldePaginas.text, forKey: "b6")
            
        case 7 : UserDefaults.standard.set(NumeroTotaldePaginas.text, forKey: "b7")
            
        default : UserDefaults.standard.set(NumeroTotaldePaginas.text, forKey: "b8")
            
        }
        
        
        
    }
    
}

