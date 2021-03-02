//
//  ViewController.swift
//  CWC_Guidebook_App_CoreData
//
//  Created by Cory Tepper on 3/1/21.
//

import UIKit

class ViewController: UIViewController {
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var tableView: UITableView!
    
    var places = [Place]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Get the places from core data
        do {
        places = try context.fetch(Place.fetchRequest())
        }
        catch {
            print("Couldn't fetch places from our database")
        }
        
        // Set view controller as the delegate and data source of the tableview
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // TODO: Get a cell reference
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.PLACE_CELL) as! PlaceTableViewCell
        
        // Get the place
        let place = places[indexPath.row]
        
        // Customize the cell for the place that we're trying to show
        cell.setCell(place)
        
        // Return the cell
        return cell
        
    }
    
    
}
