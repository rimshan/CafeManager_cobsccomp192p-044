//
//  CategoryInfoTableViewCell.swift
//  CafeManager
//
//  Created by Chathura Wijekoon on 2021-04-30.
//  Copyright © 2021 Rimshan. All rights reserved.
//

import UIKit

class CategoryInfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblCategoryName: UILabel!
    class var reuseIdentifier: String {
         return "CategoryInfoReusable"
     }
     
     class var nibName: String {
         return "CategoryInfoTableViewCell"
     }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configXIB(category: Category) {
          lblCategoryName.text = category.categoryName
      }
    
}
