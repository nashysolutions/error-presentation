# Error Presentation

A lightweight Swift package for defining **clean, user-friendly, localised error messages**.

This package introduces a single, purposeful protocol — `LocalizedCustomerFacingError` — to help you avoid leaking internal details into your user interface, while still supporting developer-friendly logging and diagnostics.

> This package requires Swift 5.7 or later, and is tested with Swift 5.7 through 6.1.

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fnashysolutions%2Ferror-presentation%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/nashysolutions/error-presentation)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fnashysolutions%2Ferror-presentation%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/nashysolutions/error-presentation)

---

## Usage

```swift
enum LoginError: LocalizedCustomerFacingError {
    case invalidPassword

    var userFriendlyLocalizedDescription: String {
        String(localized: "login.invalidPassword", defaultValue: "Your password is incorrect.")
    }
}
```

Use in SwiftUI

```swift
.alert(item: $error) { error in
    Alert(title: Text(error.localizedDescription))
}
```

And log developer-friendly details separately:

```swift
extension LoginError: CustomDebugStringConvertible {
    var debugDescription: String {
        "LoginError.invalidPassword: Password did not match server response"
    }
}

logger.debug("Login failed: \(error)")
```
