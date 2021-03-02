//
//  PlaceTableViewCell.swift
//  CWC_Guidebook_App_CoreData
//
//  Created by Cory Tepper on 3/2/21.
//

import UIKit

class PlaceTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    @IBOutlet var shadowView: UIView!
    
    @IBOutlet var cardView: UIView!
    
    @IBOutlet var placeImageView: UIImageView!
    
    @IBOutlet var placeNameLabel: UILabel!
    



    // MARK: - Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // Style the cell background
        
        cardView.layer.cornerRadius = 5
        shadowView.layer.cornerRadius = 5
        shadowView.layer.shadowColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0.5)
        shadowView.layer.shadowOpacity = 1
        shadowView.layer.shadowOffset = .zero
        shadowView.layer.shadowRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    // MARK: - Methods
    
    func setCell(_ place:Place) {
        
        if place.imageName != nil {
        
            // Set the image
            self.placeImageView.image = UIImage(named: place.imageName!)
        }
        
        // Set the label
        self.placeNameLabel.text = place.name
        
    }
}
