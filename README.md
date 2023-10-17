# CompactScrollView
ScrollView learnt to wrap its content! 😮‍💨

## Setup

Add the following to `Package.swift`:

```swift
.package(url: "https://github.com/stateman92/CompactScrollView", exact: .init(0, 0, 4))
```

[Or add the package in Xcode.](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app)

## Usage

```swift
CompactScrollView {
    Rectangle()
        .fill(.green)
        .frame(width: 100, height: toggle ? 100 : 1000)
}
```

For details see the Example app.

## Example

<p style="text-align:center;"><img src="https://github.com/stateman92/CompactScrollView/blob/main/Resources/screenrecording.gif?raw=true" width="50%" alt="Example"></p>
