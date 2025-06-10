# ``ErrorPresentation``

A protocol for defining clear, actionable, and localised error messages suitable for user-facing interfaces.

---

Swift's native `Error` and `LocalizedError` protocols often produce messages that are too technical, vague, or tied to internal implementation details. For example, users may see output like:

```
The operation couldn’t be completed. (MyApp.NetworkError error 3.)
```

This is unhelpful and potentially confusing.

The `LocalizedCustomerFacingError` protocol addresses this by requiring a single user-appropriate string: `userFriendlyLocalizedDescription`. This message is intended for alerts, UI banners, form errors, and other places where users need simple feedback — not stack traces or enum case names.

This protocol also implements `LocalizedError.errorDescription`, so it works seamlessly with system APIs like `SwiftUI.Alert`.

---

## Declaration

```swift
protocol LocalizedCustomerFacingError: LocalizedError {
    var userFriendlyLocalizedDescription: String { get }
}
```

---

## When to Use This

Use `LocalizedCustomerFacingError` in any error type that:

- Might be shown to the user in a UI component
- Should hide internal field names, enum case names, or technical reasons
- Needs to be localised into multiple languages
- Deserves a clear, purposeful message written with empathy

This is especially valuable in user authentication flows, network errors, file handling, and any domain-specific error messaging.

---

## Topics

### How to Use

- <doc:UseCases>

### Related Protocols

- ``LocalizedError``
- ``CustomDebugStringConvertible``
