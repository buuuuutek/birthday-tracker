//
//  BirthdaysTableTableViewController.swift
//  Tracker
//
//  Created by Волнухин Виктор on 24/01/2019.
//

import UIKit
import CoreData

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
        let fetchRequest = Birthday.fetchRequest() as NSFetchRequest<Birthday>
        do {
            birthdays = try context.fetch(fetchRequest)
        }
        catch {
            print(error.localizedDescription)
        }
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

}
