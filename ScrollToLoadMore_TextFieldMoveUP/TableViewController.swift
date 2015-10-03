//
//  TableViewController.swift
//  ScrollToLoadMore_TextFieldMoveUP
//
//  Created by Benobab on 03/10/15.
//  Copyright © 2015 Benobab. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {

    var datas = Array<String>()
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.addData()
        self.tableView.reloadData()
        // Do any additional setup after loading the view.
    }

    func addData(){
        for var i = 0 ; i < 20 ; i++ {
            self.datas.append("Encore une : \(i)")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension TableViewController:UITableViewDataSource,UITableViewDelegate{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if(indexPath.row == self.datas.count-1){
            self.addData()
            self.tableView.reloadData()
        }
        let cell =  tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! TableViewCell
        cell.titreLabel.text = self.datas[indexPath.row]
        return cell
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
}