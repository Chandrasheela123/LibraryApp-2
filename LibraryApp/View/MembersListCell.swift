//
//  MembersListCell.swift
//  LibraryApp
//
//  Created by cdp on 11/06/22.
//

import UIKit

class MembersListCell: UITableViewCell {

    @IBOutlet weak var emailIDLbl: UILabel!
    @IBOutlet weak var mobileNoLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
