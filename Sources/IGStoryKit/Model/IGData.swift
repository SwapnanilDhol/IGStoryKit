/*****************************************************************************
 * IGData.swift
 * IGStoryKit
 *****************************************************************************
 * Copyright (c) 2020 Swapnanil Dhol. All rights reserved.
 *
 * Authors: Swapnanil Dhol <swapnanildhol # gmail.com>
 *
 * Refer to the COPYING file of the official project for license.
 *****************************************************************************/

import UIKit

/// Sharable data to Instagram Story
public struct IGData {
    let backgroundType: BackgroundType
    let colorTop: UIColor?
    let colorBottom: UIColor?
    let backgroundImage: UIImage?
    let contentSticker: UIImage?
    let contentURL: String

    /// Public Initializer of an IGDataObject
    /// - Parameters:
    ///   - backgroundType: A enum defining the background type of the story
    ///   - colorTop: UIColor of the top color
    ///   - colorBottom: UIColor off the bottom color. In case of a solid color, these two values will be the same.
    ///   - backgroundImage: UIImage of the background Image to be shared
    ///   - contentSticker: UIImage of the Content Sticker to be shared.
    ///   - contentURL: The deep-link of the content sticker.
    public init(backgroundType: BackgroundType,
                colorTop: UIColor?,
                colorBottom: UIColor?,
                backgroundImage: UIImage?,
                contentSticker: UIImage?,
                contentURL: String = "") {

        self.backgroundType = backgroundType
        self.colorTop = colorTop
        self.colorBottom = colorBottom
        self.backgroundImage = backgroundImage
        self.contentSticker = contentSticker
        self.contentURL = contentURL
    }
}
