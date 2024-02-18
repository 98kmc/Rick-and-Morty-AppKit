//
//  MainWindowController.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 10/02/2024.
//

import AppKit

protocol MainWindowControllerDelegate {
    
    func finishApp()
}

final class MainWindowController: NSWindowController, NSWindowDelegate {

    var coordinator: MainWindowControllerDelegate!
    
    convenience init() {
        self.init(windowNibName: "")
    }
    
    override func loadWindow() {
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 800, height: 700),
            styleMask: [.miniaturizable, .closable, .resizable, .titled],
            backing: .buffered, defer: false)
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
        
        window?.minSize = NSSize(width: 900, height: 700)
        window?.title = "Rick & Morty App"
        window?.delegate = self
        window?.setFrame(NSRect(x: 0, y: 0, width: 1100, height: 700), display: true)
        window?.center()
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    
    func windowWillClose(_ notification: Notification) {
        coordinator.finishApp()
    }
}
