//
//  AddGoalVC.swift
//  GoalPost
//
//  Created by Harish Chopra on 2017-12-02.
//  Copyright © 2017 Harish Chopra. All rights reserved.
//

import UIKit

class AddGoalVC: UIViewController, UITextViewDelegate {

    @IBOutlet weak var goalDescriptionTxtVw: UITextView!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var goalType:GoalType = .shortTerm
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nextBtn.bindToKeyboard()
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()
    }

    @IBAction func btnShortTermTapped(_ sender: Any) {
        goalType = .shortTerm
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()

    }
    @IBAction func btnLongTermTapped(_ sender: Any) {
        goalType = .longTerm
        shortTermBtn.setDeselectedColor()
        longTermBtn.setSelectedColor()

    }
    @IBAction func btnNextTapped(_ sender: Any) {
        
        if goalDescriptionTxtVw.text != "" && goalDescriptionTxtVw.text != "What is your goal?" {
            let finishGoalVC = storyboard?.instantiateViewController(withIdentifier: "FinishGoalVC") as? FinishGoalVC
            if let vcToPresent = finishGoalVC {
                finishGoalVC?.initData(description: goalDescriptionTxtVw.text, type: goalType)
                self.presentDetail(vcToPresent)
            }
            else { return }
        }
    }
    @IBAction func backBtnTapped(_ sender: Any) {
        dismissDetail()
    }

    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
        textView.textColor = UIColor.black
    }
}
