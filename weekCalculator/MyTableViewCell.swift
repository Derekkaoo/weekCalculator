//
//  MyTableViewCell.swift
//  weekCalculator
//
//  Created by 高士傑 on 2019/12/23.
//  Copyright © 2019 高士傑. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell, XibCell {

    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setData(moneyData:MoneyData) {
        self.labelOne.text = moneyData.amountOne
        self.labelTwo.text = moneyData.amountTwo 
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
