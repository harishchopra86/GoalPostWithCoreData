//
//  ViewController.swift
//  GoalPost
//
//  Created by Harish Chopra on 2017-12-02.
//  Copyright © 2017 Harish Chopra. All rights reserved.
//

import UIKit

class GoalsVC: UIViewController {
   
    

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var addGoalBtn: UIButton!
    @IBOutlet weak var goalTblVw: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let goal = Goal()
//        goal.goalCompletionValue = Int32(bitPattern: 5)
        goal.goalDescription = "this is a goal";
    
        print(goal)
    }

    @IBAction func addGoalTapped(_ sender: Any) {
        
        
    }
    
}

extension GoalsVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GoalCell", for: indexPath) as? GoalCell else { return GoalCell() }
        cell.configureCell()
        
        return cell
    }

}

