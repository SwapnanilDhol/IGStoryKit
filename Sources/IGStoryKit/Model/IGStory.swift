/*****************************************************************************
 * IGStory.swift
 * IGStoryKit
 *****************************************************************************
 * Copyright (c) 2020 Swapnanil Dhol. All rights reserved.
 *
 * Authors: Swapnanil Dhol <swapnanildhol # gmail.com>
 *
 * Refer to the COPYING file of the official project for license.
 *****************************************************************************/

import UIKit

/// An Instagram Story Item
public struct IGStory {
    let contentSticker: UIImage?
    let background: Background

    /// Public Initializer of an IGStory object
    /// - Parameters:
    ///   - contentSticker: UIImage of the Content Sticker to be shared.
    ///   - background: A enum defining the background type of the story
    public init(contentSticker: UIImage?, background: Background) {
        self.contentSticker = contentSticker
        self.background = background
    }
}
