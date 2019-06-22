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
        Sections(sectionTitle: "Mosques", models: [
            ARModel(title: "Ka'bah",
                    image: UIImage(named: "kaaba")!,
                    description: "The Ka’bah is the holiest of all Muslim places in the world. It is located at the center of Al-Masjid al-Haram, in Mecca, Saudi Arabia. Everywhere in the world, Muslims have to face the Ka’bah during prayers, known as facing the Qiblah."),

            ARModel(title: "Badshahi Mosque",
                    image: UIImage(named: "badshahi-mosque")!,
                    description: "Commissioned by Emperor Aurangzeb in 1671, with construction of the mosque lasting for two years until 1673. The mosque is an important example of Mughal architecture, with an exterior that is decorated with carved red sandstone with marble inlay. It remains the largest and most recent of the grand imperial mosques of the Mughal-era, and is the second-largest mosque in Pakistan. After the fall of the Mughal Empire, the mosque was used as a garrison by the Sikh Empire and the British Empire, and is now one of Pakistan's most iconic sights.")
        ])
    ]
}
