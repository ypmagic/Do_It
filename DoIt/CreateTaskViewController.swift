//
//  CreateTaskViewController.swift
//  DoIt
//
//  Created by Young Park on 6/26/17.
//  Copyright © 2017 Young Park. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    @IBOutlet weak var taskName: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    var previousVC = TasksViewController()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addPressed(_ sender: Any) {
        let task = Task()
        task.label = taskName.text!
        task.important = importantSwitch.isOn
        // add new tasks to array in previous VC
        previousVC.tasks.append(task)
        previousVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
    }
}
