//
//  GoalCell.swift
//  goalpost-app3
//
//  Created by macbook on 22/08/2018.
//  Copyright © 2018 Nickagas. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

    @IBOutlet weak var goalDescriptionLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var goleTybeLbl: UILabel!
    @IBOutlet weak var goalProgress: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configurecell(description: String, type: GoalType, goalProgressAmount: Int){
        self.goalDescriptionLbl.text = description
        self.goleTybeLbl.text = type.rawValue
        self.goalProgress.text = String(describing: goalProgress)
    }

}
