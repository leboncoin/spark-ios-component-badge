//
//  BadgeSizeDependentAttributes.swift
//  SparkBadge
//
//  Created by michael.zimmermann on 03.08.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SparkTheming
import SwiftUI

struct BadgeSizeDependentAttributes: Equatable {

    let offset: EdgeInsets
    let height: CGFloat
    let font: TypographyFontToken

    static func == (lhs: BadgeSizeDependentAttributes, rhs: BadgeSizeDependentAttributes) -> Bool {
        return lhs.offset == rhs.offset &&
        lhs.height == rhs.height &&
        lhs.font.font == rhs.font.font &&
        lhs.font.uiFont == rhs.font.uiFont
    }
}
