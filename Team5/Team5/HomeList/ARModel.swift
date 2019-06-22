//
//  Model.swift
//  Team5
//
//  Created by Ridwan Al-Mansur on 22/06/2019.
//  Copyright © 2019 Rasheed Wihaib. All rights reserved.
//

import UIKit

struct ARModel {
    let title: String
    let image: UIImage
    let description: String
}

struct Sections {
    let sectionTitle: String
    let models: [ARModel]
}

struct HomeListDataSource {
    let sections = [
        Sections(sectionTitle: "AR Mosques", models: [
            ARModel(title: "Ka'aba",
                    image: UIImage(named: "kaaba")!,
                    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip"),
            ARModel(title: "Masjid an-Nabawi",
                    image: UIImage(named: "nabawi")!,
                    description: "description")
        ])
    ]
}
