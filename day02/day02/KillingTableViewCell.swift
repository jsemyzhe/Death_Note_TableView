//
//  KillingTableViewCell.swift
//  day03
//
//  Created by Julia SEMYZHENKO on 10/3/19.
//  Copyright © 2019 JULIA SEMYZHENKO. All rights reserved.
//

import UIKit

class KillingTableViewCell: UITableViewCell {

	@IBOutlet weak var dateLabel: UILabel!
	@IBOutlet weak var descriptionLabel: UILabel!
	@IBOutlet weak var nameLabel: UILabel!
	
	var kill: (String, Date, String)? {
		didSet {
			nameLabel.text = kill!.0;
			dateLabel.text = kill!.1.toString(dateFormat: "dd-MMM-yyyy");
			descriptionLabel.text = kill!.2;
		}
	}
	
	override func awakeFromNib() {
		super.awakeFromNib();
		self.layoutMargins = UIEdgeInsets.zero;
		self.preservesSuperviewLayoutMargins = false;
	}
}

extension Date
{
	func toString( dateFormat format  : String ) -> String
	{
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = format
		return dateFormatter.string(from: self)
	}
}
