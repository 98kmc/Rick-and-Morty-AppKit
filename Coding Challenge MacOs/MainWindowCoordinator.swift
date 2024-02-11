//
//  MainWindowCoordinator.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 10/02/2024.
//

import AppKit

final class MainWindowCoordinator<R: AppRouter>: Coordinator {
    
    private let router: R
    private lazy var windowController = MainWindowController()
    private lazy var windowController2 = MainWindowController()
    
    init(router: R) {
        self.router = router
    }

    func start() {
        let vc = CharacterListViewController()
        windowController.contentViewController = vc
        windowController.showWindow(self)
        windowController.coordinator = self
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            
//            let vc = ViewController()
//            self.windowController2.contentViewController = vc
//            self.windowController2.showWindow(self)
//        }
    }
}

extension MainWindowCoordinator: MainWindowControllerDelegate {
    
    func finishApp() {
        router.exit()
    }
}
