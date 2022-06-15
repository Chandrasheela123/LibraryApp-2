//
//  BorrowBooksCell.swift
//  LibraryApp
//
//  Created by cdp on 14/06/22.
//

import UIKit

class BorrowBooksCell: UITableViewCell {

    @IBOutlet weak var returnDateLbl: UILabel!
    @IBOutlet weak var borrowDateLbl: UILabel!
    @IBOutlet weak var booknameLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
