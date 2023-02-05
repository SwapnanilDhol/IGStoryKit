/*****************************************************************************
 * Background.swift
 * IGStoryKit
 *****************************************************************************
 * Copyright (c) 2020 Swapnanil Dhol. All rights reserved.
 *
 * Authors: Swapnanil Dhol <swapnanildhol # gmail.com>
 *
 * Refer to the COPYING file of the official project for license.
 *****************************************************************************/

import UIKit

/// The background type you'd like for your story
public enum Background {
    /// Post the content sitcker with no background
    case none
    /// Add a solid color background
    case color(color: UIColor)
    /// Add a linear gradient (top to bottom) background
    case gradient(colorTop: UIColor, colorBottom: UIColor)
    /// Add an image as a background
    case image(image: UIImage)
}
