//
//  ViewController.swift
//  MusiVideo
//
//  Created by jactoc on 2016-10-26.
//  Copyright © 2016 Jacopo Toccacieli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //Call API
        let api = APIManager()
        api.loadData(Constants.URL, completion: didLoadData)
    }
    
    
    func didLoadData(result:String) {
        
        let alert = UIAlertController(title: result, message: nil, preferredStyle: .Alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .Default) {action -> Void in
            //do something if you want
        }
        
        alert.addAction(okAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }

}

