//
//  AppWindow.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 10/02/2024.
//

import Foundation

enum AppWindow {
    
    case showMainWindow
    
    func coordinatorFor<R: AppRouter>(router: R) -> Coordinator {
        switch self {
            case .showMainWindow: return MainWindowCoordinator(router: router)
        }
    }
}
