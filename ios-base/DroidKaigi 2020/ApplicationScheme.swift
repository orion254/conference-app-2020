//
//  ApplicationScheme.swift
//  DroidKaigi 2020
//
//  Created by 伊藤凌也 on 2020/01/17.
//

import UIKit
import MaterialComponents

final class ApplicationScheme: NSObject {

    private static var singleton = ApplicationScheme()

    static var shared: ApplicationScheme {
        return singleton
    }

    public let colorScheme: MDCColorScheming = {
        return ApplicationScheme.semanticColorScheme
    }()

    public let buttonScheme: MDCContainerScheme = {
        let scheme = MDCContainerScheme()
        scheme.colorScheme = ApplicationScheme.semanticColorScheme
        scheme.typographyScheme = ApplicationScheme._typographyScheme
        return scheme
    }()

    public let shapeScheme: MDCShapeScheming = {
        let scheme = MDCShapeScheme()
        scheme.largeComponentShape = MDCShapeCategory(cornersWith: .cut, andSize: 20)
        return scheme
    }()

    public let typographyScheme: MDCTypographyScheming = {
        return ApplicationScheme._typographyScheme
    }()

    private static let _typographyScheme: MDCTypographyScheme = {
        let scheme = MDCTypographyScheme(defaults: .material201804)
        return scheme
    }()

    private static let semanticColorScheme: MDCSemanticColorScheme = {
        let scheme = MDCSemanticColorScheme(defaults: .material201804)

        scheme.primaryColor = UIColor(hex: "041E42")
        scheme.onPrimaryColor = .white
        scheme.secondaryColor = UIColor(hex: "041E42")
        scheme.surfaceColor = UIColor(hex: "041E42")
        return scheme
    }()

}