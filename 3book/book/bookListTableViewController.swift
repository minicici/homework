//
//  bookListTableViewController.swift
//  book
//
//  Created by chen on 2020/4/11.
//  Copyright © 2020 chen. All rights reserved.
//

import UIKit

class bookListTableViewController: UITableViewController {

    var books = NSArray.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fileName = Bundle.main.path(forResource: "book", ofType: "plist")
        books = NSArray(contentsOfFile: fileName!)!
    
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return books.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:bookTableViewCell = tableView.dequeueReusableCell(withIdentifier: "bookCell") as! bookTableViewCell
        let dic:NSDictionary = books[indexPath.row] as! NSDictionary
        cell.bookAuthor.text = dic.object(forKey: "author") as? String
        cell.bookTitle.text = dic.object(forKey: "title") as? String
        cell.bookComments.text = "\(dic.object(forKey: "comments")!)"
        cell.bookimage.image = UIImage(named: dic.object(forKey: "icon") as! String)

        return cell
    }
    //设置单元格行高
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }

}
