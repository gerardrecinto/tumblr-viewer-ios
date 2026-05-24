# Tumblr Photo Viewer

![Swift](https://img.shields.io/badge/Swift-3%2B-F05138?logo=swift&logoColor=white)
![iOS 9+](https://img.shields.io/badge/iOS-9%2B-000000?logo=apple&logoColor=white)
![UIKit](https://img.shields.io/badge/UIKit-Auto%20Layout-blue)
![AFNetworking](https://img.shields.io/badge/Images-AFNetworking-lightgrey)
![Tumblr API](https://img.shields.io/badge/API-Tumblr%20v2-35465D)

![Demo](docs/assets/demo2.gif)

> iOS photo viewer that fetches image posts from the Tumblr v2 API, displays them in a scrollable `UITableView` feed with async image loading via `UIImageView+AFNetworking`, and presents full-screen images on cell tap.

## Features

- **Tumblr API fetch:** `URLSession.dataTask` requests the Tumblr v2 `/posts/photo` endpoint; the JSON response is parsed with `JSONSerialization.jsonObject` and the `response.posts` array drives the table
- **Async image loading:** Each `PhotoCell` calls `photoImageView.setImageWith(URL)` from `UIImageView+AFNetworking`, downloading images on a background thread and delivering them on the main queue
- **Original-size URL extraction:** Photo URLs are read with `value(forKeyPath: "photos.0.original_size.url")`, traversing the nested Tumblr JSON structure in one call
- **Full-screen detail:** Tapping a cell passes the full-resolution URL string to `PhotoDetailsViewController` via `prepare(for:sender:)`, which renders the image at full screen width
- **Dynamic cell heights:** `UITableViewAutomaticDimension` with `estimatedRowHeight` lets Auto Layout compute each cell's height from the image view's constraints

## Tech Stack

| Layer | Technology |
|---|---|
| Language | Swift 3 |
| UI | UIKit, UITableView, UITableViewAutomaticDimension, Auto Layout |
| Networking | URLSession (data tasks) |
| Image Loading | `UIImageView+AFNetworking` (`AFAutoPurgingImageCache`) |
| API | Tumblr v2 REST API (`/posts/photo`) |
| Dependencies | CocoaPods — AFNetworking |

## Architecture

`PhotosViewController` owns `posts: [NSDictionary]` and acts as both `UITableViewDataSource` and `UITableViewDelegate`. It fetches on `viewDidLoad` and reloads the table on the main queue via `OperationQueue.main`. `PhotoDetailsViewController` receives only the image URL string from `prepare(for:sender:)`.

## Key Implementation

**`value(forKeyPath:)` for nested JSON:** `value(forKeyPath: "photos.0.original_size.url")` traverses the Tumblr post structure four levels deep in one call, avoiding three consecutive `as? NSDictionary` casts.

**Image cache:** `UIImageView+AFNetworking` routes downloads through `AFImageDownloader`, deduplicating in-flight requests and storing decoded images in `AFAutoPurgingImageCache`.

## Setup

```bash
git clone https://github.com/gerardrecinto/tumblr-viewer-ios.git
cd tumblr-viewer-ios
pod install
open Tumblr.xcworkspace
```

Add your Tumblr API key to the request URL in `PhotosViewController.swift` before building.
