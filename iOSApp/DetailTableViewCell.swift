//
//  DetailTableViewCell.swift
//  iOSApp
//
//  Created by Nishigandha Rajurkar on 03/01/19.
//  Copyright © 2019 iOS APP. All rights reserved.
//

import UIKit
import AlamofireImage

class DetailTableViewCell: UITableViewCell {
    
    // MARK: LABEL and VIEW
    let imageViewHeader:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = CGFloat(Constants.CORNER_RADIUS)
        img.clipsToBounds = true
        return img
    }()
    
    let titleLabel:UILabel = {
        let label = UILabel()
        label.font = Constants.TITLE_LABEL
        label.textColor = Constants.kColor_title
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let detailedLabel:UILabel = {
        let label = UILabel()
        label.font = Constants.DETAIL_LABEL
        label.numberOfLines = 0
        label.textAlignment = .left
        label.sizeToFit()
        label.textColor =  Constants.kColor_detailedLabel
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let containerView:UIView = {
        let _containerView = UIView()
        _containerView.translatesAutoresizingMaskIntoConstraints = false
        _containerView.clipsToBounds = true
        return _containerView
    }()
    
    // MARK: Initalizers
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let marginGuide = contentView.layoutMarginsGuide
        
        contentView.addSubview(imageViewHeader)
        imageViewHeader.translatesAutoresizingMaskIntoConstraints = false
        imageViewHeader.topAnchor.constraint(equalTo:contentView.topAnchor, constant:10).isActive = true
        imageViewHeader.leadingAnchor.constraint(equalTo:contentView.leadingAnchor, constant:10).isActive = true
        imageViewHeader.widthAnchor.constraint(equalToConstant:70).isActive = true
        imageViewHeader.heightAnchor.constraint(equalToConstant:70).isActive = true
        
        // Configure titleLabel
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: imageViewHeader.trailingAnchor, constant:10).isActive = true
        titleLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant:20).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true

        // Configure detailedLabel
        contentView.addSubview(detailedLabel)
        detailedLabel.translatesAutoresizingMaskIntoConstraints = false
        detailedLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        detailedLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        detailedLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        detailedLabel.topAnchor.constraint(equalTo: imageViewHeader.bottomAnchor, constant:10).isActive = true
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.detailedLabel.sizeToFit()
    }
}
