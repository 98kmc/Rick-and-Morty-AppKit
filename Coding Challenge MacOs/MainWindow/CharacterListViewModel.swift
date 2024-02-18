//
//  CharacterListViewModel.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 17/02/2024.
//

import Foundation

protocol CharacterListViewModelDelegate {
    
    func updateDetailView()
}

final class CharacterListViewModel {
        
    var characterListDidChange: (([Character]) -> Void)?
    var viewStateDidChange: ((ViewState) -> Void)?
    
    private(set) var characterList: [Character] = [] {
        didSet {
            characterListDidChange?(characterList)
        }
    }
    
    private(set) var viewState: ViewState = .success {
        didSet {
            viewStateDidChange?(viewState)
        }
    }
    
    private let characterUseCase: GetAllCharactersUseCase
    private let delegate: CharacterListViewModelDelegate
    private var currentPage: Int = 0
    
    init(characterUseCase: GetAllCharactersUseCase, delegate: CharacterListViewModelDelegate) {
        self.characterUseCase = characterUseCase
        self.delegate = delegate
        loadPage(page: currentPage + 1)
    }
    
    private func loadPage(page: Int) {
        Task {
            viewState = .loading
            let response = await characterUseCase.invoke(page: page)
            
            switch(response) {
            case .success(let fetchedCharacters):
                characterList = fetchedCharacters
                currentPage = page
                viewState = .success
            case .failure(let error):
                viewState = .error(error)
            }
        }
    }
}

// MARK: View Events
extension CharacterListViewModel {
    
    func didSelectItem() {
        
    }
}
