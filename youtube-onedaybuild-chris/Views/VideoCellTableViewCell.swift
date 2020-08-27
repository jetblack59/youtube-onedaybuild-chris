//
//  VideoCellTableViewCell.swift
//  youtube-onedaybuild-chris
//
//  Created by Slulupzzz on 8/26/20.
//  Copyright © 2020 Slulupzzz. All rights reserved.
//

import UIKit

class VideoCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailimageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var video:Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ v:Video){
        self.video = v
        
        guard self.video != nil else{
            return
        }
        
        //set title label and date label
        self.titleLabel.text = video?.title
        
        //set the date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        //set the thumbnail
        guard self.video!.thumbnail != "" else {
            return
        }
        
        //cehck cache before downloading data
        if let cachedData = CacheManager.getVideoCache(self.video!.thumbnail){
            
            //set the thumbnail image view
            self.thumbnailimageView.image = UIImage(data: cachedData)
            return
        }
        
        //download thumnail data
        let url = URL(string: self.video!.thumbnail)
        
        //shared url session object session
        let session = URLSession.shared
        
        //create data task
        let dataTask = session.dataTask(with: url!) {
            (data, response, error) in
            
            if error == nil && data != nil {
                
                //save the data in the cache
                CacheManager.setVideoCache(url!.absoluteString, data)
                
                //check that the downloaded url matches the video thumbnail url that this cell is currently set to the display
                if url!.absoluteString != self.video?.thumbnail {
                    return
                }
                
                //Create the image object
                let image = UIImage(data: data!)
                
                //set the image view
                DispatchQueue.main.async {
                    self.thumbnailimageView.image = image
                }
            }
        }
        
        //start data task
        dataTask.resume()
        
    }
}

