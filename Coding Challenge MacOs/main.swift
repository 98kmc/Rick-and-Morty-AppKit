//
//  main.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 31/01/2024.
//

import AppKit

final class App: AppRouter, Coordinator {
    
    func exit() {
        NSApplication.shared.terminate(self)
    }
    
    func start() {
        process(route: .showMainWindow)
    }
    
    func process(route: AppTransition) {
        let coordinator = route.coordinatorFor(router: self)
        coordinator.start()
    }
}

let app = NSApplication.shared
let delegate = AppDelegate()
app.delegate = delegate
app.run()
