//
//  SwitchTableViewCell.swift
//  Yelp
//
//  Created by Martene Mendy on 7/25/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

protocol SwitchViewCellDelegate: class {
   func cellDidToggle(cell: SwitchViewCell, newValue:Bool)
}

class SwitchViewCell: FilterViewCell {

   @IBOutlet weak var switchNameLabel: UILabel!
   @IBOutlet weak var switchButton: UISwitch!

   weak var delegate: SwitchViewCellDelegate?

   override func awakeFromNib() {
      super.awakeFromNib()
      // Initialization code
   }

   override func setSelected(selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)

      // Configure the view for the selected state
   }

   @IBAction func didToggleSwitch(sender: UISwitch) {
      print("toggle")
      delegate?.cellDidToggle(self, newValue: switchButton.on)
   }
}
