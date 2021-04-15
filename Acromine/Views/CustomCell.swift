//
//  CustomCell.swift
//  Acromine
//
//  Created by Anand Yadav on 14/04/21.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var lblLF: UILabel!
    @IBOutlet weak var lblFreq: UILabel!
    @IBOutlet weak var lblSince: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
