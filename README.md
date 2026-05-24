# Tumblr Photo Viewer

![Swift](https://img.shields.io/badge/Swift-6.0-F05138?logo=swift&logoColor=white)
![iOS 16+](https://img.shields.io/badge/iOS-16%2B-000000?logo=apple&logoColor=white)
![UIKit](https://img.shields.io/badge/UIKit-Auto%20Layout-blue)
![Tumblr API](https://img.shields.io/badge/API-Tumblr%20v2-35465D)

![Demo](docs/assets/demo2.gif)

> iOS photo viewer that fetches image posts from the Tumblr v2 API, displays them in a scrollable `UITableView` feed with async image loading via `UIImageView+URLSession (native)| Layer | Technology |
|---|---|
| Language | Swift 6.0 |
| UI | UIKit, UITableView, UITableViewAutomaticDimension, Auto Layout |
| Networking | URLSession (data tasks) |
| Image Loading | `UIImageView+URLSession (native)|
| API | Tumblr v2 REST API (`/posts/photo`) |
| Dependencies | CocoaPods — URLSession (native)|

## Architecture

`PhotosViewController` owns `posts: [NSDictionary]` and acts as both `UITableViewDataSource` and `UITableViewDelegate`. It fetches on `viewDidLoad` and reloads the table on the main queue via `OperationQueue.main`. `PhotoDetailsViewController` receives only the image URL string from `prepare(for:sender:)`.

## Key Implementation

**`value(forKeyPath:)` for nested JSON:** `value(forKeyPath: "photos.0.original_size.url")` traverses the Tumblr post structure four levels deep in one call, avoiding three consecutive `as? NSDictionary` casts.

**Image cache:** `UIImageView+URLSession (native)