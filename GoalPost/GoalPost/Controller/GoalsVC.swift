//
//  ViewController.swift
//  GoalPost
//
//  Created by Harish Chopra on 2017-12-02.
//  Copyright © 2017 Harish Chopra. All rights reserved.
//

import UIKit

class GoalsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var addGoalBtn: UIButton!
    @IBOutlet weak var goalTblVw: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func addGoalTapped(_ sender: Any) {
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }


}

