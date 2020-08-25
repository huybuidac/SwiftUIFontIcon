## SwiftUIFontIcon

Font icon for SwiftUI

## Installation

The preferred way of installing SwiftUIX is via the [Swift Package Manager](https://swift.org/package-manager/).

>Xcode 11 integrates with libSwiftPM to provide support for iOS, watchOS, and tvOS platforms.

1. In Xcode, open your project and navigate to **File** → **Swift Packages** → **Add Package Dependency...**
2. Paste the repository URL (`https://github.com/huybuidac/SwiftUIFontIcon`) and click **Next**.
3. For **Rules**, select **Branch** (with branch set to `master`).
4. Click **Finish**.
5. Open the Project settings, add **SwiftUI.framework** to the **Linked Frameworks and Libraries**, set **Status** to **Optional**.

## Sample

To run the example project, using **xcode 12 beta**

## Usage

The library is very very easy to use, just something like this :)

```swift
import SwiftIconFont
...

FontIcon(.materialIcon(code: .search))
```

There are 2 more options:
- color
- fontsize

```swift
FontIcon(.materialIcon(code: .search), color: .pink, fontsize: 40)
```

![Test Image 3](/resources/demo_code.png)

## Supported fonts

Currently, SwiftUIFontIcon supports:
- Material icon
- Ionicons
- Font Awesome 5 Free
