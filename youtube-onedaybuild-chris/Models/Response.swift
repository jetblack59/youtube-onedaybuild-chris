//
//  Response.swift
//  youtube-onedaybuild-chris
//
//  Created by Slulupzzz on 8/25/20.
//  Copyright © 2020 Slulupzzz. All rights reserved.
//

import Foundation

struct Response: Decodable {
    
    var items:[Video]?
    
    enum  CodingKeys:String, CodingKey {
        
        case items
        
    }
    
    init (from decoder:Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.items = try container.decode([Video].self, forKey: .items)
        
    }
    
    
}
