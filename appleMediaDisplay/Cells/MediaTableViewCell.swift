//
//  MediaTableViewCell.swift
//  appleMediaDisplay
//
//  Created by Ashlee Krammer on 4/16/18.
//  Copyright © 2018 Ashlee Krammer. All rights reserved.
//

import UIKit

class MediaTableViewCell: UITableViewCell {

    lazy var mediaImg: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        img.backgroundColor = UIColor.purple.withAlphaComponent(0.5)
        return img
    }()
    
    lazy var mediaTitle: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        return lbl
    }()
    
    lazy var artistNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        return lbl
    }()
    
    lazy var mediaTypeLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.font = UIFont(name: "Helvetica-Light", size: 12)
        return lbl
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        setUpMediaImg()
        setUpMediaTitle()
        setUpMediaArtistNameLabel()
        setUpMediaTypeLabel()
    }
    
    func setUpMediaImg() {
        addSubview(mediaImg)
        mediaImg.translatesAutoresizingMaskIntoConstraints = false
        mediaImg.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 5).isActive = true
        mediaImg.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        mediaImg.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -5).isActive = true
        
        mediaImg.widthAnchor.constraint(equalTo: mediaImg.heightAnchor).isActive = true
        
        
    }
    
    func setUpMediaTitle() {
        addSubview(mediaTitle)
        mediaTitle.translatesAutoresizingMaskIntoConstraints = false
        mediaTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        mediaTitle.leadingAnchor.constraint(equalTo: mediaImg.trailingAnchor, constant: 5).isActive = true
        mediaTitle.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -5).isActive = true
        
    }
    
    func setUpMediaArtistNameLabel() {
        addSubview(artistNameLabel)
        artistNameLabel.translatesAutoresizingMaskIntoConstraints = false
        artistNameLabel.topAnchor.constraint(equalTo: mediaTitle.bottomAnchor, constant: 5).isActive = true
        artistNameLabel.leadingAnchor.constraint(equalTo: mediaImg.trailingAnchor, constant: 5).isActive = true
        artistNameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -5).isActive = true
        
    }
    
    func setUpMediaTypeLabel() {
        addSubview(mediaTypeLabel)
        mediaTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        mediaTypeLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -5).isActive = true
        mediaTypeLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -5).isActive = true
    }

}
