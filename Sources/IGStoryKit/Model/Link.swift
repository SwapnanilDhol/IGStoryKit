/*****************************************************************************
 * Link.swift
 * IGStoryKit
 *****************************************************************************
 * Copyright (c) 2022 Swapnanil Dhol. All rights reserved.
 *
 * Authors: Swapnanil Dhol <swapnanildhol # gmail.com>
 *
 * Refer to the COPYING file of the official project for license.
 *****************************************************************************/

import Foundation

enum Link {
    case storyDeepLink
    case instagramAppURL

    var url: URL {
        switch self {
        case .storyDeepLink:
            return "instagram-stories://share".asURL!
        case .instagramAppURL:
            return "https://apps.apple.com/in/app/instagram/id389801252".asURL!
        }
    }
}
