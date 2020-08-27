//
//  ViewController.swift
//  youtube-onedaybuild-chris
//
//  Created by Slulupzzz on 8/21/20.
//  Copyright © 2020 Slulupzzz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var videos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Seti itself as the datasource and the dealagate
        tableView.dataSource = self
        tableView.delegate = self
        
        //set itself as delegate
        model.delegate = self
        
        model.getVideos()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //confirm that a video was selected
        guard tableView.indexPathForSelectedRow != nil else{
            return
        }
        
        //get a refrence to the video that was tapped on
        let selectedVideo = videos[tableView.indexPathForSelectedRow!.row]
        
        //get a refrence to the deatail view controller
        let detailVC = segue.destination as! DetailViewController
        
        //set the video property of the detail view controller
        detailVC.video = selectedVideo
    }
    
    //Mark : -Model Delegate Methods
    
    func videosFetched(_ videos: [Video]) {
        
        //set the returned videos to our video property
        self.videos = videos
        
        //refresh the table view
        tableView.reloadData()
        
    }
    
    //MARK : -TableView Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoCellTableViewCell
        
        //COnfigure the cell with the data
        //get tthe titile for the videos in question
        let video = self.videos[indexPath.row]
        
        cell.setCell(video)
        //Return the cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }


}

