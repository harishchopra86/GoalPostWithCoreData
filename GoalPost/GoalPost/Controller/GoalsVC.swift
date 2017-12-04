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
    
    var goals:[Goal] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetch { (success) in
            goalTblVw.isHidden = false
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

}

extension GoalsVC {
    
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
}
