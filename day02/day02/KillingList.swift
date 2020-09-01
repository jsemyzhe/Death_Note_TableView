//
//  killingList.swift
//  day03
//
//  Created by Julia SEMYZHENKO on 10/3/19.
//  Copyright © 2019 JULIA SEMYZHENKO. All rights reserved.
//

import UIKit

class KillingList: UITableViewController {
	
	@IBAction func killSomeone(segue: UIStoryboardSegue) {
		print(segue);
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return (Data.deaths.count);
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "killingCell") as! KillingTableViewCell;
		cell.kill = Data.deaths[indexPath.row];
		return (cell);
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return (UITableViewAutomaticDimension);
	}
	
	override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
		cell.contentView.backgroundColor = indexPath.row % 2 == 0 ? UIColor.GreyCell : UIColor.WhiteCell;
	}
	
	override func viewDidLoad() {
		super.viewDidLoad();
		tableView?.rowHeight = UITableViewAutomaticDimension;
		tableView.estimatedRowHeight = 80;
	}
}

extension UIColor {
	static var GreyCell: UIColor { return (UIColor(red: 0.92, green: 0.92, blue: 0.92, alpha: 1)) }
	static var WhiteCell: UIColor { return (UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)) }
}
