# Use Cases

Learn how to use `LocalizedCustomerFacingError` to cleanly separate the messages shown to users from those written to logs, debug tools, or crash reports.

---

Swift errors often contain technical information that's useful to developers, but confusing or inappropriate for users. This protocol helps you *decouple* the two responsibilities:

- The **user** sees only the `userFriendlyLocalizedDescription`.
- The **developer** still has access to internal detail (e.g. via `debugDescription` or `CustomNSError`).

---

### In SwiftUI Alerts

Because `LocalizedCustomerFacingError` also implements `LocalizedError.errorDescription`, it can be passed directly to SwiftUI’s alert initialisers:

```swift
.alert(item: $error) { error in
    Alert(title: Text(error.localizedDescription))
}
```

If your error conforms to `LocalizedCustomerFacingError`, the alert will **not** fall back to something like:

```
"The operation couldn't be completed. (MyApp.LoginError error 1.)"
```

Instead, it will use the `userFriendlyLocalizedDescription` you’ve provided — clean, actionable, and localised.

---

### In Developer Logs

For internal diagnostics, you can conform to `CustomDebugStringConvertible`:

```swift
extension LoginError: CustomDebugStringConvertible {
    var debugDescription: String {
        switch self {
        case .invalidCredentials:
            return "LoginError.invalidCredentials: The email/password combination was rejected by the server."
        }
    }
}
```

Then use this in logging or analytics:

```swift
logger.debug("Login failed: \(error.debugDescription)")
```

---

### What If You Log the Error Without Calling `.debugDescription`?

When you interpolate an error directly, like:

```swift
logger.debug("Login failed: \(error)")
```

Swift will use the following resolution order:
1. If the error conforms to CustomStringConvertible, it uses .description
2. If the error conforms to LocalizedError, it uses .localizedDescription
3. If neither is defined, Swift falls back to printing the enum case name (e.g. invalidCredentials), which can appear raw, confusing, or untranslated in UI.

By conforming to LocalizedCustomerFacingError, you take control of what users see — ensuring clean, localised, and purposeful messages every time.

To access developer-focused details, explicitly use `.debugDescription` or `String(reflecting:)`:

```swift
logger.debug("Login failed: \(String(reflecting: error))")
```

This ensures that `CustomDebugStringConvertible` is respected and your log shows internal detail without exposing it to the UI.

---

## Best Practices

- Keep `userFriendlyLocalizedDescription` short, kind, and translatable.
- Use `debugDescription` for debugging context, not for display.
- Avoid exposing enum case names or field labels to the user.

---

## See Also

- ``LocalizedCustomerFacingError``
- ``LocalizedError``
- ``CustomDebugStringConvertible``
