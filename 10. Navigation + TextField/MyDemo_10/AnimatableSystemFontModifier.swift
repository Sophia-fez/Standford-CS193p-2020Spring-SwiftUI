//
//  AnimatableSystemFontModifier.swift
//
//  Created by CS193p Instructor on 4/29/20.
//  Copyright © 2020 Stanford University. All rights reserved.
//

import SwiftUI

// ViewModifer to set the font to the system font of a given size
// (and weight and design)
// Changes to the size can be animated

struct AnimatableSystemFontModifier: AnimatableModifier {
    var size: CGFloat
    var weight: Font.Weight = .regular
    var design: Font.Design = .default
    
    func body(content: Content) -> some View {
        content.font(Font.system(size: size, weight: weight, design: design))
    }
    
    var animatableData: CGFloat {
        get { size }
        set { size = newValue }
    }
}

extension View {
    func font(animatableWithSize size: CGFloat, weight: Font.Weight = .regular, design: Font.Design = .default) -> some View {
        self.modifier(AnimatableSystemFontModifier(size: size, weight: weight, design: design))
    }
}
