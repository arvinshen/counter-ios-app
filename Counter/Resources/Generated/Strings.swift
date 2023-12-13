// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Select an item
  internal static let selectAnItem = L10n.tr("Select an item", fallback: "Select an item")
  internal enum Common {
    internal enum Controls {
      internal enum Actions {
        /// Save
        internal static let save = L10n.tr("Common.Controls.Actions.Save", fallback: "Save")
      }
    }
  }
  internal enum Counter {
    /// Counter
    internal static let title = L10n.tr("Counter.Title", fallback: "Counter")
    internal enum Add {
      internal enum Input {
        internal enum Goal {
          /// 100
          internal static let placeholder = L10n.tr("Counter.Add.Input.Goal.Placeholder", fallback: "100")
          /// Goal
          internal static let text = L10n.tr("Counter.Add.Input.Goal.Text", fallback: "Goal")
        }
        internal enum Name {
          /// John Doe
          internal static let placeholder = L10n.tr("Counter.Add.Input.Name.Placeholder", fallback: "John Doe")
          /// Name
          internal static let text = L10n.tr("Counter.Add.Input.Name.Text", fallback: "Name")
        }
        internal enum Reset {
          /// 0
          internal static let placeholder = L10n.tr("Counter.Add.Input.Reset.Placeholder", fallback: "0")
          /// Reset
          internal static let text = L10n.tr("Counter.Add.Input.Reset.Text", fallback: "Reset")
        }
        internal enum Step {
          /// Step
          internal static let text = L10n.tr("Counter.Add.Input.Step.Text", fallback: "Step")
          /// 0
          internal static let value = L10n.tr("Counter.Add.Input.Step.Value", fallback: "0")
        }
        internal enum Value {
          /// 0
          internal static let placeholder = L10n.tr("Counter.Add.Input.Value.Placeholder", fallback: "0")
          /// Value
          internal static let text = L10n.tr("Counter.Add.Input.Value.Text", fallback: "Value")
        }
      }
    }
  }
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
