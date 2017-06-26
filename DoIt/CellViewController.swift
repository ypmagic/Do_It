//
//  CellViewController.swift
//  DoIt
//
//  Created by Young Park on 6/26/17.
//  Copyright © 2017 Young Park. All rights reserved.
//

import UIKit

class CellViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    var previousVC = TasksViewController()
    var task = Task()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textLabel.text = task.label
    }

    @IBAction func completePressed(_ sender: Any) {
        previousVC.tasks.remove(at: previousVC.indexArray!)
        previousVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
    }
}
