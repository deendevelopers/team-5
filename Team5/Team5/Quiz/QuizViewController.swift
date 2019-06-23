//
//  QuizViewController.swift
//  Team5
//
//  Created by Ridwan Al-Mansur on 23/06/2019.
//  Copyright © 2019 Rasheed Wihaib. All rights reserved.
//

import UIKit
import Lottie

class QuizViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(true, animated: true)
        startAnimation()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    private func startAnimation() {

        let animationView = AnimationView(name: "question-mark")
        animationView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        animationView.center = self.view.center
        animationView.contentMode = .scaleAspectFill

        view.addSubview(animationView)

        animationView.play { (finished) in

            UIView.animate(withDuration: 0.2, animations: {
                animationView.alpha = 0.0
            })
        }
    }

    @IBAction func closeButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
