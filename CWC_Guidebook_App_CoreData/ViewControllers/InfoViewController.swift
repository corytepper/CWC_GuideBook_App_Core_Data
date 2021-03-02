//
//  InfoViewController.swift
//  CWC_Guidebook_App_CoreData
//
//  Created by Cory Tepper on 3/1/21.
//

import UIKit

class InfoViewController: UIViewController {

    // MARK: - Variables and Properties
    @IBOutlet var summaryLabel: UILabel!
    
    var place:Place?
    
    // MARK: - ViewController Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        summaryLabel.text = place?.summary
    }
    
    
    
}
