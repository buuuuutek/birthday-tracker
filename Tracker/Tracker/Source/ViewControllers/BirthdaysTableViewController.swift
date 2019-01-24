//
//  BirthdaysTableTableViewController.swift
//  Tracker
//
//  Created by Волнухин Виктор on 24/01/2019.
//

import UIKit

class BirthdaysTableViewController: UITableViewController {
    
    // MARK: - Fields
    
    var birthdays: [Birthday]!
    private lazy var dateFormatter = DateFormatter()

    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        birthdays = loadContext()
        tableView.reloadData()
    }

    
    // MARK: - Buttons actions
    
    @IBAction func addTapped(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "toAddBirthdayView", sender: self)
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return birthdays.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "birthdayIdentifier", for: indexPath)
        
        let birthday = birthdays[indexPath.row]
        
        let firstName = birthday.firstName ?? String()
        let lastName = birthday.lastName ?? String()
        cell.textLabel?.text = firstName + " " + lastName
        
        if let birthdate = birthday.date {
            cell.detailTextLabel?.text = dateFormatter.string(from: birthdate)
        } else {
            cell.detailTextLabel?.text = String()
        }
        
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if birthdays.count > indexPath.row {
            context.delete(birthdays[indexPath.row])
            birthdays.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            saveContext()
        }
    }
}
