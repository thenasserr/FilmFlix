//
//  UpcomingViewController.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 03/03/2024.
//

import UIKit

class UpcomingViewController: UICollectionViewController {

    var sections: [any SectionsLayout] = []
    var viewModel: UpcomingViewModel
        
    // MARK: - Initializers
    init(viewModel: UpcomingViewModel) {
        self.viewModel = viewModel
        super.init(collectionViewLayout: .init())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = L10n.Upcoming.title
        getSections()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewWillAppear()
    }
    
    // MARK: - Private Methods
    private func getSections() {
        Task {
            do {
                let sections = try await viewModel.getSections()
                DispatchQueue.main.async {
                    self.configureCollectionView(with: sections)
                }
            } catch {
                self.show(error)
            }
        }
    }
    
    private func show( _ error: Error) {
        print(error)
    }
    
    // MARK: - UI Configuration
    private func configureCollectionView(with sections: [any SectionsLayout]) {
        self.sections = sections
        sections.forEach { section in
            section.registerCell(in: self.collectionView)
            section.registerSupplementaryView(in: self.collectionView)
        }
        collectionView.backgroundColor = .fMainBackground
        collectionView.collectionViewLayout = createCompositionalLayout()
        collectionView.reloadData()
    }
    
    // MARK: - Compositional Layout
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) in
            self.sections[sectionIndex].sectionLayout(self.collectionView, layoutEnvironment: layoutEnvironment)
        }
    }
    
    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].numberOfItems()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        sections[indexPath.section].collectionView(collectionView, cellForItemAt: indexPath)
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 viewForSupplementaryElementOfKind kind: String,
                                 at indexPath: IndexPath) -> UICollectionReusableView {
        sections[indexPath.section].collectionView(collectionView, viewForSupplementaryElementOfKind: kind, at: indexPath)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        sections[indexPath.section].collectionView(collectionView, didSelectItemAt: indexPath)
    }
}
