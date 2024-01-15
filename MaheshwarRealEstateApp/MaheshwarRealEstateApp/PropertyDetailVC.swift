//
//  PropertyDetailVC.swift
//  MaheshwarRealEstateApp
//
//  Created by Maheshwar Punyam Anand on 1/14/24.
//

import UIKit
import Lottie

class PropertyDetailVC: UIViewController {

    var name:String = ""
    var address = ""
    var price=""
    var image=""
    var bathroom = -1
    var bedroom = -1
    
    @IBOutlet weak var propertyIV: UIImageView!
    
    @IBOutlet weak var purchaseBTN: UIButton!
    
    @IBOutlet weak var animationView: LottieAnimationView!
    
    @IBOutlet weak var nameLBL: UILabel!
    
    @IBOutlet weak var addressLBL: UILabel!
    
    @IBOutlet weak var priceLBL: UILabel!
    
    @IBOutlet weak var bedroomsLBL: UILabel!
    
    @IBOutlet weak var bathroomsLBL: UILabel!
    
    
    
    
    @IBAction func purchase(_ sender: UIButton) {
        
        var amt = 0.0
        let total = Double(price)
        amt = 0.05*total!
        amt+=total!
        
        
        animationView.alpha=1
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .playOnce
        animationView.play(){ _ in
            
            self.animationView.alpha=0
            let alert = UIAlertController(title: "Congratulations!", message: "You have purchased the property. Total amount is $\(amt)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default,handler: { _ in
                for (index,prop) in Property.data.enumerated(){
                    if(prop.name == self.name){
                        Property.purchased.append(prop)
                        Property.data.remove(at: index)
                    }
                }
            }))
            self.present(alert, animated: true)
            self.purchaseBTN.isEnabled=false
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameLBL.text = "Property:\(name)"
        self.addressLBL.text="Address:\(address)"
        self.bathroomsLBL.text="Bathrooms:\(bathroom)"
        self.bedroomsLBL.text = "Bedrooms:\(bedroom)"
        self.propertyIV.image = UIImage(named: image)
        self.priceLBL.text = "Price:\(price)"
        
        animationView.alpha=0
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
