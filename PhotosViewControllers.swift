//
//  PhotosViewControllers.swift
//  
//
//  Created by Mac on 6/24/1397 AP.
//

import UIKit
import AlamofireImage
class PhotosViewControllers: UIViewController ,UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tvPhoto: UITableView!
    var urlString = ""
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCellTableViewCell", for: indexPath) as! PhotoCellTableViewCell
        let post = posts[indexPath.row]
        
        if let photos = post["photos"] as? [[String: Any]] {
            // photos is NOT nil, we can use it!
            // 1.
            let photo = photos[0]
            // 2.
            let originalSize = photo["original_size"] as! [String: Any]
            // 3.
                urlString = originalSize["url"] as! String
            // 4.
            let url = URL(string: urlString)
            // TODO: Get the photo url
            cell.photoImageView.af_setImage(withURL: url!)
        }
        
        return cell
    }
    
    
    var posts: [[String: Any]] = []

    override func viewDidLoad() {
//        imageView.image = image
        super.viewDidLoad()
        tvPhoto.delegate = self
        tvPhoto.dataSource = self
        tvPhoto.rowHeight = 150
        tvPhoto.estimatedRowHeight = 200

        // Do any additional setup after loading the view.
        let url = URL(string: "https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV")!
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        session.configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data,
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                print(dataDictionary)
                
                // TODO: Get the posts and store in posts property
                // Get the dictionary from the response key
                let responseDictionary = dataDictionary["response"] as! [String: Any]
                // Store the returned array of dictionaries in our posts property
                self.posts = responseDictionary["posts"] as! [[String: Any]]
                
                // TODO: Reload the table view
                self.tvPhoto.reloadData()
                
            }
        }
        task.resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        let vc = segue.destination as! PhotoDetailsViewController
        if let indexpath = tvPhoto.indexPath(for: cell){
            var post = posts[indexpath.row]
            if let photos = post["photos"] as? [[String: Any]]{
                let photo = photos[0]
                let originalSize = photo["original_size"] as! [String: Any]
                urlString = originalSize["url"] as! String
                vc.imageURlS = urlString
            }
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
