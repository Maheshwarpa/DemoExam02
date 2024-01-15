//
//  ViewController.swift
//  MaheshwarRealEstateApp
//
//  Created by Maheshwar Punyam Anand on 1/14/24.
//

import UIKit

class PropertyVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    var sample:Property = Property(name: "", address: "", price: 0, propertyImage: "", numberOfBedrooms: 0, numberOfBathrooms: 0)
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Property.section.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch(section){
        case 0..<3:
            return Property.section[section]
        default:
            return Property.section[section]
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch(section){
        case 0:
            return Property.first.count
        case 1:
            return Property.second.count
        case 2:
            return Property.third.count
        default:
            return Property.purchased.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = propertyTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? PropertyCell
        var sec = indexPath.section
        
        switch(sec){
        case 0:
            cell?.imageIV.image = UIImage(named: Property.first[indexPath.row].propertyImage)
            cell?.textLBL.text = Property.first[indexPath.row].name
        case 1:
            cell?.imageIV.image = UIImage(named: Property.second[indexPath.row].propertyImage)
            cell?.textLBL.text = Property.second[indexPath.row].name
        case 2:
            cell?.imageIV.image = UIImage(named: Property.third[indexPath.row].propertyImage)
            cell?.textLBL.text = Property.third[indexPath.row].name
        default:
            cell?.imageIV.image = UIImage(named: Property.purchased[indexPath.row].propertyImage)
            cell?.textLBL.text = Property.purchased[indexPath.row].name
        }
        
        
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(100)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch(indexPath.section){
        case 0:
            sample=Property.first[indexPath.row]
            performSegue(withIdentifier: "DetailSegue", sender: self)
        case 1:
            sample=Property.second[indexPath.row]
            performSegue(withIdentifier: "DetailSegue", sender: self)
        case 2:
            sample=Property.third[indexPath.row]
            performSegue(withIdentifier: "DetailSegue", sender: self)
        default:
            print("Its a Purchased Section")
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "DetailSegue"){
            let destVC = segue.destination as? PropertyDetailVC
            destVC?.address=sample.address
            destVC?.name=sample.name
            destVC?.bathroom=sample.numberOfBathrooms
            destVC?.bedroom=sample.numberOfBedrooms
            destVC?.price=String(sample.price)
            destVC?.image=sample.propertyImage
        }
    }
    
    
    @IBOutlet weak var propertyTableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        Property.first.removeAll()
        Property.second.removeAll()
        Property.third.removeAll()
        
        for inp in Property.data{
            switch(inp.price){
            case 500000..<750000:
                Property.first.append(inp)
            case 750000..<1000000:
                Property.second.append(inp)
            case 1000000...:
                Property.third.append(inp)
            default:
                Property.purchased.append(inp)
            }
        }
        
        propertyTableView.reloadData()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.propertyTableView.delegate = self
        self.propertyTableView.dataSource = self
        
        
        for inp in Property.data{
            switch(inp.price){
            case 500000..<750000:
                Property.first.append(inp)
            case 750000..<1000000:
                Property.second.append(inp)
            case 1000000...:
                Property.third.append(inp)
            default:
                Property.purchased.append(inp)
            }
        }
        
        
    }


}

