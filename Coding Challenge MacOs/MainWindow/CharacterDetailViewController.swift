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
    
    override func viewWillAppear() {
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor(named: "RMDarkBg")?.cgColor
        loadingNSProgressBar.isHidden = true
        loadingNSProgressBar.doubleValue = 0
       // backgroundNSImage.isHidden = true
    }
    
}
