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
    func loadData(urlString: String, completion: (result: String) -> Void) {
        
        //enable this for no cache
        let config = NSURLSessionConfiguration.ephemeralSessionConfiguration()
        let session = NSURLSession(configuration:  config)
        
        //enable this for cache
        //let session = NSURLSession.sharedSession()
        
        let url = NSURL(string: urlString)!
        
        let task = session.dataTaskWithURL(url) {
            (data, response, error) -> Void in
            
            if error != nil {
                dispatch_async(dispatch_get_main_queue()) {
                    completion(result: (error!.localizedDescription))
                }
                
            } else {
                
                do {
                    /* .AllowFragments - top level object is not Array or Dictionary.
                     Any type of string or value
                     NSJSONSerialization requires the Do / Try / Catch
                     Converts the NSDATA into a JSON Object and cast it to a Dictionary */
                    
                    if let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
                        as? [String: AnyObject] {
                        
                        print(json)
                        
                        let priority = DISPATCH_QUEUE_PRIORITY_HIGH
                        dispatch_async(dispatch_get_global_queue(priority, 0)) {
                            dispatch_async(dispatch_get_main_queue()) {
                                completion(result: "JSONSerialization Successful")
                            }
                        }
                    }
                } catch {
                    dispatch_async(dispatch_get_main_queue()) {
                        completion(result: "error in NSJSONSerialization")
                    }
                    
                }
                //End of JSONSerialization
                
            }
        }
        
        task.resume()
    }
    
    
}
