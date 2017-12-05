//
//  ViewController.swift
//  GoalPost
//
//  Created by Harish Chopra on 2017-12-02.
//  Copyright © 2017 Harish Chopra. All rights reserved.
//

import UIKit
import CoreData

let APP_DELEGATE = UIApplication.shared.delegate as! AppDelegate
class GoalsVC: UIViewController {
   
    

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var addGoalBtn: UIButton!
    @IBOutlet weak var goalTblVw: UITableView!
    @IBOutlet weak var bottomVw: UIView!
    @IBOutlet weak var bottomVwheightConstraint: NSLayoutConstraint!
    
    var goals:[Goal] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setUndoManager()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetch { (success) in
            if goals.count > 0 {
                goalTblVw.isHidden = false
            }
            else {
                goalTblVw.isHidden = true

            }
            goalTblVw.reloadData()
        }
    }

    @IBAction func addGoalTapped(_ sender: Any) {
        
        let addGoalVC = storyboard?.instantiateViewController(withIdentifier: "AddGoalVC")
        if let vcToPresent = addGoalVC {
            self.presentDetail(vcToPresent)
        }
        else { return }
        
    }
    
    
    @IBAction func undoBtnTapped(_ sender: Any) {
        undoLastOperation()
        self.hideBottomView()
        fetch { (success) in
            if goals.count > 0 {
                goalTblVw.isHidden = false
            }
            else {
                goalTblVw.isHidden = true
                
            }
            goalTblVw.reloadData()
        }
    }
    
    func showBottomView() {
        UIView.animate(withDuration: 0.7, animations: {
            self.bottomVwheightConstraint.constant = 50
            self.view.layoutIfNeeded()
        }, completion: { (success) in
            DispatchQueue.main.asyncAfter(deadline: .now()+3, execute: {
                self.hideBottomView()
            })
        })
    }
    
    func hideBottomView() {
            UIView.animate(withDuration: 0.7, animations: {
                self.bottomVwheightConstraint.constant = 0
                self.view.layoutIfNeeded()
        })
    }
    
}

extension GoalsVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GoalCell", for: indexPath) as? GoalCell else { return GoalCell() }
        cell.configureCell(objGoal: goals[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "DELETE") { (rowAction, indexPath) in
            
            self.removeGoal(atIndexPath: indexPath, completion: { (success) in
                self.showBottomView()
            })
        }
        deleteAction.backgroundColor = UIColor.red
        
        let addAction = UITableViewRowAction(style: .normal, title: "ADD ONE") { (rowAction, indexPath) in
            self.set(progressAtIndexpath: indexPath)
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        addAction.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.662745098, blue: 0.2666666667, alpha: 1)
        
        return [deleteAction, addAction]
    }

}

extension GoalsVC {
    
    func undoLastOperation() {
        let managedObjectContext = APP_DELEGATE.persistentContainer.viewContext
        managedObjectContext.undoManager?.undo()
        do {
            try managedObjectContext.save()
        } catch  {
            print(error.localizedDescription)
        }
    }
    
    func set(progressAtIndexpath indexPath: IndexPath) {
        let managedObjectContext = APP_DELEGATE.persistentContainer.viewContext
        let selectedGoal = goals[indexPath.row]
        
        if selectedGoal.goalProgress < selectedGoal.goalCompletionValue {
            selectedGoal.goalProgress = selectedGoal.goalProgress + 1
        }
        do {
            try managedObjectContext.save()
        } catch  {
            print(error.localizedDescription)
        }
    }
    
    func fetch(completion: (_ complete:Bool)->()) {
        let managedObjectContext = APP_DELEGATE.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Goal>(entityName: "Goal")
        
        do {
            goals = try managedObjectContext.fetch(fetchRequest)
            completion(true)
        } catch  {
            print(error.localizedDescription)
            completion(false)
        }
    }
    
    func removeGoal(atIndexPath indexPath:IndexPath, completion: (_ complete:Bool)->()) {
        let goal = goals[indexPath.row]
        let managedObjectContext = APP_DELEGATE.persistentContainer.viewContext
     
        managedObjectContext.undoManager?.beginUndoGrouping()
        managedObjectContext.delete(goal)
        do {
            try managedObjectContext.save()
            goals.remove(at: indexPath.row)
            goalTblVw.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        } catch  {
            print(error.localizedDescription)
            completion(false)
        }
        managedObjectContext.undoManager?.endUndoGrouping()
    }
    
    func setUndoManager() {
        let managedObjectContext = APP_DELEGATE.persistentContainer.viewContext
        managedObjectContext.undoManager = UndoManager()
    }
}
