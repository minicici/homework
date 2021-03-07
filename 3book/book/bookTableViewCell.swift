//
//  bookTableViewCell.swift
//  book
//
//  Created by chen on 2020/4/11.
//  Copyright © 2020 chen. All rights reserved.
//

import UIKit

class bookTableViewCell: UITableViewCell {

    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookComments: UILabel!
    @IBOutlet weak var bookimage: UIImageView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
