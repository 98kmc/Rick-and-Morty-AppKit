//
//  AppDelegate.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 31/01/2024.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {

    private let app = App()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        app.start()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }
}
