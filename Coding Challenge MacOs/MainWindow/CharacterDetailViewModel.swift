//
//  CharacterDetailViewModel.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 17/02/2024.
//

import Foundation

final class CharacterDetailViewModel {
    
    var presentedCharacterDidChange: ((DetailCharacter?) -> Void)?
    var viewStateDidChange: ((ViewState) -> Void)?
    
    private (set) var presentedCharacter: DetailCharacter? {
        didSet {
            presentedCharacterDidChange?(presentedCharacter)
        }
    }
    
    private (set) var viewState: ViewState = .success {
        didSet {
            viewStateDidChange?(viewState)
        }
    }
    
    private let getSingleCharacterUseCase: GetSingleCharacterUseCase
    
    init(useCase: GetSingleCharacterUseCase) {
        self.getSingleCharacterUseCase = useCase
    }
    
    private func loadCharacterDetails(characterId: Int) {
        Task {
            viewState = .loading(nil)
            let response = await getSingleCharacterUseCase.invoke(characterId: characterId)
            
            switch(response) {
            case .success(let character):
                presentedCharacter = character
                viewState = .success
            case .failure(let error):
                viewState = .error(error)
            }
        }
    }
}

extension CharacterDetailViewModel: CharacterListViewModelDelegate {
    
    func updateDetailView(characterId: Int?) {
        guard let characterId = characterId else {
            return
        }
        
        loadCharacterDetails(characterId: characterId)
    }
}
