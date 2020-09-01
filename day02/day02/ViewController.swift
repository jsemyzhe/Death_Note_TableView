//
//  ViewController.swift
//  day03
//
//  Created by Julia SEMYZHENKO on 10/3/19.
//  Copyright © 2019 JULIA SEMYZHENKO. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

	@IBOutlet weak var nameInput: UITextField!
	@IBOutlet weak var descriptionInput: UITextView!
	@IBOutlet weak var datePicker: UIDatePicker!
	var placeholderLabel : UILabel!

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if (segue.identifier == "Done" && !nameInput.text!.isEmpty) {
			Data.deaths.append((
				nameInput.text!,
				datePicker.date,
				descriptionInput.text!
			));
			if let vc = segue.destination as? KillingList {
				vc.tableView.reloadData();
			}
		}
	}
	
	@IBAction func doneButton(_ sender: UIBarButtonItem) {
		performSegue(withIdentifier: "Done", sender: nil);
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		descriptionInput.delegate = self;
		descriptionInput.layer.borderWidth = 1;
		descriptionInput.layer.borderColor = UIColor.gray.cgColor;
		
		placeholderLabel = UILabel();
		placeholderLabel.text = "Description";
		placeholderLabel.font = UIFont.systemFont(ofSize: (descriptionInput.font?.pointSize)!);
		placeholderLabel.sizeToFit();
		descriptionInput.addSubview(placeholderLabel);
		placeholderLabel.frame.origin = CGPoint(x: 5, y: (descriptionInput.font?.pointSize)! / 2);
		placeholderLabel.textColor = UIColor.lightGray;
		placeholderLabel.isHidden = !descriptionInput.text.isEmpty;
		
		datePicker.minimumDate = Date();
	}

	func textViewDidChange(_ textView: UITextView) {
		placeholderLabel.isHidden = !textView.text.isEmpty;
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}
