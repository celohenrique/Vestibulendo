//
//  relatorioPage.swift
//  nano_3
//
//  Created by Marcelo Araujo on 06/05/22.
//

import UIKit
class relatorioPage: UIViewController{

    
    @IBOutlet weak var faltaXPaginas: UILabel!
    
    
    //let timerPageCotroller = timerPage()
    //var endPageRelatorio : Int?
    var bookIdIntelatorio : Int?
    var tituloRelatorioPageString : String?
    var authorRelatorioPageString : String?
    
    @IBOutlet weak var tituloRelatorioPage: UILabel!
    
    @IBOutlet weak var authorRelatorioPage: UILabel!
    
    @IBOutlet weak var progressView: UILabel!
    
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        let totalipages = UserDefaults.standard.integer(forKey: "b\(bookIdIntelatorio!)")
        let ultimapagina = UserDefaults.standard.integer(forKey: "end\(bookIdIntelatorio!)")
            
        
        let resutadin : Int = (Int(totalipages)-Int(ultimapagina))
        
        UserDefaults.standard.set(resutadin, forKey: "resutadinho\(bookIdIntelatorio!)")
        
        faltaXPaginas.text = "Faltam \(resutadin) páginas para temrinar o livro."
        
        
        
        var compages = UserDefaults.standard.integer(forKey: "end\(bookIdIntelatorio!)")
        var totpages = UserDefaults.standard.integer(forKey: "b\(bookIdIntelatorio!)")
        
        let progresso : Float = Float(compages)/Float(totpages)
        
        let atualProgresso : Float = progresso*100
        if atualProgresso != nil{
        self.progressView.text = "Você já leu \(atualProgresso)% do livro!"
        }
        
        progressBar.setProgress(progresso,animated: true)
        
    }
    
//    let cliquei : TheBooks? = nil
    
    
//    @IBAction func terminadoBt(_ sender: Any) {
//
//        if indexPath.section == 0 {
//            cliquei = lendo[indexPath.row]
//
//            naoLido.remove(at: indexPath.row)
//
//            lendo.append(clicado!)
//
//        }
//        else if indexPath.section == 1 {
//
//            clicado = lendo[indexPath.row]
//        }
//        else {
//
//            clicado = lido[indexPath.row]
//
//        }
//
//
//
//
//    }
    
    
    
    override func viewDidLoad() {
        
        
        
        
        progressBar.transform = progressBar.transform.scaledBy(x: 1, y: 10)
        
        tituloRelatorioPage.text = tituloRelatorioPageString
        
        authorRelatorioPage.text = authorRelatorioPageString
        
        super.viewDidLoad()

    }

    

}
