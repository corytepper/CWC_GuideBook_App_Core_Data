//
//  NotesViewController.swift
//  CWC_Guidebook_App_CoreData
//
//  Created by Cory Tepper on 3/1/21.
//

import UIKit

class NotesViewController: UIViewController {

    // MARK: - Variables and Properties
    
    
    @IBOutlet var tableView: UITableView!
    
    
    var place:Place?
    
    // MARK: - ViewController Lifecycle


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func addNoteTapped(_ sender: Any) {

        // Display the popup
        let addNoteVC = storyboard?.instantiateViewController(identifier: Constants.ADD_NOTES_VIEWCONTROLLER) as! AddNoteViewController

        // Pass the place object through
        addNoteVC.place = place
        
        // Configure the popup mode
        addNoteVC.modalPresentationStyle = .overCurrentContext
        
        // Present it
        present(addNoteVC, animated: true, completion: nil)

    }
}
