//
//  ViewController.swift
//  nano_3
//
//  Created by Marcelo Araujo on 13/04/22.
//

import UIKit

struct TheBooks {
    var Name : String
    var AuthorName : String
    var Category : String
    var bookcover : UIImage
    var status : Int
    var bookId : Int
}



class booksPage: UIViewController {

    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let booksNames : [TheBooks] = [ TheBooks(Name: "Nove Noites", AuthorName: "Bernardo Carvalho", Category: "Pós-Modernismo", bookcover: UIImage(named: "nove noites")!, status: 2, bookId: 0)]
    
    var lido : [TheBooks] = [TheBooks(Name: "Nove Noites", AuthorName: "Bernardo Carvalho", Category: "Pós-Modernismo", bookcover: UIImage(named: "nove noites")!, status: 2, bookId: 0)]
    var lendo  : [TheBooks] = []
    var naoLido : [TheBooks] = [TheBooks(Name: "Romanceiro da Inconfidência", AuthorName: "Cecília Meireles", Category: "Modernismo", bookcover: UIImage(named: "romanceiro da inconfidencia")!, status: 0, bookId: 1), TheBooks(Name: "Poemas Escolhidos", AuthorName: "Gregorio de Matos", Category: "Barroco", bookcover: UIImage(named: "poemasescolhidos")!, status: 1, bookId: 2),TheBooks(Name: "Quincas Borba", AuthorName: "Machado de Assis", Category: "Realismo", bookcover: UIImage(named: "quincasborba")!, status: 2, bookId: 3), TheBooks(Name: "Alguma poesia", AuthorName: "Carlos Drummond de Andrade", Category: "Modernismo", bookcover: UIImage(named: "alguma poesia")!, status: 0, bookId: 4), TheBooks(Name: "Angústia", AuthorName: "Graciliano Ramos", Category: "Modernismo", bookcover: UIImage(named: "angustia")!, status: 1, bookId: 5), TheBooks(Name: "Mensagem", AuthorName: "Fernando Pessoa", Category: "Modernismo", bookcover: UIImage(named: "mensagem")!, status: 0, bookId: 6), TheBooks(Name: "Terra Sonâmbula", AuthorName: "Mia Couto", Category: "Modernismo", bookcover: UIImage(named: "terra sonambula")!, status: 0, bookId: 7), TheBooks(Name: "Campo Geral", AuthorName: "Guimarães Rosa", Category: "Modernismo", bookcover: UIImage(named: "campogeral")!, status: 0, bookId: 8)]
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        
        
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}

extension booksPage : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return naoLido.count
            
            
        }
        else if section == 1 {
            
            return lendo.count
        }
        else {
            
            return lido.count
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Não lido"
        }
        else if section == 1 {
            return "Lendo"
        }
        else{
            return "Lido"
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
      //  var teste : TheBooks?
        
      
        
        if indexPath.section == 0{

            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! booksCell
            cell.bookTitle.text = naoLido[indexPath.row].Name
            cell.coverBook.image = naoLido[indexPath.row].bookcover
            cell.authorView.text = naoLido[indexPath.row].AuthorName
            cell.StyleViewLivros.text = naoLido[indexPath.row].Category
            cell.StyleViewLivros.layer.cornerRadius = 5
            let resutadinho2 = UserDefaults.standard.string(forKey: "resutadinho\(naoLido[indexPath.row].bookId)")
            cell.outletBotao.setTitle("\(resutadinho2 ?? "0") págs para acabar", for: .normal)
            
            
            
            
    
            if cell.StyleViewLivros.text == "Barroco"{
                cell.StyleViewLivros.backgroundColor = UIColor.init(red: 29/255, green: 174/255, blue: 235/255, alpha: 1.00)
            } else if cell.StyleViewLivros.text == "Realismo"{
                cell.StyleViewLivros.backgroundColor = UIColor.init(red: 250/255, green: 179/255, blue: 76/255, alpha: 1.00)
            }else{
                cell.StyleViewLivros.backgroundColor = UIColor.init(red: 242/255, green: 121/255, blue: 63/255, alpha: 1.00)
            }
            
            
            return cell
            
            
        }
        
        else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! booksCell
            cell.bookTitle.text = lendo[indexPath.row].Name
            cell.coverBook.image = lendo[indexPath.row].bookcover
            cell.authorView.text = lendo[indexPath.row].AuthorName
            cell.StyleViewLivros.text = lendo[indexPath.row].Category
            let resutadinho2 = UserDefaults.standard.string(forKey: "resutadinho\(lendo[indexPath.row].bookId)")
            cell.outletBotao.setTitle("\(resutadinho2 ?? "0") págs para acabar", for: .normal)
            return cell
        }
        
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! booksCell
            cell.bookTitle.text = lido[indexPath.row].Name
            cell.coverBook.image = lido[indexPath.row].bookcover
            cell.authorView.text = lido[indexPath.row].AuthorName
            cell.StyleViewLivros.text = lido[indexPath.row].Category
            cell.outletBotao.setTitle("Você acabou esse livro", for: .normal)
            return cell
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let clicado : TheBooks?
        // let clicado = naoLido[indexPath.row]
        
        if indexPath.section == 0 {
            clicado = naoLido[indexPath.row]
            
            naoLido.remove(at: indexPath.row)
            
            lendo.append(clicado!)
            
        }
        else if indexPath.section == 1 {
            
            clicado = lendo[indexPath.row]
        }
        else {
            
            clicado = lido[indexPath.row]
            
        }
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "detail") as? bookDetail{
            
            //passar pra outra pagina
            
        //    vc.indexPathBookD = clicado?.IndexPa
            vc.bookIdInt = clicado?.bookId
            vc.bookNameString = clicado?.Name
            vc.authorNameString = clicado?.AuthorName
            vc.BookPic = clicado?.bookcover
            
            self.navigationController?.pushViewController(vc, animated: true)
            
            
            
        }
        
        
    }
    
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.textColor = UIColor.black
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 19)
        header.textLabel?.frame = header.bounds
        header.textLabel?.textAlignment = .left
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    
    
}







class booksCell : UITableViewCell {
    
    @IBOutlet weak var coverBook: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var authorView: UILabel!
    @IBOutlet weak var StyleViewLivros: UILabel!
    @IBOutlet weak var outletBotao: UIButton!
    
    
    
    @IBAction func readingInfoButton(_ sender: Any) {
    
        
        
    }
    
}

