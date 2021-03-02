//
//  PlaceViewController.swift
//  CWC_Guidebook_App_CoreData
//
//  Created by Cory Tepper on 3/1/21.
//

import UIKit

class PlaceViewController: UIViewController {
    
    // MARK: - Variables and Properties
    
    @IBOutlet var placeImageView: UIImageView!
    
    @IBOutlet var placeNameLabel: UILabel!
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    @IBOutlet var containerView: UIView!
    
    
    lazy var infoViewController:InfoViewController = {
        
        let infoVC = self.storyboard?.instantiateViewController(identifier: Constants.INFO_VIEWCONTROLLER) as! InfoViewController
        return infoVC
    }()
    
    lazy var mapViewController:MapViewController = {
        
        let mapVC = self.storyboard?.instantiateViewController(identifier: Constants.MAP_VIEWCONTROLLER) as! MapViewController
        return mapVC
    }()
    
    lazy var notesViewController:NotesViewController = {
        
        let notesVC = self.storyboard?.instantiateViewController(identifier: Constants.NOTES_VIEWCONTROLER) as! NotesViewController
        return notesVC
    }()
    
    
    
    var place:Place?
    
    
    
    
    
    // MARK: - ViewController Lifecycle
    


    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the image
        
        if place?.imageName != nil {
            placeImageView.image = UIImage(named: place!.imageName!)
        }
        
        // Set the name
        placeNameLabel.text = place?.name
        
       // Make sure the first segment is displayed
        segmentChanged(self.segmentedControl)
        
        
    }
    
    
    // MARK: - Methods


    private func switchChildViewControllers(_ childVC:UIViewController) {
        
        // Add it as a child view controller of this one
        addChild(childVC)
        
        // Add it's view as a subview of the container view
        containerView.addSubview(childVC.view)
        
        // Set it's frame and sizing
        childVC.view.frame = containerView.bounds
        childVC.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Indicate that it's now a child view controller
        childVC.didMove(toParent: self)
        
    }

    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            infoViewController.place = self.place
            switchChildViewControllers(infoViewController)
        case 1:
            mapViewController.place = self.place
            switchChildViewControllers(mapViewController)
        case 2:
            notesViewController.place = self.place
            switchChildViewControllers(notesViewController)
        default:
            infoViewController.place = self.place
            switchChildViewControllers(infoViewController)
        }
        
        
        
    }
    
    
    
}
