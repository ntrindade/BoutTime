//
//  ViewController.swift
//  BoutTime
//
//  Created by Nuno Trindade on 03/09/16.
//  Copyright © 2016 Remarkable Code Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelEvent1: UILabel!
    @IBOutlet weak var labelEvent2: UILabel!
    @IBOutlet weak var labelEvent3: UILabel!
    @IBOutlet weak var labelEvent4: UILabel!

    @IBOutlet weak var buttonFullDown: UIButton!
    @IBOutlet weak var buttonHalfUpOne: UIButton!
    @IBOutlet weak var buttonHalfDownOne: UIButton!
    @IBOutlet weak var buttonHalfUpTwo: UIButton!
    @IBOutlet weak var buttonHalfDownTwo: UIButton!
    @IBOutlet weak var buttonFullUp: UIButton!
    
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var labelInfo: UILabel!   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Action Methods
    
    @IBAction func MoveUp(sender: UIButton) {
    
    }
    
    @IBAction func MoveDown(sender: UIButton) {
    
    }
    
    // MARK: Helper Methods
    
    func showAlert(title: String, message: String? = nil, style: UIAlertControllerStyle = .Alert) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        
        let okAction = UIAlertAction(title: "OK", style: .Default, handler: dismissAlert)
        
        alertController.addAction(okAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    func dismissAlert(sender: UIAlertAction) {
        // TODO: Implement method
    }
}

