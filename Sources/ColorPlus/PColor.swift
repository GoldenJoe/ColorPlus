//
//  PColor.swift
//  
//
//  Created by Joseph Falcone on 5/21/22.
//

#if(os(OSX))
import AppKit
typealias PColor = NSColor
#else
import UIKit
typealias PColor = UIColor
#endif
