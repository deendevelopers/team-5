//
//  ListCell.swift
//  Team5
//
//  Created by Ridwan Al-Mansur on 22/06/2019.
//  Copyright © 2019 Rasheed Wihaib. All rights reserved.
//

import UIKit

class ListCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var labelContainerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.layer.cornerRadius = 7.5
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOpacity = 0.5
        contentView.layer.shadowOffset = .zero
        contentView.layer.shadowRadius = 4.0
    }

    public func configure(with model: ARModel) {
        imageView.image = model.image
        titleLabel.text = model.title
        descriptionLabel.text = model.description
        setGradientBackground(top: model.labelColour.top, bottom: model.labelColour.bottom)

    }

    func setGradientBackground(top topColour: UIColor, bottom bottomColour: UIColor) {

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [bottomColour.cgColor, topColour.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = bounds

        labelContainerView.layer.insertSublayer(gradientLayer, at:0)
    }
}
