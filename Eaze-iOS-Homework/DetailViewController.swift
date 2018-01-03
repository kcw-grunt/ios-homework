//
//  DetailViewController.swift
//  Eaze-iOS-Homework
//
//  Created by Kerry Washington on 12/23/17.
//  Copyright © 2017 kerrywashington. All rights reserved.
//

import UIKit
import Gifu

class DetailViewController: UIViewController {
    
    var largeGIPHYImageView: GIFImageView?
    var titleLabel: UILabel?
    var sizeLabel: UILabel?
    var dimsLabel: UILabel?
    var urlLabel: UILabel?
    
    var selectedObject: MyGiphySummaryObject?
    var dismissButton: UIButton?
    var activityIndicator: UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        
        // Do any additional setup after loading the view.
    }
    
    func configureViews(){
        titleLabel = UILabel()
        sizeLabel = UILabel()
        dimsLabel = UILabel()
        urlLabel = UILabel()
        
        activityIndicator = UIActivityIndicatorView()
        let layoutW = self.view.frame.width
        activityIndicator?.frame = CGRect.init(x: layoutW/2-20/2, y: layoutW/2-20/2, width: 20.0 , height: 20.0)
        activityIndicator?.startAnimating()
        if selectedObject != nil {
            let url = URL.init(string: (selectedObject?.originalUrl)!)
            largeGIPHYImageView = GIFImageView()
            largeGIPHYImageView?.animate(withGIFURL:url!)
            sizeLabel?.text = String.init(format: "File Size: %d bytes", (selectedObject?.originalFileSize)!)
            dimsLabel?.text = String.init(format: "Dims: %2.2f (W) x %2.2f (H)", (selectedObject?.originalWidth)!, (selectedObject?.originalHeight)!)
            urlLabel?.text = selectedObject?.originalUrl
            urlLabel?.numberOfLines = 2
            //urlLabel?.lineBreakMode =
            urlLabel?.adjustsFontSizeToFitWidth = true
            urlLabel?.isUserInteractionEnabled = true
        }

        largeGIPHYImageView?.frame = CGRect.init(x: 0, y: 40, width: layoutW, height: layoutW)
        largeGIPHYImageView?.contentMode = .scaleAspectFit
        self.view.addSubview(activityIndicator!)
        self.view.addSubview(largeGIPHYImageView!)
        if (largeGIPHYImageView?.isAnimating)! {
            activityIndicator?.stopAnimating()
        }
        
        dismissButton = UIButton()
        dismissButton?.frame = CGRect.init(x: 20, y: 20, width: 20, height: 20)
        dismissButton?.setImage(UIImage.init(named: "cross"), for: .normal)
        dismissButton?.addTarget(self, action: #selector(DetailViewController.dimissDetail), for: .touchUpInside)
        self.view.addSubview(dismissButton!)
        
        titleLabel?.frame = CGRect.init(x: 0, y: (largeGIPHYImageView?.frame.size.height)!+80, width: layoutW, height: 20)
        titleLabel?.text = selectedObject?.title
        titleLabel?.textColor = .white
        titleLabel?.textAlignment = .center
        titleLabel?.font = UIFont.init(name: "Arial-Bold", size: 35)
        
        
        let detailFont = UIFont.init(name: "Arial", size: 15)
        
        
        sizeLabel?.frame = CGRect.init(x: 16, y: (titleLabel?.frame.origin.y)! + (titleLabel?.frame.size.height)! + 20, width: layoutW, height: 15)
        dimsLabel?.frame = CGRect.init(x: 16, y: (sizeLabel?.frame.origin.y)! + (sizeLabel?.frame.size.height)!, width: layoutW, height: 15)
        urlLabel?.frame = CGRect.init(x: 16, y: (dimsLabel?.frame.origin.y)! + (dimsLabel?.frame.size.height)!, width: layoutW, height: 15)
        sizeLabel?.textAlignment = .left
        dimsLabel?.textAlignment = .left
        urlLabel?.textAlignment = .left
        sizeLabel?.font = detailFont
        dimsLabel?.font = detailFont
        urlLabel?.textColor = .white
        sizeLabel?.textColor = .white
        dimsLabel?.textColor = .white
        urlLabel?.textColor = .white
        
        
        
        self.view.addSubview(titleLabel!)
        self.view.addSubview(sizeLabel!)
        self.view.addSubview(dimsLabel!)
        self.view.addSubview(urlLabel!)

        
        
     }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @objc func dimissDetail(){
        self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
