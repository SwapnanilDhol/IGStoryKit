/*****************************************************************************
 * IGStoryDomains.swift
 * IGStoryKit
 *****************************************************************************
 * Copyright (c) 2020 Swapnanil Dhol. All rights reserved.
 *
 * Authors: Swapnanil Dhol <swapnanildhol # gmail.com>
 *
 * Refer to the COPYING file of the official project for license.
 *****************************************************************************/

import Foundation

enum IGStoryDomains: CustomStringConvertible {

    case storyURL
    case topColor
    case bottomColor
    case backgroundImage
    case stickerImage
    case contentURL

    public var description: String {
        switch self {
            case .storyURL:
                return "instagram-stories://share"
            case .topColor:
                return "com.instagram.sharedSticker.backgroundTopColor"
            case .bottomColor:
                return "com.instagram.sharedSticker.backgroundBottomColor"
            case .backgroundImage:
                return "com.instagram.sharedSticker.backgroundImage"
            case .stickerImage:
                return "com.instagram.sharedSticker.stickerImage"
            case .contentURL:
                return "com.instagram.sharedSticker.contentURL"
        }
    }
}
