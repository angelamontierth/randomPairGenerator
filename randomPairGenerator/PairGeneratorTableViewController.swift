//
//  PairGeneratorTableViewController.swift
//  randomPairGenerator
//
//  Created by Angela Montierth on 3/31/17.
//  Copyright © 2017 Angela Montierth. All rights reserved.
//

import UIKit

class PairGeneratorTableViewController: UITableViewController {
    
    
    @IBAction func addButtonTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "Add person", message: "Enter a new person's name.", preferredStyle: .alert)
        let cancelAlertAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        var personNameTextField: UITextField?
        alertController.addTextField { (textField) in
            personNameTextField = textField
        }
        let addPersonAction = UIAlertAction(title: "Add", style: .default) { (_) in
            guard let personName = personNameTextField?.text else { return }
            PersonController.sharedController.addName(name: personName)
            
            self.tableView.reloadData()
        }
        
        alertController.addAction(cancelAlertAction)
        alertController.addAction(addPersonAction)
        
        self.present(alertController, animated: true, completion: nil)

    }
    
    
    @IBAction func randomizeButtonTapped(_ sender: Any) {

        PersonController.sharedController.randomize(people: [person])
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    
           }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return (PersonController.sharedController.people.count) / 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    // override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        // let groupCount = (PersonController.sharedController.people.count) / 2
        
        //return "Group Number /(GroupCount)"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath)
        
        let people = PersonController.sharedController.people[indexPath.row]
        
        cell.textLabel?.text = people.name
        return cell
    }

}

























