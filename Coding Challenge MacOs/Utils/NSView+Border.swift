//
//  View+Border.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 17/02/2024.
//

import AppKit

@IBDesignable extension NSView {

    @IBInspectable var borderColor: NSColor? {
        set {
            wantsLayer = true
            layer?.borderColor = newValue?.cgColor
        }
        get {
            guard let color = layer?.borderColor else {
                return nil
            }
            return NSColor(cgColor: color)
        }
    }

    @IBInspectable var borderWidth: CGFloat {
        set {
            wantsLayer = true
            layer?.borderWidth = newValue
        }
        get {
            return layer?.borderWidth ?? 0
        }
    }
}
