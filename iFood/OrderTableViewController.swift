//
//  OrderTableViewController.swift
//  iFood
//
//  Created by iosdev on 9.5.2017.
//  Copyright © 2017 Tien. All rights reserved.
//

import UIKit
import CoreData

class OrderTableViewController: UITableViewController {

    var orderArray: [String] = []
    var userArray: [String] = []
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBAction func btnRefresh(_ sender: Any) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Bill")
        request.returnsObjectsAsFaults = false
        do {
            let orders = try! context.fetch(request)
            
            for order in orders {
                let ord = (order as AnyObject).value(forKey: "order") as! String
                let usn = (order as AnyObject).value(forKey: "byUser") as! String
                orderArray.append(ord)
                userArray.append(usn)
                navigationController?.navigationBar.barTintColor = UIColor(red: 245/255.0, green:0, blue: 68/255.0, alpha :1.0)
            }
        }
        OperationQueue.main.addOperation({ () -> Void in
            self.updateTableview()
        })
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return orderArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderCell", for: indexPath)
        
        cell.textLabel?.text = orderArray[indexPath.row]
        cell.detailTextLabel?.text = userArray [indexPath.row]
        return cell
    }
    func updateTableview(){
        self.tableView.reloadData()
        
        if self.tableView.contentSize.height > self.tableView.frame.size.height {
            self.tableView.scrollToRow(at: IndexPath(row: orderArray.count - 1, section: 0), at: UITableViewScrollPosition.bottom, animated: true)
        }
    }
    
    

}
