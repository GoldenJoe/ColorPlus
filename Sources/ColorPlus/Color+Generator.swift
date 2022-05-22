//
//  Color+Generator.swift
//  
//
//  Created by Joseph Falcone on 5/21/22.
//


extension PColor {
    /// Returns the colors at points along a linear gradient made from two colors.
    static func colorsInLinerarGradient(color1: PColor, color2: PColor, stops: [Double]) -> [PColor] {
        // validate stops
        assert(stops.count >= 1, "WARNING: must provide at least one stop, defaulting to midpoint")
        for stop in stops {
            precondition((0.0...1.0).contains(stop), "ERROR: invalid stop: \(stop)")
        }
        
        return stops.map { stop in
            return (color1 * (1.0-stop)) ~~ (color2 * stop)
        }
    }
}

import SwiftUI
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 11.0, *)
public extension Color {
    func colorsInLinerarGradient(color1: Color, color2: Color, stops: [Double]) -> [Color] {
        return PColor.colorsInLinerarGradient(color1: PColor(color1), color2: PColor(color2), stops: stops).map { pc in
            return Color(pc)
        }
    }
}
