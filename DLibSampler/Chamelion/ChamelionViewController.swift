//
//  ChamelionViewController.swift
//  DLibSampler
//
//  Created by ELLIOTT, Dylan on 9/3/18.
//  Copyright © 2018 Dylan Elliott. All rights reserved.
//

import UIKit
import ChameleonFramework

class ChamelionViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setStatusBarStyle(UIStatusBarStyleContrast)
        self.setThemeUsingPrimaryColor(.blue, with: .dark)
    }
    
    let colors: [UIColor] = [.flatRed, .flatOrange, .flatYellow, .flatSand, .flatNavyBlue, .flatBlack, .flatMagenta, .flatTeal, .flatSkyBlue, .flatGreen, .flatMint, .flatWhite, .flatGray, .flatForestGreen, .flatPurple, .flatBrown, .flatPlum, .flatWatermelon, .flatLime, .flatPink, .flatMaroon, .flatCoffee, .flatPowderBlue, .flatBlue]
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.reusableCell()
        
        let color = colors[indexPath.row]
        
        cell.backgroundColor = color
        
        cell.textLabel?.text = color.hexValue()
        cell.textLabel?.textColor = ContrastColorOf(color, returnFlat: true)
        cell.textLabel?.textAlignment = .center
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let color = colors[indexPath.row]
        
        self.setThemeUsingPrimaryColor(color, with: .contrast)
    }
}
