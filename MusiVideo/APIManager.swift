//
//  APIManager.swift
//  MusicVideo
//
//  Created by jactoc on 2016-10-27.
//  Copyright © 2016 Jacopo Toccacieli. All rights reserved.
//

import Foundation


class APIManager {
    
    //load data from URL, by default this method is paused need task.resume to run
    func loadData(urlString:String, completion: (result:String) -> Void) {
        
        //enable this for no cache
        let config = NSURLSessionConfiguration.ephemeralSessionConfiguration()
        let session = NSURLSession(configuration:  config)
        
        //enable this for cache
        //let session = NSURLSession.sharedSession()
        
        let url = NSURL(string: urlString)!
        
        let task = session.dataTaskWithURL(url) {
            (data, response, error) -> Void in
            
            dispatch_async(dispatch_get_main_queue()) {
                if error != nil {
                    completion(result: (error!.localizedDescription))
                } else {
                    completion(result: "NSURLSession successful")
                    print(data)
                
                }
            }
        }
        task.resume()
    }
    

}
