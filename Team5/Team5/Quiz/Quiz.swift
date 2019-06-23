//
//  Quiz.swift
//  Team5
//
//  Created by Ridwan Al-Mansur on 23/06/2019.
//  Copyright © 2019 Rasheed Wihaib. All rights reserved.
//

import Foundation

struct Quiz {
    let title: String
    let questions: [Question]
}

struct Question {
    let number: Int
    let text: String
    let options: [Option]
    let information: String
}

struct Option {
    let text: String
    let isCorrect: Bool
}

struct KaabaQuiz {
    let quiz = Quiz(title: "Ka'bah", questions: [

        Question(number: 1,
                 text: "Why is pilgrimage to Makkah important for Muslims?",
                 options: [
                    Option(text: "It is a chance for a break from everyday life", isCorrect: false),
                    Option(text: "It is a duty for a Muslim to go to Makkah (Mecca) at least once in their lifetime", isCorrect: true),
                    Option(text: "It enables Muslims to spend time with family", isCorrect: false)],
                 information: "Pilgrimage to Makkah (Mecca), also known as Hajj, is the Fifth Pillar of Islam and is an obligation for Muslims at least once in their lifetime as long as they are fit enough and have the financial means."),

        Question(number: 2,
                 text: "What is a pilgrimage?",
                 options: [
                    Option(text: "A journey of spiritual importance", isCorrect: true),
                    Option(text: "A rite of passage", isCorrect: false),
                    Option(text: "The place of birth of a religion's founder", isCorrect: false)],
                 information: "A pilgrimage is a journey of spiritual importance. It is usually to a place connected with the founder of the religion, or an important person or event in the religion's history."),

        Question(number: 3,
                 text: "Why is the journey to the Plain of Arafat an important part of the Hajj?",
                 options: [
                    Option(text: "It is a reminder of Muhammad's birth", isCorrect: false),
                    Option(text: "It is where an important battle took place", isCorrect: false),
                    Option(text: "It is a reminder of the Day of Judgement", isCorrect: true)],
                 information: "The journey to the Plain of Arafat is an important part of the Hajj because it is a reminder of the Day of Judgement and gives Muslims time to reflect on their lives and ask for forgiveness."),

        Question(number: 4,
                 text: "In which direction do Muslims walk around the Ka'bah?", options: [
                    Option(text: "Clockwise", isCorrect: false),
                    Option(text: "Anti-clockwise", isCorrect: true),
                    Option(text: "From side to side", isCorrect: false)],
                 information: "Muslims walk around the Ka'bah in an anti-clockwise direction."),

        Question(number: 5,
                 text: "Why do Muslims throw stones at three pillars, known as Jamarat, during the Hajj?",
                 options: [
                    Option(text: "It is a reminder of the importance of keeping fit", isCorrect: false),
                    Option(text: "All things made of stone are evil", isCorrect: false),
                    Option(text: "The pillars represent the Devil", isCorrect: true)],
                 information: "Muslims throw stones at the three pillars because they represent the Devil and are a reminder of how Ibrahim fought the temptation of the Devil."),

        Question(number: 6,
                 text: "What is Tawaf?",
                 options: [
                    Option(text: "Food that has been blessed", isCorrect: false),
                    Option(text: "Walking around the Ka’bah seven times while repeating prayers", isCorrect: true),
                    Option(text: "The final sacrifice to Allah", isCorrect: false)],
                 information: "Tawaf is when pilgrims walk around the Ka’bah in Mecca seven times while repeating prayers."),

        Question(number: 7,
                 text: "Are all Muslims expected to go on Hajj?",
                 options: [
                    Option(text: "Yes, it is compulsory", isCorrect: false),
                    Option(text: "Yes, but only men", isCorrect: false),
                    Option(text: "Yes, as long as they are physically able and can afford it", isCorrect: true)],
                 information: "All Muslims are expected to go on Hajj at least once in their lifetimes, if they are physically able and can afford to."),

        Question(number: 8,
                 text: "How many times are Muslims expected to hurry between Safa and Marwa?",
                 options: [
                    Option(text: "A couple of times", isCorrect: false),
                    Option(text: "7 times", isCorrect: true),
                    Option(text: "A dozen times", isCorrect: false)],
                 information: "Muslims are expected to hurry between Safa and Marwa 7 times."),

        Question(number: 9,
                 text: "What festival do Muslims celebrate at the end of pilgrimage (or Hajj)?",
                 options: [
                    Option(text: "Eid ul-Adha", isCorrect: true),
                    Option(text: "Ramadan", isCorrect: false),
                    Option(text: "Islamic New Year", isCorrect: false)],
                 information: "Muslims celebrate the festival of Eid ul-Adha at the end of the pilgrimage."),

        Question(number: 10,
                 text: "Why do Muslims sacrifice an animal on the festival of Eid ul-Adha?",
                 options: [
                    Option(text: "To remind themselves that they should eat meat", isCorrect: false),
                    Option(text: "To symbolise the lamb provided by Allah for Ibrahim to sacrifice in place of his son", isCorrect: true),
                    Option(text: "To celebrate the end of a holiday in Arabia", isCorrect: false)],
                 information: "At Eid ul-Adha Muslims sacrifice an animal to symbolise the lamb Allah gave to Ibrahim to sacrifice in place of his son, Ismail."),

        ])
}
