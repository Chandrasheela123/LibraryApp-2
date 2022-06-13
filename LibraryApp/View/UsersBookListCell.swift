//
//  UsersBookListCell.swift
//  LibraryApp
//
//  Created by cdp on 13/06/22.
//

import UIKit

class UsersBookListCell: UITableViewCell {

    @IBOutlet weak var authorLbl: UILabel!
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
