//
//  TasksViewController.swift
//  DoIt
//
//  Created by Young Park on 6/26/17.
//  Copyright © 2017 Young Park. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var tasks : [Task] = []
    var indexArray : Int? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tasks = makeTasks()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        indexArray = indexPath.row
        if task.important {
            cell.textLabel?.text = "⚠️ \(task.label)"
        } else {
            cell.textLabel?.text = task.label
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "moveSegue", sender: task)
    }
    
    func makeTasks() -> [Task] {
        let task1 = Task()
        task1.label = "Do homework"
        task1.important = false
        
        let task2 = Task()
        task2.label = "Walk the dog"
        task2.important = true
        
        let task3 = Task()
        task3.label = "Kill Donald Trump"
        task3.important = false
        
        return [task1, task2, task3]
    }
    
    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveSegue" {
            let nextVC = segue.destination as! CellViewController
            nextVC.previousVC = self
        } else if segue.identifier == "addSegue" {
            let nextVC = segue.destination as! CreateTaskViewController
            nextVC.previousVC = self
        }
    }
}

