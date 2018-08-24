//
//  ViewController.swift
//  goalpost-app3
//
//  Created by macbook on 22/08/2018.
//  Copyright © 2018 Nickagas. All rights reserved.
//

import UIKit
import CoreData
let appDelegate = UIApplication.shared.delegate as? AppDelegate

class GoalVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var goals: [Goal] = []
    @IBAction func addGoalWasPressed(_ sender: Any) {
   print("button was pressed")
        guard let createGoalVC = storyboard?.instantiateViewController(withIdentifier: "CreateGoalVC") else {return}

        
     presentDetail(createGoalVC)
}
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let goal = Goal()
//        goal.goalCompletionValue = Int32(exactly: 12.0)!
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       fetchCoreDataObjects()
        tableView.reloadData()
    }
    func fetchCoreDataObjects(){
        self.fetch { (complet) in
            if goals.count >= 1 {
                tableView.isHidden = false
            } else {
                tableView.isHidden = true
            }
        }
    }

}

extension GoalVC: UITableViewDelegate, UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else {return UITableViewCell()}
        
        let goal = goals[indexPath.row]
        cell.configurecell(description: goal.description, type: GoalType.longTerm , goalProgressAmount: Int(goal.goalProgress))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "DELETE") { (rowAction, indexPAth) in
            self.removeGoal(atIndexPath: indexPath)
            self.fetchCoreDataObjects()
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
//        let addProgress = 
        deleteAction.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        return [deleteAction]
    }
    
}

extension GoalVC {
    func removeGoal(atIndexPath indexPath: IndexPath){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        
        managedContext.delete(goals[indexPath.row])
        do{
            try managedContext.save()
        } catch {
//            debugPrint("could naot remove ")
        }
        
    }
    
    func fetch (completion:(_ complete: Bool)->()){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Goal")
        
        do{
            goals = try  managedContext.fetch(fetchRequest) as! [Goal]
            print("susscessufully fetch data")
            completion(true)
        }catch {
            completion(false)
            debugPrint("Could not Fetch: \(error.localizedDescription)")
        }
       
    }
}

