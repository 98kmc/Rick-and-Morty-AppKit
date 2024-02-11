//
//  ContainerViewController.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 10/02/2024.
//

import Cocoa

class ContainerViewController: NSViewController {

    @IBOutlet private weak var charactersContainerView: NSView!
    @IBOutlet private weak var charactersDetailContainerView: NSView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        setUpChildViewControllers()
    }
    
    private func setUpChildViewControllers() {
        super.viewDidLoad()
        
        add(viewController: CharacterListViewController(), to: charactersContainerView)
        add(viewController: CharacterDetailViewController(), to: charactersDetailContainerView)
    }
}
