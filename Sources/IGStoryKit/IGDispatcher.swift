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

public final class IGDispatcher {

    private var igData: IGData?
    private let storyURL = IGStoryDomains.storyURL.description

    public init(igData: IGData) {
        self.igData = igData
    }

    public func start() {
        shareBackgroundImage(igData: self.igData)
    }

    private func shareBackgroundImage(igData: IGData?) {

        guard let igData = igData else {
            assertionFailure("Instagram Dispatcher: No Data Provided")
            return
        }
        guard let contentSticker = igData.contentSticker else {
            assertionFailure("Instagram Dispatcher: Content Sticker Not found")
            return
        }

        switch igData.backgroundType {

        case .none:
            if let stickerData = contentSticker.pngData() {
                postOnlyStickerToInstagram(stickerData: stickerData)
            }

        case .color:

            guard var hexTop = igData.colorTop?.toHex else { return }

            if !hexTop.contains("#") { hexTop = "#" + hexTop }
            if let stickerData = contentSticker.pngData() {
                postToInstagramWithColors(hexTop: hexTop,
                                          hexBottom: hexTop,
                                          stickerData: stickerData)
            }

        case .gradient:

            guard var hexTop = igData.colorTop?.toHex,
                  var hexBottom = igData.colorBottom?.toHex else { return }

            if !hexTop.contains("#") { hexTop = "#" + hexTop }
            if !hexBottom.contains("#") { hexBottom = "#" + hexBottom }
            if let stickerData = contentSticker.pngData() {
                postToInstagramWithColors(hexTop: hexTop,
                                          hexBottom: hexBottom,
                                          stickerData: stickerData)
            }

        case .image:

            guard let backgroundImage = igData.backgroundImage else { return }

            if let stickerData = contentSticker.pngData(),
               let backgroundImageData = backgroundImage.pngData() {
                postToInstagramWithImageBackground(backgroundImage: backgroundImageData,
                                                   stickerData: stickerData)
            }
        }
    }

    /// Post only Sticker to Instagram. No Background Included
    /// - Parameter stickerData: Image Data for Sticker
    private func postOnlyStickerToInstagram(stickerData: Data) {
        guard let urlScheme = URL(string: storyURL),
              UIApplication.shared.canOpenURL(urlScheme) else {
            assertionFailure("Instagram Dispatcher: Unable to open Instagram. Please check if the app is installed on this device and the Info.plist file contains a LSApplicationQueriesSchemes key with instagram-stories as one of its entries.")
            return
        }

        let pasteBoardItems =
            [[
              IGStoryDomains.stickerImage.description: stickerData
            ]]

        let pasteboardOptions: [UIPasteboard.OptionsKey: Any] = [.expirationDate: Date().addingTimeInterval(60 * 5)]
        UIPasteboard.general.setItems(pasteBoardItems,
                                      options: pasteboardOptions)
        UIApplication.shared.open(urlScheme)
    }

    /// Post Sticker Along with a Solid Color / Gradient as the background
    /// - Parameters:
    ///   - hexTop: The Color Hex of the top color
    ///   - hexBottom: The Color Hex of the bottom color
    ///   - stickerData: Image data for sticker
    private func postToInstagramWithColors (hexTop: String,
                                            hexBottom: String,
                                            stickerData: Data) {

        guard let urlScheme = URL(string: storyURL),
              UIApplication.shared.canOpenURL(urlScheme) else {
            assertionFailure("Instagram Dispatcher: Unable to open Instagram. Please check if the app is installed on this device and the Info.plist file contains a LSApplicationQueriesSchemes key with instagram-stories as one of its entries.")
            return
        }

        let pasteBoardItems =
            [[
                IGStoryDomains.topColor.description: hexTop,
                IGStoryDomains.bottomColor.description: hexBottom,
                IGStoryDomains.stickerImage.description: stickerData
            ]]

        let pasteboardOptions: [UIPasteboard.OptionsKey: Any] = [.expirationDate: Date().addingTimeInterval(60 * 5)]
        UIPasteboard.general.setItems(pasteBoardItems,
                                      options: pasteboardOptions)
        UIApplication.shared.open(urlScheme)
    }

    /// Post Sticker along with a Image as the background
    /// - Parameters:
    ///   - backgroundImage: Image that goes behind the sticker
    ///   - stickerData: Image data for sticker
    private func postToInstagramWithImageBackground (backgroundImage: Data,
                                                     stickerData: Data) {
        guard let urlScheme = URL(string: storyURL),
              UIApplication.shared.canOpenURL(urlScheme) else {
            assertionFailure("Instagram Dispatcher: Unable to open Instagram. Please check if the app is installed on this device and the Info.plist file contains a LSApplicationQueriesSchemes key with instagram-stories as one of its entries.")
            return
        }

        let pasteBoardItems =
            [[
                IGStoryDomains.backgroundImage.description : backgroundImage,
                IGStoryDomains.stickerImage.description : stickerData
            ]]
        let pasteboardOptions: [UIPasteboard.OptionsKey: Any] = [.expirationDate: Date().addingTimeInterval(60 * 5)]
        UIPasteboard.general.setItems(pasteBoardItems, options: pasteboardOptions)
        UIApplication.shared.open(urlScheme)
    }
}
