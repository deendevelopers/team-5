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

    @IBOutlet weak var mainContainerStackView: UIStackView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var questionContainerView: UIView!
    @IBOutlet weak var questionTitle: UILabel!
    @IBOutlet weak var option1Button: UIButton!
    @IBOutlet weak var option2Button: UIButton!
    @IBOutlet weak var option3Button: UIButton!

    // MARK: - Answer Views

    @IBOutlet weak var answerContainerOuterView: UIView!
    @IBOutlet weak var answerContainerView: UIView!
    @IBOutlet weak var answerText: UILabel!
    @IBOutlet weak var answerInfo: UILabel!

    var questionBank: Quiz!
    var questionBankIndex = 0
    var answersCorrect = 0
    var answerIsCorrect = false
    var isFinishedQuiz = false

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupAnswerView()
        navigationController?.setNavigationBarHidden(true, animated: true)
        startAnimation()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    private func setupUI() {
        titleLabel.text = questionBank.title

        option1Button.titleLabel?.numberOfLines = 0
        option2Button.titleLabel?.numberOfLines = 0
        option3Button.titleLabel?.numberOfLines = 0

        option1Button.titleLabel?.textAlignment = .center
        option2Button.titleLabel?.textAlignment = .center
        option3Button.titleLabel?.textAlignment = .center

        option1Button.layer.cornerRadius = 7.5
        option2Button.layer.cornerRadius = 7.5
        option3Button.layer.cornerRadius = 7.5

        option1Button.layer.shadowColor = UIColor.black.cgColor
        option1Button.layer.shadowOpacity = 0.5
        option1Button.layer.shadowOffset = .zero
        option1Button.layer.shadowRadius = 4.0

        option2Button.layer.shadowColor = UIColor.black.cgColor
        option2Button.layer.shadowOpacity = 0.5
        option2Button.layer.shadowOffset = .zero
        option2Button.layer.shadowRadius = 4.0

        option3Button.layer.shadowColor = UIColor.black.cgColor
        option3Button.layer.shadowOpacity = 0.5
        option3Button.layer.shadowOffset = .zero
        option3Button.layer.shadowRadius = 4.0
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
                self?.mainContainerStackView.isHidden = false
                self?.showNextQuestion()
            })
        }
    }

    @IBAction func closeButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    func configure(with model: ARModel) {
        questionBank = KaabaQuiz().quiz
    }

    private func showNextQuestion() {
        guard questionBank.questions.indices.contains(questionBankIndex) else {
            showFinishedQuiz()
            return
        }

        let questionNumber = "\(questionBankIndex + 1)"
        let questionText = questionBank.questions[questionBankIndex].text

        questionTitle.text = "\(questionNumber). \(questionText)"
        option1Button.setTitle(questionBank.questions[questionBankIndex].options[0].text, for: .normal)
        option2Button.setTitle(questionBank.questions[questionBankIndex].options[1].text, for: .normal)
        option3Button.setTitle(questionBank.questions[questionBankIndex].options[2].text, for: .normal)
    }

    @IBAction func answerTapped(_ sender: UIButton) {
        let selectedAnswer = questionBank.questions[questionBankIndex].options[sender.tag]

        answerIsCorrect = selectedAnswer.isCorrect ? true : false
        showAnswerView()

        questionBankIndex += 1
        showNextQuestion()
    }
}

// MARK: - Answer View

extension QuizViewController {

    private func setupAnswerView() {
        let tapRecogniser = UITapGestureRecognizer(target: self, action: #selector(hideAnswerView))
        answerContainerView.addGestureRecognizer(tapRecogniser)
        answerContainerView.layer.cornerRadius = 25
        answerContainerOuterView.layer.cornerRadius = 25
    }

    @objc func showAnswerView() {
        answerText.text = answerIsCorrect ? "Correct" : "Incorrect"

        if answerIsCorrect {
            answersCorrect += 1
        }

        answerText.textColor = answerIsCorrect ? UIColor(red:0.04, green:0.83, blue:0.55, alpha:1.0) : UIColor(red:0.83, green:0.04, blue:0.04, alpha:1.0)

        answerContainerOuterView.backgroundColor = answerIsCorrect ? UIColor(red:0.04, green:0.9, blue:0.55, alpha:1.0) : UIColor(red:0.9, green:0.04, blue:0.04, alpha:1.0)

        answerInfo.text = questionBank.questions[questionBankIndex].information

        answerContainerOuterView.isHidden = false
        answerContainerView.isHidden = false
        option1Button.isEnabled = false
        option2Button.isEnabled = false
        option3Button.isEnabled = false
    }

    @objc func hideAnswerView() {
        if isFinishedQuiz { navigationController?.popViewController(animated: true) }

        answerContainerOuterView.isHidden = true
        answerContainerView.isHidden = true
        option1Button.isEnabled = true
        option2Button.isEnabled = true
        option3Button.isEnabled = true

        guard questionBank.questions.indices.contains(questionBankIndex) else {
            showFinishedQuiz()
            return
        }
    }

    func showFinishedQuiz() {
        answerText.text = "Total: \(answersCorrect)/\(questionBank.questions.count)"
        answerInfo.text = ""

        isFinishedQuiz = true
        answerContainerOuterView.isHidden = false
        answerContainerView.isHidden = false
        option1Button.isEnabled = false
        option2Button.isEnabled = false
        option3Button.isEnabled = false
    }
}
