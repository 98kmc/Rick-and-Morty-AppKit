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
    
    private let characterListVC: CharacterListViewController
    private let characterDetailVC: CharacterDetailViewController
    
    init(characterListVC: CharacterListViewController, characterDetailVC: CharacterDetailViewController) {
        self.characterListVC = characterListVC
        self.characterDetailVC = characterDetailVC
        
        super.init(nibName: "ContainerViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    
        setUpChildViewControllers()
    }
    
    private func setUpChildViewControllers() {
        super.viewDidLoad()
        
        add(viewController: characterListVC, to: charactersContainerView)
        add(viewController: characterDetailVC, to: charactersDetailContainerView)
    }
}
