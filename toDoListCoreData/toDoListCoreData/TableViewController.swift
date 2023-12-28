//
//  TableViewController.swift
//  toDoListCoreData
//
//  Created by MacBook on 29.08.2022.
//

import UIKit

class TableViewController: UITableViewController {
    
    var tasks: [String] = []

    @IBAction func plusTasks(_ sender: UIBarButtonItem) {
        
        let alerController = UIAlertController(title: "Новая задача", message: "Введите задачу", preferredStyle: .alert)
        
        let saveTask = UIAlertAction(title: "Сохранить", style: .default) { action in
            let tf = alerController.textFields?.first
            if let newTask = tf?.text {
                self.tasks.insert(newTask, at: 0)
                self.tableView.reloadData()
            }
        }
        
        alerController.addTextField { _ in }
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .default) { _ in }
        
        alerController.addAction(saveTask)
        alerController.addAction(cancelAction)
        
        present(alerController, animated:  true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tasks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = tasks[indexPath.row]

        return cell
    }
  
}
