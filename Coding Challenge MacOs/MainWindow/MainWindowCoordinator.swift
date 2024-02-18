//
//  MainWindowCoordinator.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 10/02/2024.
//

import AppKit

final class MainWindowCoordinator<R: AppRouter>: Coordinator {
    
    private let router: R
    private lazy var windowController = { MainWindowController() }()
    private lazy var allCharacterUseCase = { GetAllCharactersUseCase() }()
    
    init(router: R) {
        self.router = router
    }

    func start() {
        
        // Create characterDetail
        let characterDetailViewModel = CharacterDetailViewModel()
        
        // Create characterList
        let characterListViewModel = CharacterListViewModel(characterUseCase: allCharacterUseCase, delegate: characterDetailViewModel)
        let characterListVC = CharacterListViewController(viewModel: characterListViewModel)
        
        // Configure Main Window
        let vc = ContainerViewController(characterListVC: characterListVC)
        
        windowController.contentViewController = vc
        windowController.showWindow(self)
        windowController.coordinator = self
    }
}

extension MainWindowCoordinator: MainWindowControllerDelegate {
    
    func finishApp() {
        router.exit()
    }
}
