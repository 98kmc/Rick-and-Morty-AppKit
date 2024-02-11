//
//  CharacterDetailViewController.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 10/02/2024.
//

import Cocoa

class CharacterDetailViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor(named: "RMPaletteLightBlue")?.cgColor
    }
    
}
