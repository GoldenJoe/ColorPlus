//
//  Color+Components.swift
//  
//
//  Created by Joseph Falcone on 5/22/22.
//

import Foundation

public extension PColor
{
    internal var colorComponent : PColor {
        #if os(iOS)
        return self
        #elseif os(macOS)
        // will return 'self' if already RGB
        guard let cc = usingColorSpace(.extendedSRGB) else {
            preconditionFailure("Somehow failed to generate a color in space .extendedSRGB")
        }
        return cc
        #endif
    }
    
    var sRGBAComponents : RGBA
    {
        var r,g,b,a:CGFloat; r=0;g=0;b=0;a=0;
        colorComponent.getRed(&r, green: &g, blue: &b, alpha: &a)
        return RGBA(Double(r), Double(g), Double(b), Double(a))
    }
    
    var hsbaComponents: HSBA
    {
        var h,s,b,a:CGFloat; h=0;s=0;b=0;a=0;
        colorComponent.getHue(&h, saturation: &s, brightness: &b, alpha: &a)
        return HSBA(Double(h), Double(s), Double(b), Double(a))
    }
}

import SwiftUI
@available(iOS 14.0, macOS 11.0, *)
extension Color
{
    var sRGBAComponents : RGBA {
        return PColor(self).sRGBAComponents
    }
    
    var hsbaComponents: HSBA {
        return PColor(self).hsbaComponents
    }
}
