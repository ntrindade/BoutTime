//
//  ViewControllerGameResult.swift
//  BoutTime
//
//  Created by Nuno Trindade on 23/10/2016.
//  Copyright © 2016 Remarkable Code Ltd. All rights reserved.
//

import UIKit

class ViewControllerGameResult: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        labelScore.text = score
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var labelScore: UILabel!
    var score: String = ""
    
    @IBAction func playAgain() {
        dismiss(animated: true, completion: nil)
    }
}
