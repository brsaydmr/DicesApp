//
//  ViewController.swift
//  zarApp
//
//  Created by Barış Aydemir on 2.08.2023.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {

    @IBOutlet weak var backgraundİmage: UIImageView!
    
    @IBOutlet weak var zar1image: UIImageView!
    
    @IBOutlet weak var zar2image: UIImageView!
    
    @IBOutlet weak var animation1Image: UIImageView!
    
    @IBOutlet weak var animation2Image: UIImageView!
    
    var images : [UIImage]! =
         [UIImage(named: "dice1")!,
         UIImage(named: "dice2")!,
         UIImage(named: "dice3")!,
         UIImage(named: "dice4")!,
         UIImage(named: "dice5")!,
         UIImage(named: "dice6")!,]
    
    var zarlar:[UIImage] = []
    
    var sesOynatici = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let animatedImage = UIImage.animatedImage(with: images, duration: 0.5)
        animation1Image.image = animatedImage
        animation2Image.image = animatedImage

        
        
        let zar1 = UIImage(named: "dice1")
        let zar2 = UIImage(named: "dice2")
        let zar3 = UIImage(named: "dice3")
        let zar4 = UIImage(named: "dice4")
        let zar5 = UIImage(named: "dice5")
        let zar6 = UIImage(named: "dice6")
        
        zarlar.append(zar1!)
        zarlar.append(zar2!)
        zarlar.append(zar3!)
        zarlar.append(zar4!)
        zarlar.append(zar5!)
        zarlar.append(zar6!)
        
        do{
            let dosyaYolu = Bundle.main.path(forResource: "diceses", ofType: ".mp3")
            sesOynatici = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: dosyaYolu!))
            sesOynatici.prepareToPlay()
        }catch{
            print(error.localizedDescription)
        }
        
            }
    
    @IBAction func zarAtButton(_ sender: Any) {
        
        sesOynatici.play()
        
        // Resmi göster
        animation1Image.isHidden = false
              
              // 2 saniye sonra resmi gizle
              DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                  self.animation1Image.isHidden = true
              }
        
        
        // Resmi göster
        animation2Image.isHidden = false
              
              // 2 saniye sonra resmi gizle
              DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                  self.animation2Image.isHidden = true
              }
                            
            zar1image.image = zarlar[Int.random(in: 0...5)]
            
            zar2image.image = zarlar[Int.random(in: 0...5)]

        }
    }



    

