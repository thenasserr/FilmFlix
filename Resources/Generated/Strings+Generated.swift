// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Localizable.strings
  ///   FilmFlix
  /// 
  ///   Created by Ibrahim Nasser Ibrahim on 01/03/2024.
  internal static let home = L10n.tr("Localizable", "home", fallback: "Home")
  internal enum Home {
    internal enum Trending {
      /// Trending Movies
      internal static let movies = L10n.tr("Localizable", "home.trending.movies", fallback: "Trending Movies")
      /// Populars
      internal static let populars = L10n.tr("Localizable", "home.trending.populars", fallback: "Populars")
      /// Top Rated
      internal static let topRated = L10n.tr("Localizable", "home.trending.topRated", fallback: "Top Rated")
      /// Trending TVs
      internal static let tvs = L10n.tr("Localizable", "home.trending.tvs", fallback: "Trending TVs")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
