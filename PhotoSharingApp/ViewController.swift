//
//  ViewController.swift
//  PhotoSharingApp
//
//  Created by Ufuk Orhan on 24.05.2022.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var sifreTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func girisYapTiklandi(_ sender: Any) {
        if emailTextField.text != "" && sifreTextField.text != "" {
            
            Auth.auth().signIn(withEmail: emailTextField.text!, password: sifreTextField.text!) { authdataresult, error in
                if error != nil {
                    self.hataMesaji(titleInput: "HATA!", messageInput: error?.localizedDescription ?? "Hata olustu tekrar deneyin")
                }
             else {
                self.performSegue(withIdentifier: "toFeedVC", sender: nil)
            }
        }
        } else {
            self.hataMesaji(titleInput: "HATA", messageInput: "Email ve Parola Giriniz!")
        }
        
    }
    
    @IBAction func kayitOlTiklandi(_ sender: Any) {
        
        if emailTextField.text != "" && sifreTextField.text != "" {
            // Kayit olma islemi
            Auth.auth().createUser(withEmail: emailTextField.text!, password: sifreTextField.text!) { authdataresult, error in
                if error != nil {
                    self.hataMesaji(titleInput: "HATA", messageInput: error?.localizedDescription ?? "Hata olustu tekrar deneyin")
                } else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        } else {
            hataMesaji(titleInput: "HATA!", messageInput: "Email ve Sifre giriniz!")
        }
        
    }
    
    func hataMesaji(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: .alert)
        let okbutton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okbutton)
        self.present(alert, animated: true, completion: nil)
    }
}

