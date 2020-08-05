//
//  EmojiArtView.swift
//  EmojiArt
//
//  Created by Sophia_fez on 2020/8/5.
//  Copyright © 2020 Sophia_fez. All rights reserved.
//

import UIKit

class EmojiArtView: UIView {
    
    var backgroundImage: UIImage? { didSet { setNeedsDisplay() } }

    override func draw(_ rect: CGRect) {
        backgroundImage?.draw(in: bounds)
    }


}
