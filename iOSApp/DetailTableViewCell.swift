//
//  DetailTableViewCell.swift
//  iOSApp
//
//  Created by Himanshu Lanjewar on 03/01/19.
//  Copyright © 2019 iOS APP. All rights reserved.
//

import UIKit
import AlamofireImage

class DetailTableViewCell: UITableViewCell {
    
    let imageViewHeader:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
        img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        img.layer.cornerRadius = 35
        img.clipsToBounds = true
        return img
    }()
    
    let titleLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor =  UIColor.blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let detailedLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.sizeToFit()
        label.textColor =  UIColor.black
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let containerView:UIView = {
        let _containerView = UIView()
        _containerView.translatesAutoresizingMaskIntoConstraints = false
        _containerView.clipsToBounds = true // this will make sure its children do not go out of the boundary
        return _containerView
    }()

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(imageViewHeader)
        imageViewHeader.translatesAutoresizingMaskIntoConstraints = false
        imageViewHeader.topAnchor.constraint(equalTo:contentView.topAnchor, constant:10).isActive = true
        imageViewHeader.leadingAnchor.constraint(equalTo:contentView.leadingAnchor, constant:10).isActive = true
        imageViewHeader.widthAnchor.constraint(equalToConstant:70).isActive = true
        imageViewHeader.heightAnchor.constraint(equalToConstant:70).isActive = true
        
        addSubview(containerView)
        containerView.leadingAnchor.constraint(equalTo:self.imageViewHeader.trailingAnchor, constant:10).isActive = true
        containerView.topAnchor.constraint(equalTo:self.contentView.topAnchor, constant:10).isActive = true
        containerView.heightAnchor.constraint(equalTo:self.contentView.heightAnchor).isActive = true
        //containerView.heightAnchor.constraint(equalToConstant:90).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: self.contentView.bounds.width - self.imageViewHeader.bounds.width).isActive = true
        
        self.containerView.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
        
        self.containerView.addSubview(detailedLabel)
        detailedLabel.topAnchor.constraint(equalTo:self.titleLabel.bottomAnchor).isActive = true
        detailedLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        detailedLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
        detailedLabel.bottomAnchor.constraint(equalTo:self.containerView.bottomAnchor).isActive = true
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.detailedLabel.sizeToFit()
    }
}
