//
//  ASVideoContainer.swift
//  DouYin
//
//  Created by Sophia_fez on 2020/10/20.
//

//
//  VideoObject.swift
//  AutoPlayVideo
//
//  Created by Ashish Singh on 12/4/17.
//  Copyright © 2017 Ashish. All rights reserved.
//

import UIKit
import AVFoundation
class ASVideoContainer {
    var url: String
    var playOn: Bool {
        didSet {
            player.isMuted = ASVideoPlayerController.sharedVideoPlayer.mute
            playerItem.preferredPeakBitRate = ASVideoPlayerController.sharedVideoPlayer.preferredPeakBitRate
            if playOn && playerItem.status == .readyToPlay {
                player.play()
            }
            else{
                player.pause()
            }
        }
    }
    
    let player: AVPlayer
    let playerItem: AVPlayerItem
    
    init(player: AVPlayer, item: AVPlayerItem, url: String) {
        self.player = player
        self.playerItem = item
        self.url = url
        playOn = false
    }
}
