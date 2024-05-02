//
//  TableViewCell.swift
//  iOSAssesment
//
//  Created by Zimble on 02/05/24.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var idLbl: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
