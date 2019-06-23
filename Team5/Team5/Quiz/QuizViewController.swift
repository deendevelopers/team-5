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

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var questionContainerView: UIView!
    @IBOutlet weak var questionTitle: UILabel!
    @IBOutlet weak var option1Container: UIView!
    @IBOutlet weak var option1Label: UILabel!
    @IBOutlet weak var option2Container: UIView!
    @IBOutlet weak var option2Label: UILabel!
    @IBOutlet weak var option3Container: UIView!
    @IBOutlet weak var option3Label: UILabel!

    var questionBank: Quiz?
    var questionNumber = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        navigationController?.setNavigationBarHidden(true, animated: true)
        startAnimation()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    private func setupUI() {
        questionContainerView.layer.cornerRadius = 10
        option1Container.layer.cornerRadius = 25
        option2Container.layer.cornerRadius = 25
        option3Container.layer.cornerRadius = 25
    }

    private func startAnimation() {
        let animationView = AnimationView(name: "question-mark")
        animationView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        animationView.center = self.view.center
        animationView.contentMode = .scaleAspectFill

        view.addSubview(animationView)

        animationView.play { (finished) in
            UIView.animate(withDuration: 0.2, animations: { [weak self] in
                animationView.alpha = 0.0
                self?.loadQuiz()
            })
        }
    }

    @IBAction func closeButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    func configure(with model: ARModel) {
        if model.title == "Ka'bah" {
            questionBank = KaabaQuiz().quiz
        }
    }

    private func loadQuiz() {
        guard let quiz = questionBank else { return }
        titleLabel.text = quiz.title
        questionTitle.text = quiz.questions[0].text
        option1Label.text = quiz.questions[0].options[0].text
        option2Label.text = quiz.questions[0].options[1].text
        option3Label.text = quiz.questions[0].options[2].text

        self.view.layoutSubviews()
        self.view.setNeedsLayout()
    }

}
