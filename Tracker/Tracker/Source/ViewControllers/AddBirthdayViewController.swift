//
//  AddBirthdayViewController.swift
//  Tracker
//
//  Created by Волнухин Виктор on 23/01/2019.
//

import UIKit
import CoreData

class AddBirthdayViewController: UIViewController {
    
    // MARK: - Controls
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var birthdatePicker: UIDatePicker!

    
    // MARK: - Button actions
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        writeNewDataToContext()
        saveNewContext()
        goBackToTableView()
    }
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        goBackToTableView()
    }
    
    
    // MARK: - Functions
    
    private func writeNewDataToContext() {
        let newBirthday = Birthday(context: context)
        newBirthday.firstName = firstNameTextField.text
        newBirthday.lastName = lastNameTextField.text
        newBirthday.date = birthdatePicker.date
        newBirthday.birthdayId = UUID()
    }
    
    private func saveNewContext() {
        do {
            try context.save()
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    // MARK: - Navigation
    private func goBackToTableView() {
        navigationController?.popViewController(animated: true)
    }
}

