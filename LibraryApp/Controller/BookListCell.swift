//
//  BookListCell.swift
//  LibraryApp
//
//  Created by cdp on 11/06/22.
//

import UIKit

class BookListCell: UITableViewCell {

    @IBOutlet weak var noOfBooksLbl: UILabel!
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
