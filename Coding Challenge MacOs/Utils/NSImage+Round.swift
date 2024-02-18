//
//  NSImage+Round.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 17/02/2024.
//

import AppKit

@IBDesignable extension NSImageView {
    
    @IBInspectable var round: Bool {
        set {
            if newValue {
                wantsLayer = true
                layer?.masksToBounds = false
                layer?.cornerRadius = frame.height / 4
                clipsToBounds = true
            }
        }
        get {
            return self.round
        }
    }

}
