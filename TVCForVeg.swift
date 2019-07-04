//
//  TVCForVeg.swift
//  TaskNoor
//
//  Created by LetMeCall Corp on 12/12/18.
//  Copyright © 2018 LetMeCall Corp. All rights reserved.
//

import UIKit
import RealmSwift

class TVCForVeg: UITableViewController,UITextFieldDelegate {
    
   
    var vegArry = [String]()
    var arryVeg = [String]()
    var itemsTF = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
//        self.saveVegData()
        print("\(self.vegArry)")


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()

    }
    
    @IBAction func addAction(_ sender: Any) {
        
        let alert = UIAlertController.init(title: "Veg Alert", message: "Vegtables", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
            
//            self.vegArry.append(self.itemsTF.text!)
            
            let  vegData = Vegtables(context:conte)
            vegData.vegItems = self.itemsTF.text!
            appDel.saveContext()
            
       
            do{
                SaveVegData =  try conte.fetch(Vegtables.fetchRequest())
                for everyItem in SaveVegData
                {
                    self.arryVeg.append(everyItem.vegItems!)
                    self.tableView.reloadData()
                }
            }
            catch{
                
            }
    
//            print("\(self.vegArry)")
//            self.tableView.reloadData()
            
        }
//        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        
        
        alert.addTextField { (textField) -> Void in
            self.itemsTF = textField
            self.itemsTF.delegate = self //REQUIRED
            self.itemsTF.placeholder = "Enter your search terms"
        }
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true,completion:nil)
        

    }
    
    
    
//  func saveVegData()
//    {
//
//        let veg = Vegtables()
////        veg.storeVeg = self.vegArry
//        veg.storeVegTF  = self.itemsTF.text!
////        mike.userName = self.userTF.text!
////        mike.password = self.pswdTF.text!
//
//        let realm = try! Realm()
//        try! realm.write {
//            realm.add(veg)
//          self.vegArry.append(self.itemsTF.text!)
////            veg.storeVeg = self.vegArry
//
////            print("added \(mike.userName) to Realm")
//
//        }
//
////        print("array\(self.arry)")
//    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arryVeg.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "veg", for: indexPath)

          cell.textLabel?.text = arryVeg[indexPath.row]
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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

}
