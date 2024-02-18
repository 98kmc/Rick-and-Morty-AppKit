//
//  CharacterItemCell.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 17/02/2024.
//

import Cocoa

class CharacterItemCell: NSCollectionViewItem, ImageLoader {

    @IBOutlet weak var characterNSImageView: NSImageView!
    @IBOutlet weak var characterNameTextField: NSTextField!
    @IBOutlet weak var characterOriginTextField: NSTextField!
    
    static var reuseIdentifier = NSUserInterfaceItemIdentifier("CharacterItemCell")
    
    override func viewWillAppear() {
        setUpBorder()
    }
    
    func render(imageUrl: String, characterName: String, characterOrigin: String) {
        characterNameTextField.stringValue = characterName
        characterOriginTextField.stringValue = "from: \(characterOrigin)"
        
        Task {
            let image = try? await fetchImage(imageURL: imageUrl)
            
            await MainActor.run {
                characterNSImageView.image = image
            }
        }
    }
    
    private func setUpBorder() {
        view.wantsLayer = true
        view.layer?.borderWidth = 4
        view.layer?.borderColor = NSColor(named: "RMPaletteGreen")?.cgColor
        view.layer?.cornerRadius = 15
    }
}
