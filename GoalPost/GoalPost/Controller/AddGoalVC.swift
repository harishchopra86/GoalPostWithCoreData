//
//  AddGoalVC.swift
//  GoalPost
//
//  Created by Harish Chopra on 2017-12-02.
//  Copyright © 2017 Harish Chopra. All rights reserved.
//

import UIKit

class AddGoalVC: UIViewController {

    @IBOutlet weak var goalDescriptionTxtVw: UITextView!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func btnShortTermTapped(_ sender: Any) {
    }
    @IBAction func btnLongTermTapped(_ sender: Any) {
    }
    @IBAction func btnNextTapped(_ sender: Any) {
    }
    @IBAction func backBtnTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
