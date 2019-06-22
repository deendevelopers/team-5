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
        Sections(sectionTitle: "", models: [
            ARModel(title: "Quran",
                    image: UIImage(named: "quran")!,
                    description: "The Qur'an, sometimes spelled Koran, (Arabic: القرآن) is the holy book of Islam. The Qur'an is considered by Muslims to be 'The Word of Allah (God)'. This book is different from other religious texts in that it is believed to be written directly by God, through the prophet Muhammad. Some Muslims call it the Final Testament."),

            ARModel(title: "Badshahi Mosque",
                    image: UIImage(named: "badshahi-mosque")!,
                    description: "Commissioned by Emperor Aurangzeb in 1671, with construction of the mosque lasting for two years until 1673. The mosque is an important example of Mughal architecture, with an exterior that is decorated with carved red sandstone with marble inlay. It remains the largest and most recent of the grand imperial mosques of the Mughal-era, and is the second-largest mosque in Pakistan. After the fall of the Mughal Empire, the mosque was used as a garrison by the Sikh Empire and the British Empire, and is now one of Pakistan's most iconic sights.")
        ])
    ]
}
