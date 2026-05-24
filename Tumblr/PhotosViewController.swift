//
//  PhotosViewController.swift
//  Tumblr
//
//  Created by Gerard Recinto on 11/11/17.
//  Copyright © 2017 Gerard Recinto. All rights reserved.
//

import UIKit

@MainActor
class PhotosViewController: ViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    private var posts: [[String: Any]] = []

    private let tumblrURL = URL(string:
        "https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV"
    )!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        fetchPosts()
    }

    private func fetchPosts() {
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: tumblrURL)
                guard let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                      let response = json["response"] as? [String: Any],
                      let results = response["posts"] as? [[String: Any]] else { return }
                posts = results
                tableView.reloadData()
            } catch {
                print("Fetch error: \(error.localizedDescription)")
            }
        }
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        let post = posts[indexPath.row]
        if let photos = post["photos"] as? [[String: Any]],
           let originalSize = photos.first?["original_size"] as? [String: Any],
           let urlString = originalSize["url"] as? String,
           let url = URL(string: urlString) {
            cell.photoImageView.loadImage(from: url)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let cell = sender as? PhotoCell,
              let indexPath = tableView.indexPath(for: cell) else { return }
        let vc = segue.destination as! PhotoDetailsViewController
        vc.image = cell.photoImageView.image
    }
}
