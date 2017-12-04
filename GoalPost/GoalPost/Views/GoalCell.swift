//
//  GoalCell.swift
//  GoalPost
//
//  Created by Harish Chopra on 2017-12-02.
//  Copyright © 2017 Harish Chopra. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

    @IBOutlet weak var goalLbl: UILabel!
    @IBOutlet weak var goalNameLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var typeNameLbl: UILabel!
    @IBOutlet weak var durationLbl: UILabel!
    
    @IBOutlet weak var completionView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func configureCell(objGoal:Goal) {
        goalNameLbl.text = objGoal.goalDescription
        let type:GoalType = GoalType(rawValue: objGoal.goalType!)!
        typeNameLbl.text = type.rawValue
        durationLbl.text = String(objGoal.goalProgress)
        
        if objGoal.goalProgress == objGoal.goalCompletionValue {
            completionView.isHidden = false
        }
        else {
            completionView.isHidden = true
        }
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
