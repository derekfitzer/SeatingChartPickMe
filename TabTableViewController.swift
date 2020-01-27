//
//  TabTableViewController.swift
//  SeatingChartPickMe
//
//  Created by Derek Fitzer on 1/24/20.
//  Copyright © 2020 Derek Fitzer. All rights reserved.
//

// IDEA: press and hold will fire an alert for NOTE e.g. on phone, good job, needs help

import UIKit

class TabTableViewController: UITableViewController {
    
   // let defaults = UserDefaults.standard
    
    var sample = [[String]]()
        
    // var sample = [["Grace","0","0"],["Christian","0","0"],["Eric","0","0"],["Cameron S.","0","0"],["James","0","0"],["Gage","0","0"],["Sarah","0","0"],["Cameron B.","0","0"],["Nick","0","0"],["Daniel","0","0"],["Preston","0","0"],["Di","0","0"],["Jay","0","0"]]
    
//        var sample = [["derek","0"],["mona","1"],["mark","2"],["jen","3"]]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let defaults = UserDefaults.standard
        if let storedSample = defaults.array(forKey: "names") {
            sample = storedSample as! [[String]]
        } else {
            sample = [["Grace","0","0"],["Christian","0","0"],["Eric","0","0"],["Cameron S.","0","0"],["James","0","0"],["Gage","0","0"],["Sarah","0","0"],["Cameron B.","0","0"],["Nick","0","0"],["Daniel","0","0"],["Preston","0","0"],["Di","0","0"],["Jay","0","0"]]
        }
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sample.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var conv = Int(sample[indexPath.row][1])!
        conv += 1
        sample[indexPath.row][1] = String(conv)
        var convTotal = Int(sample[indexPath.row][2])!
        convTotal += 1
        sample[indexPath.row][2] = String(convTotal)
        
        let move = sample[indexPath.row]
        sample.remove(at: indexPath.row)
        sample.append(move)
        let defaults = UserDefaults.standard
        defaults.set(sample, forKey: "names")
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        let item = self.names[indexPath.item]
        let item = self.sample[indexPath.item][0]
        let detCurrent = self.sample[indexPath.item][1]
        let detTotal = self.sample[indexPath.item][2]
        cell.textLabel?.text = item
        cell.detailTextLabel?.text = "  Current Round: \(detCurrent) Total: \(detTotal)"
        let setColor = Int(sample[indexPath.row][1])
        switch setColor {
        case 0:
            cell.contentView.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
        case 1:
            cell.contentView.backgroundColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 0.1)
        case 2:
            cell.contentView.backgroundColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 0.2)
        case 3:
            cell.contentView.backgroundColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 0.3)
        case 4:
        cell.contentView.backgroundColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 0.4)
        case 5:
            cell.contentView.backgroundColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 0.5)
        case 6:
            cell.contentView.backgroundColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 0.6)
        case _ where setColor! > 6:
        cell.contentView.backgroundColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 0.7)
        default:
            print("hello")
        }
//        if setColor == 1 {
//            cell.contentView.backgroundColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 0.10)
//        }
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func clear(_ sender: UIBarButtonItem) {
        for i in(0..<sample.count){
            sample[i][1] = "0"
        }
        sample.shuffle()
        self.tableView.reloadData()
    }
    
}
