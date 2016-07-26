//
//  BusinessViewCell.swift
//  Yelp
//
//  Created by Martene Mendy on 7/24/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessViewCell: UITableViewCell {

   @IBOutlet weak var thumbImage: UIImageView!
   @IBOutlet weak var nameLabel: UILabel!
   @IBOutlet weak var distanceLabel: UILabel!
   @IBOutlet weak var reviewLabel: UILabel!
   @IBOutlet weak var addressLabel: UILabel!
   @IBOutlet weak var categoryLabel: UILabel!
   @IBOutlet weak var ratingImage: UIImageView!

   var cellRow: Int!

   var businessData: Business! {
      didSet {
         nameLabel.text = businessData.name
         if let imageUrl = businessData.imageURL {
            thumbImage.setImageWithURL(imageUrl)
         }
         if let ratingImageUrl = businessData.ratingImageURL {
            ratingImage.setImageWithURL(ratingImageUrl)
         }
         addressLabel.text = businessData.address!
         categoryLabel.text = businessData.categories!
         distanceLabel.text = String(businessData.distance!)
         nameLabel.text = String(1+cellRow) + ". " +  businessData.name!
         reviewLabel.text = String(businessData.reviewCount!) + " Reviews"
      }
   }

   override func awakeFromNib() {
      super.awakeFromNib()
      // Initialization code
      thumbImage.layer.cornerRadius = 3
      thumbImage.clipsToBounds = true
   }

   override func setSelected(selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)

      // Configure the view for the selected state
   }
   
}
