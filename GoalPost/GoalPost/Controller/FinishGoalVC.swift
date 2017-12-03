//
//  FinishGoalVC.swift
//  GoalPost
//
//  Created by Harish Chopra on 2017-12-02.
//  Copyright © 2017 Harish Chopra. All rights reserved.
//

import UIKit

class FinishGoalVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var pointsTxtField: UITextField!
    @IBOutlet weak var createGoalBtn: UIButton!
    
    var goalDescription: String!
    var goalType: GoalType!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    createGoalBtn.bindToKeyboard()
        
    }
    
    func initData(description:String, type:GoalType) {
        self.goalDescription = description
        self.goalType = type
    }

    @IBAction func createGoalBtnTapped(_ sender: Any) {
        
        
    }
    @IBAction func backBtnTapped(_ sender: Any) {
        dismissDetail()
        
    }
    
    
    


}
