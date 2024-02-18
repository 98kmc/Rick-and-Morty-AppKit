//
//  CharacterDetailViewController.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 10/02/2024.
//

import Cocoa

class CharacterDetailViewController: NSViewController, ImageLoader {

    @IBOutlet private weak var loadingNSProgressBar: NSProgressIndicator!
    @IBOutlet private weak var backgroundNSImage: NSImageView!
    @IBOutlet private weak var episodesContainerView: NSView!
    
    
    @IBOutlet private weak var characterImage: NSImageView!
    @IBOutlet private weak var characterNameTextField: NSTextField!
    @IBOutlet private weak var characterGenderTextField: NSTextField!
    @IBOutlet private weak var characterOriginTextField: NSTextField!
    @IBOutlet private weak var characterSpeciesTextField: NSTextField!
    @IBOutlet private weak var characterTypeTextField: NSTextField!
    @IBOutlet private weak var characterStatusTextField: NSTextField!
    @IBOutlet private weak var characterLocationTextField: NSTextField!
    
    private let viewModel: CharacterDetailViewModel
    
    init(viewModel: CharacterDetailViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: "CharacterDetailViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        
        viewModel.presentedCharacterDidChange = { [unowned self] character in
            
            guard let character = character else { return }
            
            DispatchQueue.main.sync {
                updateViews(with: character)
            }
        }
        
        viewModel.viewStateDidChange = { state in
            
        }
    }
    
    override func viewWillAppear() {
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor(named: "RMDarkBg")?.cgColor
        loadingNSProgressBar.isHidden = true
        loadingNSProgressBar.doubleValue = 0
       // backgroundNSImage.isHidden = true
        
        episodesContainerView.wantsLayer = true
        episodesContainerView.layer?.borderWidth = 1
        episodesContainerView.layer?.borderColor = NSColor(named: "RMPaletteGreen")?.cgColor
    }
    
    
    // MARK: Private Methods
    private func updateViews(with character: DetailCharacter) {
        
        characterNameTextField.stringValue = character.name
        characterGenderTextField.stringValue = character.gender.rawValue
        characterOriginTextField.stringValue = character.origin.name
        characterSpeciesTextField.stringValue = character.species
        characterTypeTextField.stringValue = character.type
        characterStatusTextField.stringValue = character.status.rawValue
        characterLocationTextField.stringValue = character.location.name
        
        Task {
            let image = try? await fetchImage(imageURL: character.image)
            
            await MainActor.run {
                characterImage.image = image
            }
        }
    }
}
