//
//  File.swift
//  
//
//  Created by Swapnanil Dhol on 10/03/22.
//

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
