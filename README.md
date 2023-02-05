<p align="center">
  <img src="https://raw.githubusercontent.com/SwapnanilDhol/IGStoryKit/main/Resources/IGStoryKitCover.png" width=600 />
</p>

## Overview
`IGStoryKit` lets you easily share content stickers with different background types to Instagram stories from your iOS and iPadOS apps.

## Installation 
`IGStoryKit` is available via [Swift Package Manager](https://swift.org/package-manager/). To add `IGStoryKit` simply add this repo’s URL to your project’s package file. 

```
https://github.com/SwapnanilDhol/IGStoryKit
```

## Usage 
A simple setup is mentioned below.

> Please ensure that you’ve created a `LSApplicationQueriesSchemes` entry in your project’s Info.plist file and added an `instagram-stories` entry. Without this your project will not be able to copy data into Instagram stories and this framework will thrown an assertion failure during debug runtime. 

#### Import IGStoryKit
```swift
import IGStoryKit
```

#### Create an `IGStory` object
```swift
let story = IGStory(contentSticker: myImage, background: .color(.systemOrange))
```

Next, create an instance of `IGDispatcher` and initialize it with the `story` object created above.

#### Create an instance of  `IGDispatcher`
```swift 
let dispatcher = IGDispatcher(story: story)
```

#### Start the posting flow by called start() on the dispatcher
```swift
dispatcher.start()
```

## Recommend values 
Instagram suggests particular sizes for images shared to Instagram stories on their [developer site](https://developers.facebook.com/docs/instagram/sharing-to-stories/). 

| Asset            | Preferred Size          | For BackgroundType               |
|------------------|-------------------------|----------------------------------|
| Content Sticker  | 640x480                 | `.none`, `.color`, `.gradient`, `.image` |
| Background Image | 720x1080 (9:16 or 9:18) | `.image`                           |

## Understanding how IGKit works 
### IGData 
`IGData` is a Swift object that defines the data being shared to Instagram stories. It contains the following parameters:

* `background`: Defines the `Background` of the story. `Background` is discussed in detail below.

* `contentSticker`: Defines a content sticker image property. This sticker can be customized by the user in the Instagram app.

### Background
`Background` is an enum that describes the background type of the Instagram Story. It can be of 4 pre defined types: 

* `.none`: No background. This mode requires that the user shares a sticker image content.


* `.color(color: .systemOrange)`: A solid color background. User provides a `UIColor` value as part of the associated valuesof this enum case and the `IGDispatcher` class creates a Instagram story with a solid background color. For this case the user may or may not provide a sticker content image. In case the user doesn’t provide a sticker content image `IGDispatcher` will only create a story with a solid color background.

* `.gradient(colorTop: .systemOrange, colorBottom: .systemRed)`: A linear gradient background. User provides two `UIColor` into `colorTop` and `colorBottom` as part of the associated values of this enum case. The `IGDispatcher` class then creates an Instagram story with a linear gradient background. For this case, the user may or may not provide a sticker content image. In case the user doesn’t provide a sticker content image `IGDispatcher` will only create a story with a linear gradient background.

* `.image(image: backgroundImage)`: An image background. User provides an `UIImage` as part of the associated value of this enum case. The `IGDispatcher` class then creates an Instagram story with an image background. For this case, the user may or may not provide a sticker content image. In case the user doesn’t provide a sticker content image `IGDispatcher` will only create a story with an image background.

<p align="center">
  <img src="https://raw.githubusercontent.com/SwapnanilDhol/IGStoryKit/main/Resources/ig-story-kit-bg-type.png" width=600 />
</p>

## Like the framework?
If you like `IGStoryKit` please consider buying me a coffee 🥰

<a href="https://www.buymeacoffee.com/swapnanildhol"><img src="https://img.buymeacoffee.com/button-api/?text=Buy me a coffee&emoji=&slug=swapnanildhol&button_colour=5F7FFF&font_colour=ffffff&font_family=Cookie&outline_colour=000000&coffee_colour=FFDD00"></a>

## Contributions 
Contributions are always welcome. Please follow the following convention if you’re contributing:
* NameOfFile: Changes Made 
* One commit per feature 
* For issue fixes: #IssueNumber NameOfFile: ChangesMade

## License
This project is licensed under the MIT License - see the  [LICENSE](https://github.com/SwapnanilDhol/IGStoryKit/blob/main/Resources/LICENSE.md)  file for details

## Apps using IGStoryKit 
* [Neon: Color Picker & Social](https://apps.apple.com/us/app/neon-real-time-color-picker/id1480273650?ls=1)
* [Sticker Card](https://apps.apple.com/us/app/sticker-cards/id1522226018)
* [LinkSum](https://apps.apple.com/in/app/linksum/id1500146123)

If you’re using IGStoryKit in your app please open a PR to edit this Readme. I’ll be happy to include you in this list :D 
