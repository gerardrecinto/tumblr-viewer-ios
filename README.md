# Tumblr Photo Viewer

![Swift](https://img.shields.io/badge/Swift-3%2B-F05138?logo=swift&logoColor=white)
![iOS 9+](https://img.shields.io/badge/iOS-9%2B-000000?logo=apple&logoColor=white)
![UIKit](https://img.shields.io/badge/UIKit-Auto%20Layout-blue)
![Tumblr API](https://img.shields.io/badge/API-Tumblr%20v2-35465D)

![Demo](docs/assets/demo2.gif)

iOS photo viewer that pulls image posts from the Tumblr API and presents them in a scrollable feed with full-screen detail.

## Features

- Scrollable feed of Tumblr photo posts
- Tap any image to view it full-screen
- Auto Layout for consistent layout across device sizes

## Tech Stack

| Layer | Technology |
|---|---|
| Language | Swift |
| UI | UIKit, Auto Layout |
| Networking | Tumblr API v2 |
| Dependencies | CocoaPods |

## Setup

```bash
git clone https://github.com/gerardrecinto/tumblr-viewer-ios.git
cd tumblr-viewer-ios
pod install
open Tumblr.xcworkspace
```

Add your Tumblr API key before building.
