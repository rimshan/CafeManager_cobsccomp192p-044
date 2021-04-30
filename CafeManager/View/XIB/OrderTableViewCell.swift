//
//  OrderTableViewCell.swift
//  CafeManager
//
//  Created by user192499 on 4/30/21.
//  Copyright © 2021 Rimshan. All rights reserved.
//

import UIKit

class OrderTableViewCell: UITableViewCell {

    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblCustomerName: UILabel!
    @IBOutlet weak var lblOrderID: UILabel!
    
    class var reuseIdentifier: String {
        return "OrderViewCellReusable"
    }
    
    class var nibName: String {
        return "OrderTableViewCell"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configXIB(order: Order) {
        switch order.status_code {
        case 0:
            lblStatus.text = "Pending"
        case 1:
            lblStatus.text = "Preparing"
        case 2:
            lblStatus.text = "Ready"
        case 3:
            lblStatus.text = "Done"
        case 4:
            lblStatus.text = "Arriving"
        case 5:
            lblStatus.text = "Cancelled"
        default:
            return
        }
        
        lblOrderID.text = order.orderID
        lblCustomerName.text = order.cust_name
    }
    
}
