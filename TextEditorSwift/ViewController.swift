//
//  ViewController.swift
//  TextEditorSwift
//
//  Created by LARHCHIM ISMAIL on 5/31/21.
//  Copyright © 2021 LARHCHIM ISMAIL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var grasText: UIButton!
    
    
    @IBOutlet weak var italiqueText: UIButton!
    
    
    @IBOutlet weak var souligneText: UIButton!
    
    
    @IBOutlet weak var smiley1: UIImageView!
    
    
    @IBOutlet weak var smiley2: UIImageView!
    
    
    @IBOutlet weak var smiley3: UIImageView!
    
    
    @IBOutlet weak var Text: UITextField!
    
    
    @IBOutlet weak var sw1: UISwitch!
    
    
    @IBOutlet weak var sw2: UISwitch!
    
    
    @IBOutlet weak var sw3: UISwitch!
    
    var colort:UIColor?
    var fontt:UIFont?
    var und:Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       Text.textAlignment = .left
       Text.contentVerticalAlignment = .top
        smiley1.image = UIImage(named: "em1")
        smiley2.image = UIImage(named: "em2")
        smiley3.image = UIImage(named: "em3")

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        smiley1.isUserInteractionEnabled = true
        smiley1.addGestureRecognizer(tapGestureRecognizer)
        
        
       let tap = UITapGestureRecognizer(target: self, action: #selector(self.tappedMe))
       smiley2.addGestureRecognizer(tap)
       smiley2.isUserInteractionEnabled = true
        
        
        let tapp = UITapGestureRecognizer(target: self, action: #selector(self.tappedMe3))
        smiley3.addGestureRecognizer(tapp)
        smiley3.isUserInteractionEnabled = true
         
        
        
        
    }

    
    @IBAction func blackAction(_ sender: UISwitch) {
        
        if sender.isOn {
            sw2.isOn = false
            sw3.isOn = false
        }
        self.Text.textColor = UIColor.black
        self.colort = UIColor.black
        
    }
    
    
    
    @IBAction func RedAction(_ sender: UISwitch) {
        if sender.isOn {
            sw1.isOn = false
            sw3.isOn = false
        }
        self.Text.textColor = UIColor.red
                self.colort = UIColor.red

    }
    
    
    
    @IBAction func BlueAction(_ sender: UISwitch) {
        if sender.isOn {
            sw1.isOn = false
            sw2.isOn = false
        }
        self.Text.textColor = UIColor.blue
                self.colort = UIColor.blue
    }
    
    @IBAction func GrasAction(_ sender: Any) {
        Text.font = UIFont.boldSystemFont(ofSize: 13)
        self.fontt = UIFont.boldSystemFont(ofSize: 13)
    }
    
    
    @IBAction func ItaliqueAction(_ sender: Any) {
        self.Text.font = UIFont.italicSystemFont(ofSize: 13)
        self.fontt = UIFont.italicSystemFont(ofSize: 13)

    }
    
    @IBAction func souligneAction(_ sender: Any) {
       
        self.Text.font = UIFont.boldSystemFont(ofSize: 45)
        self.fontt = UIFont.boldSystemFont(ofSize: 45)

    }
    
    
    @IBAction func underl(_ sender: Any) {
        
        self.und = true
       
         let alertVC = UIAlertController(title: "Text State", message: "vous avez activé le mode texte souligné", preferredStyle: .alert)
                           alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                           present(alertVC, animated: true, completion: nil)
    }
    
    
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        self.Text.text = Text.text! + "😂"

    }
    
    
    @objc func tappedMe(tapGestureRecognizer: UITapGestureRecognizer)
     {
         let tappedImage = tapGestureRecognizer.view as! UIImageView
        self.Text.text = Text.text! + "😲"

     }
    
    
   @objc func tappedMe3(tapGestureRecognizer: UITapGestureRecognizer)
     {
         let tappedImage = tapGestureRecognizer.view as! UIImageView
        self.Text.text = Text.text! + "😰"

     }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "seeText" {
            
            let cs = segue.destination as! ViewController2
            
            cs.message = self.Text.text
            cs.mcolor = self.colort
            cs.mtextfont = self.fontt
            cs.condund = self.und
            
            self.und = false
           
          
        }
    }
    
    
   
    
    
}

