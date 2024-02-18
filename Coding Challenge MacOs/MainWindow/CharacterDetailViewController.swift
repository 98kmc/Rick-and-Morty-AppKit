//
//  CharacterDetailViewController.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 10/02/2024.
//

import Cocoa

class CharacterDetailViewController: NSViewController {

    @IBOutlet weak var loadingNSProgressBar: NSProgressIndicator!
    @IBOutlet weak var backgroundNSImage: NSImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor(named: "RMPaletteLightBlue")?.cgColor
    }
    
    override func viewWillAppear() {
        loadingNSProgressBar.isHidden = true
        loadingNSProgressBar.doubleValue = 0
    }
    
}
