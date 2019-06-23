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
    let subtitle: String
    let image: UIImage
    let description: String
    let labelColour: (top: UIColor, bottom: UIColor)
}

struct Sections {
    let sectionTitle: String
    let models: [ARModel]
}

struct HomeListDataSource {
    let sections = [
        Sections(sectionTitle: "", models: [
            ARModel(title: "Quran",
                    subtitle: "",
                    image: UIImage(named: "quran")!,
                    description: "The Qur'an, sometimes spelled Koran, (Arabic: القرآن) is the holy book of Islam. The Qur'an is considered by Muslims to be 'The Word of Allah (God)'. This book is different from other religious texts in that it is believed to be written directly by God, through the prophet Muhammad. Some Muslims call it the Final Testament.",
                    labelColour: (top: UIColor(red:0.00, green:0.63, blue:0.93, alpha:0.65),
                                  bottom: UIColor(red:0.01, green:0.60, blue:0.93, alpha:0.65))
            ),
            ARModel(title: "Ka'bah",
                    subtitle: "Makkah",
                    image: UIImage(named: "kaaba")!,
                    description: "The Ka’bah is the holiest of all Muslim places in the world. It is located at the center of Al-Masjid al-Haram, in Mecca, Saudi Arabia. Everywhere in the world, Muslims have to face the Ka’bah during prayers, known as facing the Qiblah.",
                    labelColour: (top: UIColor(red:0.46, green:0.00, blue:0.93, alpha:0.65),
                                  bottom: UIColor(red:0.64, green:0.01, blue:0.93, alpha:0.65))
            ),
            ARModel(title: "Badshahi Mosque",
                    subtitle: "Pakistan",
                    image: UIImage(named: "badshahi-mosque")!,
                    description: "Commissioned by Emperor Aurangzeb in 1671, with construction of the mosque lasting for two years until 1673. The mosque is an important example of Mughal architecture, with an exterior that is decorated with carved red sandstone with marble inlay. It remains the largest and most recent of the grand imperial mosques of the Mughal-era, and is the second-largest mosque in Pakistan. After the fall of the Mughal Empire, the mosque was used as a garrison by the Sikh Empire and the British Empire, and is now one of Pakistan's most iconic sights.",
                    labelColour: (top: UIColor(red:0.93, green:0.48, blue:0.00, alpha:0.65),
                                  bottom: UIColor(red:0.93, green:0.45, blue:0.01, alpha:0.65))
            )
        ])
    ]
}
