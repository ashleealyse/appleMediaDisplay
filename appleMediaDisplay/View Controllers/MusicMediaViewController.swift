//
//  ViewController.swift
//  appleMediaDisplay
//
//  Created by Ashlee Krammer on 4/16/18.
//  Copyright © 2018 Ashlee Krammer. All rights reserved.
//

import UIKit

class MusicMediaViewController: UIViewController {

    let mediaDisplayView = MediaDisplayView()
    
    var iTunesSongs = [Result]() {
        didSet {
             mediaDisplayView.mediaTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mediaDisplayView)
        loadSongs()
        self.view.backgroundColor = .white
        self.mediaDisplayView.mediaTableView.delegate = self
        self.mediaDisplayView.mediaTableView.dataSource = self
        self.mediaDisplayView.mediaTypeLabel.text = " Music"
        self.mediaDisplayView.mediaTableView.register(MediaTableViewCell.self, forCellReuseIdentifier: "MediaCell")
        
    }

    @objc  func loadSongs(){
        
        let urlStr = "https://rss.itunes.apple.com/api/v1/us/itunes-music/hot-tracks/all/100/explicit.json"

        let completion = {(onlineSongs: [Result]) in
            self.iTunesSongs = onlineSongs
        }
        
        let errorHanlder: (AppError) -> Void = {(error: AppError) in
            switch error{
            case .noInternetConnection:
                print("No internet connection")
            case .couldNotParseJSON:
                print("Could Not Parse")
            case .badStatusCode:
                print("Bad Status Code")
            case .badURL:
                print("Bad URL")
            case .invalidJSONResponse:
                print("Invalid JSON Response")
            case .noDataReceived:
                print("No Data Received")
            case .notAnImage:
                print("No Image Found")
            default:
                print("Other error")
            }
        }
        
        MediaAPIClient.manager.getMedia(from: urlStr, completionHandler: completion, errorHandler: errorHanlder)
    }

}

extension MusicMediaViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

extension MusicMediaViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return iTunesSongs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MediaCell", for: indexPath) as! MediaTableViewCell
        let aSong = iTunesSongs[indexPath.row]
        cell.mediaTitle.text = aSong.name
        cell.artistNameLabel.text = aSong.artistName
        cell.mediaTypeLabel.text = aSong.kind
        
        let imageUrlStr = aSong.artworkUrl100
        
        let completion: (UIImage) -> Void = {(onlineImage: UIImage) in
            cell.mediaImg.image = onlineImage
        }
        
        ImageAPIClient.manager.loadImage(from: imageUrlStr, completionHandler: completion, errorHandler: {print($0)})
        
        return cell
    }
    
}

