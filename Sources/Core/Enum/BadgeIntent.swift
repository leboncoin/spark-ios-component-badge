//
//  BadgeIntent.swift
//  SparkComponentBadge
//
//  Created by robin.lemaire on 09/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

/// The various intent color a badge may have.
public enum BadgeIntent: CaseIterable {
    case accent
    case basic
    case alert
    case danger
    case info
    case neutral
    case main
    case support
    case success

    // MARK: - Properties

    /// The default case. Equals to **.basic**.
    static var `default`: Self = .basic
}
