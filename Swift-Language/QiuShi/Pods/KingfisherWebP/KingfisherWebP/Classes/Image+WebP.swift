//
//  Image+WebP.swift
//  Pods
//
//  Created by yeatse on 2016/10/19.
//
//

import Kingfisher
import CoreGraphics
import Foundation

#if SWIFT_PACKAGE
import KingfisherWebP_ObjC
#endif

// MARK: - Image Representation
extension KingfisherWrapper where Base: KFCrossPlatformImage {
    public func webpRepresentation() -> Data? {
        if let result = animatedWebPRepresentation() {
            return result
        }
        if let cgImage = base.cgImage {
            return WebPDataCreateWithImage(cgImage) as Data?
        }
        return nil
    }

    private func animatedWebPRepresentation() -> Data? {
        #if swift(>=4.1)
        guard let images = base.images?.compactMap({ $0.cgImage }) else {
            return nil
        }
        #else
        guard let images = base.images?.flatMap({ $0.cgImage }) else {
            return nil
        }
        #endif
        let imageInfo = [ kWebPAnimatedImageFrames: images,
                          kWebPAnimatedImageDuration: NSNumber(value: base.duration) ] as [CFString : Any]
        return WebPDataCreateWithAnimatedImageInfo(imageInfo as CFDictionary) as Data?
    }
}

// MARK: - Create image from WebP data
extension KingfisherWrapper where Base: KFCrossPlatformImage {
    public static func image(webpData: Data, scale: CGFloat, onlyFirstFrame: Bool) -> KFCrossPlatformImage? {
        let frameCount = WebPImageFrameCountGetFromData(webpData as CFData)
        if (frameCount == 0) {
            return nil
        }

        if (frameCount == 1 || onlyFirstFrame) {
            guard let cgImage = WebPImageCreateWithData(webpData as CFData) else {
                return nil
            }
            return KFCrossPlatformImage(cgImage: cgImage, scale: scale, orientation: .up)
        }

        // MARK: Animated images
        guard let animationInfo = WebPAnimatedImageInfoCreateWithData(webpData as CFData) as Dictionary? else {
            return nil
        }
        guard let cgFrames = animationInfo[kWebPAnimatedImageFrames] as? [CGImage] else {
            return nil
        }
        let uiFrames = cgFrames.map { KFCrossPlatformImage(cgImage: $0, scale: scale, orientation: .up) }

        let duration = (animationInfo[kWebPAnimatedImageDuration] as? NSNumber).flatMap { $0.doubleValue as TimeInterval } ?? 0.1 * TimeInterval(frameCount)
        return KFCrossPlatformImage.animatedImage(with: uiFrames, duration: duration)
    }
}

// MARK: - WebP Format Testing
extension Data {
    public var isWebPFormat: Bool {
        if count < 12 {
            return false
        }

        let endIndex = index(startIndex, offsetBy: 12)
        let testData = subdata(in: startIndex..<endIndex)
        guard let testString = String(data: testData, encoding: .ascii) else {
            return false
        }

        if testString.hasPrefix("RIFF") && testString.hasSuffix("WEBP") {
            return true
        } else {
            return false
        }
    }
}
