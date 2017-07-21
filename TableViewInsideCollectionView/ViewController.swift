//
//  ViewController.swift
//  TableViewInsideCollectionView
//
//  Created by prasanth.podalakur on 7/13/17.
//  Copyright © 2017 Kelltontech. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    let val:NSData? = nil
    var notificationsList:NSArray = NSArray()
    var localNotification:UILocalNotification?
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableview.delegate = self
        self.tableview.dataSource = self
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableView), name: NSNotification.Name(rawValue: "reloadData"), object: nil)
       
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func reloadTableView(){
        self.tableview.reloadData()
    }

 
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (UIApplication.shared.scheduledLocalNotifications?.count)!
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        self.notificationsList = UIApplication.shared.scheduledLocalNotifications! as NSArray
        self.localNotification = self.notificationsList[indexPath.row] as? UILocalNotification
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.notificationTitleLabel.text! = (localNotification?.alertBody)!
        cell.notificationDateLabel.text = self.getStringFromDate(date: (localNotification?.fireDate)!)
        
        return cell
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let app = UIApplication.shared
        var eventArray: [Any]? = app.scheduledLocalNotifications
        let oneEvent = eventArray?[indexPath.row] as? UILocalNotification
        
        app.cancelLocalNotification(oneEvent!)
        self.tableview.reloadData()
        
        
        
    }
    
    func getStringFromDate(date:Date) -> String{

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        dateFormatter.timeZone = NSTimeZone.default
    
        return dateFormatter.string(from:date)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        UIApplication.shared.cancelAllLocalNotifications()
        self.tableview.reloadData()
        
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "AddNotification", sender: self)
    }
    
    
    
    
}

