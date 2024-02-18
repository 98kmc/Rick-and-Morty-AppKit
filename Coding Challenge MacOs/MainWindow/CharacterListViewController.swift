//
//  CharacterListViewController.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 10/02/2024.
//

import AppKit

private let reuseIdentifier = "Cell"

class CharacterListViewController: NSViewController {

    @IBOutlet private weak var charactersCollectionView: NSCollectionView!
    @IBOutlet private weak var progressView: NSProgressIndicator!
        
    // MARK: - Properties
    private let viewModel: CharacterListViewModel
    private lazy var dataSource: DataSource = { createDataSource() }()
    private let section = "OneSection"
    private var elements: [Character] = []
    
    init(viewModel: CharacterListViewModel) {
        self.viewModel = viewModel
        self.elements = viewModel.characterList
        
        super.init(nibName: "CharacterListViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        charactersCollectionView.isSelectable = true
        charactersCollectionView.allowsEmptySelection = false
        charactersCollectionView.register(CharacterItemCell.self, forItemWithIdentifier: CharacterItemCell.reuseIdentifier)
        
        viewModel.characterListDidChange = { [unowned self] newCharacterList in
            elements = newCharacterList
            applySnapshot(animatingDifferences: true)
        }
        
        viewModel.viewStateDidChange = { [unowned self] state in
            updateViewWithState(state)
        }
    }
    
    override func viewWillAppear() {
        
        progressView.isHidden = true
        charactersCollectionView.collectionViewLayout = createListLayout()
        elements = viewModel.characterList
        
        applySnapshot(animatingDifferences: false)
    }
    
    // MARK: Private Methods
    private func updateViewWithState(_ state: ViewState) {
        
        DispatchQueue.main.sync {
            switch(state) {
            case .success:
                progressView.isHidden = true
                progressView.stopAnimation(self)
            case .loading:
                progressView.isHidden = false
                progressView.startAnimation(self)
            case .error(let error):
                print(error)
            }
        }
    }
}

extension CharacterListViewController: NSCollectionViewDelegate {
    
    // MARK: - Typealias
    private typealias Snapshot = NSDiffableDataSourceSnapshot<String, Character>
    private typealias DataSource = NSCollectionViewDiffableDataSource<String, Character>
    
    private func createListLayout() -> NSCollectionViewCompositionalLayout {
        
        let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                          heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: size)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 1, bottom: 0, trailing: 1)
        
        let group: NSCollectionLayoutGroup
        let  groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                heightDimension: .absolute(100))
        
        group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: Array(repeating: item, count: 1))
        
        group.interItemSpacing = .fixed(CGFloat(10))
        group.contentInsets =  NSDirectionalEdgeInsets(top: 0, leading: 1, bottom: 0, trailing: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 1, bottom: 8, trailing: 1)
        section.interGroupSpacing = CGFloat(10)
        
        return NSCollectionViewCompositionalLayout(section: section)
    }
    
    private func createDataSource() -> DataSource {
        
        NSCollectionViewDiffableDataSource(collectionView: charactersCollectionView) { [unowned viewModel] (collectionView, indexPath, item) -> NSCollectionViewItem? in
            
            let cell: CharacterItemCell = collectionView.makeItem(withIdentifier: CharacterItemCell.reuseIdentifier, for: indexPath) as! CharacterItemCell
            cell.render(
                imageUrl: item.image,
                characterName: item.name,
                characterOrigin: item.origin.name,
                onSelectionChange: { isSelected in
                    
                    if isSelected {
                        viewModel.didSelectItem(itemId: item.id)
                    }
                }
            )
        
            viewModel.pageIfNeeded(itemId: item.id)
            return cell
        }
    }
    
    private func applySnapshot(animatingDifferences: Bool = false) {
        
        var snapshot = Snapshot()
        snapshot.appendSections([section])
        
        snapshot.appendItems(elements, toSection: section)

        dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
    }
}
