//
//  Model.swift
//  youtube-onedaybuild-chris
//
//  Created by Slulupzzz on 8/25/20.
//  Copyright © 2020 Slulupzzz. All rights reserved.
//

import Foundation

protocol ModelDelegate{
    func videosFetched(_ videos:[Video])
}

class Model {
    
    var delegate:ModelDelegate?
    
    func getVideos(){
        
       // Create url object
        let url = URL (string: Constants.API_URL)
        
        guard url != nil else{
            return
        }
        
        // Get a URLSessison object
        let session = URLSession.shared
        
        // Get a data task from the URLSession object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            //check if any error
            if error != nil || data == nil{
                return
            }
            
            do{
                //parsing the data into video objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                
                if response.items != nil{
                    
                    DispatchQueue.main.async {
                        //call the "videoreturened" emthod of the delegate
                        self.delegate?.videosFetched(response.items!)
                    }
                    
                    
                }
                
                
                dump(response)
            }
                
            catch{
                
            }

            
        }
        
        // Kick off the task
        dataTask.resume()
        
    }
    
}
