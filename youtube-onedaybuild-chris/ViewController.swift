//
//  ViewController.swift
//  youtube-onedaybuild-chris
//
//  Created by Slulupzzz on 8/21/20.
//  Copyright © 2020 Slulupzzz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        model.getVideos()
        
        
    }


}

