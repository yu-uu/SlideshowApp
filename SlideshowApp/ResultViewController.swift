//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by YUKO IMADA on 2018/04/22.
//  Copyright © 2018年 YUKO IMADA. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var back: UIButton!
    
    //２画面のimageViewを、StoryboardでこのViewControllerにIBOutletとして接続しておく
    @IBOutlet weak var imageView: UIImageView!
    
    //受け取るためのプロパティ(変数)を宣言しておく
    var imageName =  ""
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        imageView.image = UIImage(named: imageName)

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(_ sender: Any) {
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
