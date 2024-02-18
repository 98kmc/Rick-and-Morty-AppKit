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
    
    private var onSelectionChange: ((Bool) -> Void)?
    
    override var isSelected: Bool {
        didSet {
            selectionDidChange(isSelected)
            onSelectionChange?(isSelected)
        }
    }
    
    static var reuseIdentifier = NSUserInterfaceItemIdentifier("CharacterItemCell")
    
    override func viewWillAppear() {
        setUpBorder()
        characterNSImageView.layer?.borderColor = .white
        characterOriginTextField.maximumNumberOfLines = 1
    }
    
    private func setUpBorder() {
        view.wantsLayer = true
        view.layer?.borderWidth = 1
        view.layer?.borderColor = NSColor(named: "RMPaletteGreen")?.cgColor
        view.layer?.cornerRadius = 25
    }
    
    private func selectionDidChange(_ value: Bool) {
        // Change Background
        view.layer?.backgroundColor = value
        ? NSColor(named: "RMPaletteGreen")?.cgColor
        : .clear
        
        // Change Border Color
        view.layer?.borderColor = value
        ? .white
        : NSColor(named: "RMPaletteGreen")?.cgColor
        
        // Change Image Border
        characterNSImageView.layer?.borderWidth = value ? 2 : 0
    }
}

// MARK: Exposed Methods
extension CharacterItemCell {
    
    func render(imageUrl: String, characterName: String, characterOrigin: String, onSelectionChange: @escaping (Bool) -> Void) {
        characterNameTextField.stringValue = characterName
        characterOriginTextField.stringValue = "from: \(characterOrigin)"
        self.onSelectionChange = onSelectionChange
        
        Task {
            let image = try? await fetchImage(imageURL: imageUrl)
            
            await MainActor.run {
                characterNSImageView.image = image
            }
        }
    }
}
