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
  internal enum Alert {
    /// Success!
    internal static let title = L10n.tr("Localizable", "alert.title", fallback: "Success!")
    internal enum Button {
      /// OK
      internal static let title = L10n.tr("Localizable", "alert.button.title", fallback: "OK")
    }
    internal enum Message {
      /// Added to Downloads
      internal static let downloads = L10n.tr("Localizable", "alert.message.downloads", fallback: "Added to Downloads")
      /// Added to Watch Later
      internal static let watchLater = L10n.tr("Localizable", "alert.message.watchLater", fallback: "Added to Watch Later")
    }
  }
  internal enum Details {
    /// Details
    internal static let title = L10n.tr("Localizable", "details.title", fallback: "Details")
    internal enum Review {
      /// Review
      internal static let title = L10n.tr("Localizable", "details.review.title", fallback: "Review")
    }
    internal enum WatchTrailer {
      /// Watch Trailer
      internal static let title = L10n.tr("Localizable", "details.watchTrailer.title", fallback: "Watch Trailer")
    }
  }
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
  internal enum NotificationCenter {
    /// downloaded
    internal static let name = L10n.tr("Localizable", "notificationCenter.name", fallback: "downloaded")
  }
  internal enum Play {
    internal enum Download {
      /// Download
      internal static let title = L10n.tr("Localizable", "play.download.title", fallback: "Download")
    }
    internal enum WatchLater {
      /// Watch Later
      internal static let title = L10n.tr("Localizable", "play.watchLater.title", fallback: "Watch Later")
    }
  }
  internal enum Search {
    /// Search for a Movie or a Tv show
    internal static let placeHolder = L10n.tr("Localizable", "search.placeHolder", fallback: "Search for a Movie or a Tv show")
    /// Search
    internal static let title = L10n.tr("Localizable", "search.title", fallback: "Search")
  }
  internal enum Upcoming {
    /// Upcoming
    internal static let title = L10n.tr("Localizable", "upcoming.title", fallback: "Upcoming")
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
