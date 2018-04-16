//
//  MediaDetailView.swift
//  appleMediaDisplay
//
//  Created by Ashlee Krammer on 4/16/18.
//  Copyright © 2018 Ashlee Krammer. All rights reserved.
//

import UIKit

class MediaDetailView: UIView {

    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        return view
    }()
    
    var mediaImageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
    }()
    
    var mediaTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.font = UIFont(name: "Helvetica", size: 25)
        return lbl
    }()
    
    var mediaArtistNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.font = UIFont(name: "Helvetica", size: 18)
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    convenience init() {
        self.init(frame: UIScreen.main.bounds)
        backgroundColor = UIColor.black.withAlphaComponent(0.5)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit() {
        setupViews()
    }
    
    private func setupViews() {
        setupContainerView()
        setupMediaImageView()
    }
    
    public func configureDetailedView(result: Result, image: UIImage){
        mediaImageView.image = image
    }
    
    private func setupMediaImageView() {
        containerView.addSubview(mediaImageView)
        mediaImageView.translatesAutoresizingMaskIntoConstraints = false
        mediaImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        mediaImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        mediaImageView.heightAnchor.constraint(equalTo: containerView.heightAnchor).isActive = true
        mediaImageView.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
    }
    
    
    private func setupContainerView() {
        addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.85).isActive = true
        containerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.50).isActive = true
    }

}
