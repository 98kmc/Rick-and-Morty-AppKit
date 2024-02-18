//
//  View+CornerRadius.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 17/02/2024.
//

import AppKit

@IBDesignable extension NSView {
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            wantsLayer = true
            layer?.cornerRadius = newValue
            clipsToBounds = newValue > 0
        }
        get {
            return layer?.cornerRadius ?? 0
        }
    }
}
