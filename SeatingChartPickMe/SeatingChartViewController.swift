//
//  SeatingChartViewController.swift
//  SeatingChartPickMe
//
//  Created by Derek Fitzer on 1/23/20.
//  Copyright © 2020 Derek Fitzer. All rights reserved.
//

import UIKit

class SeatingChartViewController: UIViewController {

    var green = [String]()
    var blue = [String]()
    var white = [String]()
    var purple = [String]()
    var count = 0
    
    var namesMain = ["Grace", "Christian", "Eric", "Cameron S.", "James", "Gage", "Sarah", "Cameron B.", "Nick", "Daniel", "Preston", "Mr. Fitzer", "Di", "Jay"]
    var names = [String]()
    
    @IBOutlet var namesText: [UITextView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    @IBAction func subWeek(_ sender: UIButton) {
    }
    @IBAction func addWeek(_ sender: UIButton) {
    }
    
    @IBAction func createChart(_ sender: UIButton) {
        names = namesMain
        names.shuffle()
        genName3(output: 0)
        genName3(output: 1)
        genName4(output: 2)
        genName4(output: 3)
        
        
    }
    
    func genName3(output: Int){
        for _ in (1...3){
            let cpy = names[0]
            green.append(cpy)
            names.remove(at: 0)
        }
        namesText[output].text = "\(green[0]) \n\(green[1]) \n\(green[2]) "
        green = [String]()
        
    }
    func genName4(output: Int){
        for _ in (1...4){
            let cpy = names[0]
            green.append(cpy)
            names.remove(at: 0)
        }
        namesText[output].text = "\(green[0]) \n\(green[1]) \n\(green[2]) \n\(green[3])"
        green = [String]()
    }

}
