//
//  HomeListViewController.swift
//  Team5
//
//  Created by Rasheed Wihaib on 22/06/2019.
//  Copyright © 2019 Rasheed Wihaib. All rights reserved.
//

import UIKit

class HomeListViewController: UIViewController {

    let dataSource = HomeListDataSource()

    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Islamic History AR"
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib.init(nibName: "ListCell", bundle: nil),
                                forCellWithReuseIdentifier: "ListCell")
    }
}

// MARK: - List Cell Delegate

extension HomeListViewController: ListCellDelegate {
    func didTapListCell(model: ARModel) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "QuizViewController") as? QuizViewController else {
            return
        }
        vc.configure(with: model)
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - UICollectionView Delegate

extension HomeListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "ARInteraction", bundle: nil)
        guard let vc = storyboard.instantiateInitialViewController() as? ARInteractionViewController else {
            return
        }
        vc.arModel = dataSource.sections[indexPath.section].models[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Collection View Data Source

extension HomeListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCell", for: indexPath) as? ListCell else {
            return UICollectionViewCell()
        }

        cell.delegate = self
        cell.configure(with: dataSource.sections[indexPath.section].models[indexPath.row])
        return cell
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource.sections.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.sections[section].models.count
    }
}

// MARK: - UICollectionView Flow Layout

extension HomeListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = UIScreen.main.bounds.size.width
        let height: CGFloat = 250.0
        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {

        case UICollectionView.elementKindSectionHeader:

            guard let headerView = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: "\(HeaderCollectionReusableView.self)",
                for: indexPath) as? HeaderCollectionReusableView else {
                    fatalError("Invalid view type")
            }

            return headerView

        case UICollectionView.elementKindSectionFooter:

            guard let footerView = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: "FooterCollectionReusableView",
                for: indexPath) as? HeaderCollectionReusableView else {
                    fatalError("Invalid view type")
            }

            return footerView

        default:
            assert(false, "Invalid element type")
        }
    }
}
