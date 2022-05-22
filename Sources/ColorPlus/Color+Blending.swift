//
//  Color+Blending.swift
//
//  Created by Joseph Falcone on 5/20/22.
//

// Nice reference of allowed characters
// https://gist.github.com/natecook1000/c5fb2b8cd0967f53770e
infix operator ~~ : MultiplicationPrecedence
infix operator ⍺ : AdditionPrecedence // apply last
extension PColor {

    static func addColor(_ color1: PColor, with color2: PColor) -> PColor {
        var (r1, g1, b1, a1) = (CGFloat(0), CGFloat(0), CGFloat(0), CGFloat(0))
        var (r2, g2, b2, a2) = (CGFloat(0), CGFloat(0), CGFloat(0), CGFloat(0))

        color1.getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
        color2.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)

        // add the components, but don't let them go above 1.0
        return PColor(red: min(r1 + r2, 1), green: min(g1 + g2, 1), blue: min(b1 + b2, 1), alpha: (a1 + a2) / 2)
    }

    static func multiplyColor(_ color: PColor, by multiplier: CGFloat) -> PColor {
        var (r, g, b, a) = (CGFloat(0), CGFloat(0), CGFloat(0), CGFloat(0))
        color.getRed(&r, green: &g, blue: &b, alpha: &a)
        return PColor(red: r * multiplier, green: g * multiplier, blue: b * multiplier, alpha: a)
    }
    
    static func blendColor(_ color1: PColor, with color2: PColor) -> PColor {
        return color1 * 0.5 + color2 * 0.5
    }
    
    /// Add
    static func +(color1: PColor, color2: PColor) -> PColor {
        return addColor(color1, with: color2)
    }

    /// Multiply
    static func *(color: PColor, multiplier: Double) -> PColor {
        return multiplyColor(color, by: CGFloat(multiplier))
    }

    /// Blend
    static func ~~ (color1: PColor, color2: PColor) -> PColor {
        return blendColor(color1, with: color2)
    }
    
    /// Alpha
    static func ⍺ (color: PColor, alpha: CGFloat) -> PColor {
        return color.withAlphaComponent(alpha)
    }
}

import SwiftUI
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 11.0, *)
extension Color {
    static func addColor(_ color1: Color, with color2: Color) -> Color {
        return Color(PColor.addColor(PColor(color1), with: PColor(color2)))
    }
    static func multiplyColor(_ color: Color, by multiplier: CGFloat) -> Color {
        return Color(PColor.multiplyColor(PColor(color), by: multiplier))
    }
    
    static func blendColor(_ color1: Color, with color2: Color) -> Color {
        return Color(PColor.blendColor(PColor(color1), with: PColor(color2)))
    }
    
    /// Add
    static func +(color1: Color, color2: Color) -> Color {
        return addColor(color1, with: color2)
    }

    /// Multiply
    static func *(color: Color, multiplier: Double) -> Color {
        return multiplyColor(color, by: CGFloat(multiplier))
    }

    /// Blend
    static func ~~ (color1: Color, color2: Color) -> Color {
        return color1 * 0.5 + color2 * 0.5
    }
    
    /// Alpha
    static func ⍺ (color: Color, alpha: CGFloat) -> Color {
        return Color(PColor(color).withAlphaComponent(alpha))
    }
}
