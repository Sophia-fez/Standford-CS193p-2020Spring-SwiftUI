//
//  ASVideoLayerObject.swift
//  DouYin
//
//  Created by Sophia_fez on 2020/10/20.
//

//
//  VideoLayerObject.swift
//  AutoPlayVideo
//
//  Created by Ashish Singh on 12/7/17.
//  Copyright © 2017 Ashish. All rights reserved.
//
import UIKit
import AVFoundation
class ASVideoLayerObject: NSObject {
    var layer = AVPlayerLayer()
    var used = false
    override init() {
        layer.backgroundColor = UIColor.clear.cgColor
        layer.videoGravity = AVLayerVideoGravity.resize
    }
}

struct VideoLayers {
    var layers = Array<ASVideoLayerObject>()
    init() {
        for _ in 0..<1{
            layers.append(ASVideoLayerObject())
        }
    }
    
    func getLayerForParentLayer(parentLayer: CALayer) -> AVPlayerLayer {
        for videoObject in layers {
            if videoObject.layer.superlayer == parentLayer {
                return videoObject.layer
            }
        }
        return getFreeVideoLayer()
    }
    
    func getFreeVideoLayer() -> AVPlayerLayer {
        for videoObject in layers {
            if videoObject.used == false {
                videoObject.used = true
                return videoObject.layer
            }
        }
        return layers[0].layer
    }
    
    func freeLayer(layerToFree: AVPlayerLayer) {
        for videoObject in layers {
            if videoObject.layer == layerToFree {
                videoObject.used = false
                videoObject.layer.player = nil
                if videoObject.layer.superlayer != nil {
                    videoObject.layer.removeFromSuperlayer()
                }
                break
            }
        }
    }
}
