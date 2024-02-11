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
        
        let vc = ContainerViewController()
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
