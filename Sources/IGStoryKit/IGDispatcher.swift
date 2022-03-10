/*****************************************************************************
 * IGDispatcher.swift
 * IGStoryKit
 *****************************************************************************
 * Copyright (c) 2020 Swapnanil Dhol. All rights reserved.
 *
 * Authors: Swapnanil Dhol <swapnanildhol # gmail.com>
 *
 * Refer to the COPYING file of the official project for license.
 *****************************************************************************/

import UIKit

@available(iOSApplicationExtension, unavailable)
public final class IGDispatcher {

    private let igData: IGData

    // MARK: - Init

    public init(igData: IGData) {
        self.igData = igData
    }

    // MARK: - Start

    public func start() {
        postToInstagramStories(data: igData)
    }

    // MARK: - Helper Methods

    private func postToInstagramStories(data: IGData) {
        guard UIApplication.shared.canOpenURL(Link.storyDeepLink.url) else {
            let alert = UIAlertController(
                title: "Error",
                message: "Instagram is not installed on your device. Would you like to install it?",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { _ in
                DispatchQueue.main.async {
                    UIApplication.shared.open(Link.instagramAppURL.url)
                }
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            DispatchQueue.main.async {
                UIApplication.topViewController()?.present(alert, animated: true)
            }
            return
        }

        let pasteboardItems: [[String: Any]]

        switch data.backgroundType {
        case .none:
            // Just post the sticker data
            pasteboardItems = [[
                IGStoryDomain.stickerImage.path: data.contentSticker?.pngData() ?? Data()
            ]]
        case .color:
            pasteboardItems = [[
                IGStoryDomain.stickerImage.path: data.contentSticker?.pngData() ?? Data(),
                IGStoryDomain.topColor.path: data.colorTop?.toHex ?? "",
                IGStoryDomain.bottomColor.path: data.colorTop?.toHex ?? "",
            ]]
        case .gradient:
            pasteboardItems = [[
                IGStoryDomain.stickerImage.path: data.contentSticker?.pngData() ?? Data(),
                IGStoryDomain.topColor.path: data.colorTop?.toHex ?? "",
                IGStoryDomain.bottomColor.path: data.colorBottom?.toHex ?? "",
            ]]
        case .image:
            pasteboardItems = [[
                IGStoryDomain.stickerImage.path: data.contentSticker?.pngData() ?? Data(),
                IGStoryDomain.backgroundImage.path: data.backgroundImage?.pngData() ?? Data()
            ]]
        }
        let pasteboardOptions: [UIPasteboard.OptionsKey: Any] = [.expirationDate: Date().addingTimeInterval(60 * 5)]
        UIPasteboard.general.setItems(pasteboardItems, options: pasteboardOptions)
        UIApplication.shared.open(Link.storyDeepLink.url)
    }
}
