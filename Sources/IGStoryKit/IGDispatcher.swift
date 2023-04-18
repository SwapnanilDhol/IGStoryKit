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

    private let story: IGStory
    private let facebookAppID: String

    // MARK: - Init
    public init(story: IGStory, facebookAppID: String) {
        self.story = story
        self.facebookAppID = facebookAppID
    }

    // MARK: - Start
    public func start() {
        postToInstagramStory(story: story)
    }

    // MARK: - Helper Methods
    private func postToInstagramStory(story: IGStory) {
        guard UIApplication.shared.canOpenURL(Link.storyDeepLink.url) else {
            let alert = UIAlertController(
                title: "Error",
                message: "Instagram is not installed on your device. Would you like to install it?",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "Yes", style: .default) { _ in
                DispatchQueue.main.async {
                    UIApplication.shared.open(Link.instagramAppURL.url)
                }
            })
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            DispatchQueue.main.async {
                UIApplication.topViewController()?.present(alert, animated: true)
            }
            return
        }

        let pasteboardItems: [[String: Any]]
        switch story.background {
        case .none:
            pasteboardItems = [[
                IGStoryDomain.stickerImage.path: story.contentSticker?.pngData() ?? Data()
            ]]
        case let .color(color):
            pasteboardItems = [[
                IGStoryDomain.stickerImage.path: story.contentSticker?.pngData() ?? Data(),
                IGStoryDomain.topColor.path: color.toHex ?? "",
                IGStoryDomain.bottomColor.path: color.toHex ?? "",
            ]]
        case let .gradient(colorTop, colorBottom):
            pasteboardItems = [[
                IGStoryDomain.stickerImage.path: story.contentSticker?.pngData() ?? Data(),
                IGStoryDomain.topColor.path: colorTop.toHex ?? "",
                IGStoryDomain.bottomColor.path: colorBottom.toHex ?? "",
            ]]
        case let .image(image):
            pasteboardItems = [[
                IGStoryDomain.stickerImage.path: story.contentSticker?.pngData() ?? Data(),
                IGStoryDomain.backgroundImage.path: image.pngData() ?? Data()
            ]]
        }

        DispatchQueue.main.async {
            let pasteboardOptions: [UIPasteboard.OptionsKey: Any] = [
                .expirationDate: Date().addingTimeInterval(60 * 5)
            ]
            UIPasteboard.general.setItems(pasteboardItems, options: pasteboardOptions)
            UIApplication.shared.open(self.createDeeplinkURL())
        }
    }

    private func createDeeplinkURL() -> URL {
        var urlComponents = URLComponents()
        urlComponents.scheme = "instagram-stories"
        urlComponents.path = "share"
        urlComponents.queryItems = [
            URLQueryItem(name: "source_application", value: facebookAppID)
        ]
        guard let url = urlComponents.url else {
            fatalError("IGDispatcher: Failed to create a Deeplink URL")
        }
        return url
    }
}
