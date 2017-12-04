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
        if self.pointsTxtField.text != "" {
            self.save { (success) in
                if success {
                    dismissSecondaryDetail(viewController: self)
                }
                else {
                    
                }
            }
        }
    }
    
    @IBAction func backBtnTapped(_ sender: Any) {
        dismissSecondaryDetail(viewController: self)
        
    }
    
    func save(completion: (_ finished:Bool)->()) {
        let managedObjectContext = APP_DELEGATE.persistentContainer.viewContext
        let goal = Goal(context: managedObjectContext)
        goal.goalDescription = self.goalDescription
        goal.goalType = self.goalType.rawValue
        
        guard let goalCompletionValue = Int32(self.pointsTxtField.text!)  else {
            return
        }
        goal.goalCompletionValue = goalCompletionValue

        goal.goalProgress = Int32(0)
        do {
           try managedObjectContext.save()
            completion(true)
        } catch  {
            debugPrint(error.localizedDescription)
            completion(false)
        }
    }
    
    


}
