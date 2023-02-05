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

enum IGStoryDomain {
    case topColor
    case bottomColor
    case backgroundImage
    case stickerImage

    public var path: String {
        switch self {
        case .topColor:
            return "com.instagram.sharedSticker.backgroundTopColor"
        case .bottomColor:
            return "com.instagram.sharedSticker.backgroundBottomColor"
        case .backgroundImage:
            return "com.instagram.sharedSticker.backgroundImage"
        case .stickerImage:
            return "com.instagram.sharedSticker.stickerImage"
        }
    }
}
