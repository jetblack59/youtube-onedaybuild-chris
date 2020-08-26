//
//  Constants.swift
//  youtube-onedaybuild-chris
//
//  Created by Slulupzzz on 8/25/20.
//  Copyright © 2020 Slulupzzz. All rights reserved.
//

import Foundation

struct Constants {
    
    static var API_KEY = "AIzaSyAJuI1_YlTLBDFCwx0xVKfbZgJZfWmw0XI"
    static var PLAYLIST_ID = "UUbvnFQK524Y7PXx3ceWCTQQ"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    
    static var VIDEOCELL_ID = "VideoCell"
}
