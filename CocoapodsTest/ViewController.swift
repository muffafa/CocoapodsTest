//  ViewController.swift
//  CocoapodsTest
//
//  Created by Muhammed Mustafa Savar on 9.04.2023.
//

import UIKit
import Alamofire
import Kingfisher
import FLEX

class ViewController: UIViewController {
    
    @IBOutlet weak private var redView: UIView!
    
    @IBOutlet weak private var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // fetchDataWithUrlSession()
        // fetcDataWithAlamofire()
        
        // setConstraintsViaAutoLayout()
        // setConstraintsViaSnapKit()
        
        // setImageViaKingfisher()
        // setImageViaAlomoFire() // also look SDWebImage library
        
        // setupFlexGesture()
        
        // imageView.image = UIImage(named: "pinkRose") //normal
        imageView.image = Asset.blueRose.image // swiftgen
    }
    
    // MARK: - Alomofire
    
    func fetchDataWithUrlSession() {
        let url = URL(string: "https://stackoverflow.com/")
        let request = URLRequest(url: url!)
        
        let task = URLSession.shared.dataTask(with: request) { data, _, _ in
            guard let data = data else {
                return
            }
            print(String(data: data, encoding: .utf8)!)
        }
        
        task.resume()
    }
    
    func fetcDataWithAlamofire() {
        AF.request("https://httpbin.org/get").response { response in
            debugPrint(response)
        }
    }
    
    // MARK: - SnapKit
    
    func setConstraintsViaAutoLayout() {
        redView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            redView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            redView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            redView.heightAnchor.constraint(equalToConstant: 128.0),
            redView.widthAnchor.constraint(equalToConstant: 256.0)
        ])
    }
    
    func setConstraintsViaSnapKit() {
        redView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(128.0)
            make.width.equalTo(256.0)
        }
    }
    
    // MARK: - Kingfisher
    
    func setImageViaKingfisher() {
        imageView.kf.setImage(with: URL(string: "https://cdn.britannica.com/45/5645-050-B9EC0205/head-treasure-flower-disk-flowers-inflorescence-ray.jpg"))
    }
    
    func setImageViaAlomoFire() {
        let url = "https://cdn.britannica.com/45/5645-050-B9EC0205/head-treasure-flower-disk-flowers-inflorescence-ray.jpg"
        
        let cache = NSCache<AnyObject, AnyObject>()
        
        if let imageFromCache = cache.object(forKey: url as AnyObject) as? UIImage {
            imageView.image = imageFromCache
            return
        }

        AF.request(url, method: .get).response { response in
            switch response.result {
            case .failure(let error):
                print(error)
            case .success(let data):
                guard let data = data,
                      let image = UIImage(data: data) else {
                    return
                }
                cache.setObject(image, forKey: url as AnyObject)
                self.imageView.image = image
            }
        }
    }
    
    // MARK: - FLEX
    
    func setupFlexGesture() {
          let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didFlexGestureRecognized(_:)))
          tapGesture.numberOfTapsRequired = 2
          tapGesture.numberOfTouchesRequired = 2
          view.addGestureRecognizer(tapGesture)
      }
      
    @objc private func didFlexGestureRecognized(_ tapGesture: UITapGestureRecognizer) {
        FLEXManager.shared.showExplorer()
    }
}
