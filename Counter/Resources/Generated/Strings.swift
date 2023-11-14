// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Counter %1$@ at %2$@
  internal static func counterAt(_ p1: Any, _ p2: Any) -> String {
    return L10n.tr("Counter %@ at %@", String(describing: p1), String(describing: p2), fallback: "Counter %1$@ at %2$@")
  }
  /// Counter at %@
  internal static func counterAt(_ p1: Any) -> String {
    return L10n.tr("Counter at %@", String(describing: p1), fallback: "Counter at %@")
  }
  /// Select an item
  internal static let selectAnItem = L10n.tr("Select an item", fallback: "Select an item")
  internal enum Key {
    internal enum Test {
      /// Test 1
      internal static let one = L10n.tr("Key.Test.One", fallback: "Test 1")
      /// Test 3
      internal static let three = L10n.tr("Key.Test.Three", fallback: "Test 3")
      /// Test 2
      internal static let two = L10n.tr("Key.Test.Two", fallback: "Test 2")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: nil)
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
