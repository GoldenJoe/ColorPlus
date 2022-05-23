//
//  Color+Components.swift
//  
//
//  Created by Joseph Falcone on 5/22/22.
//

import Foundation

public extension PColor {
    // Courtesy Wil Shipley  https://stackoverflow.com/a/61902495/1183071
    var sRGBAComponents: (red: CGFloat , green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        #if os(iOS)
        let rgbColor = self // lolz no color conversion on iOS, but on iOS it'll respond to getRed(...) anyhow
        #elseif os(macOS)
        let rgbColor = usingColorSpace(.extendedSRGB) ?? PColor(red: 1, green: 1, blue: 1, alpha: 1) // will return 'self' if already RGB
        #endif

        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        rgbColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return (red: red, green: green, blue: blue, alpha: alpha)
    }
}

import SwiftUI
@available(iOS 14.0, macOS 11.0, *)
// courtesy Mofawaw https://stackoverflow.com/a/65529257/1183071
extension Color {
    #if canImport(UIKit)
    var asNative: UIColor { UIColor(self) }
    #elseif canImport(AppKit)
    var asNative: NSColor { NSColor(self) }
    #endif

    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        let color = asNative.usingColorSpace(.deviceRGB)!
        var t = (CGFloat(), CGFloat(), CGFloat(), CGFloat())
        color.getRed(&t.0, green: &t.1, blue: &t.2, alpha: &t.3)
        return t
    }

    var hsva: (hue: CGFloat, saturation: CGFloat, value: CGFloat, alpha: CGFloat) {
        let color = asNative.usingColorSpace(.deviceRGB)!
        var t = (CGFloat(), CGFloat(), CGFloat(), CGFloat())
        color.getHue(&t.0, saturation: &t.1, brightness: &t.2, alpha: &t.3)
        return t
    }
}
