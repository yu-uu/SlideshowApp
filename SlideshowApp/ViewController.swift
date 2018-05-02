//
//  ViewController.swift
//  SlideshowApp
//
//  Created by YUKO IMADA on 2018/04/19.
//  Copyright © 2018年 YUKO IMADA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    let imageNameArray = [
        "image1.jpg",
        "image2.jpg",
        "image3.jpg",
        "image4.jpg",
        "image5.jpg"]
    
    
    
    ///表示している画像の番号を元に画像を表示するーーーーー
    func displayImage() {
        
        
        //範囲より下を指している場合、最後の画像を表示
        if dispImageNo < 0 {
            dispImageNo = imageNameArray.count - 1
        }
        
        //範囲より上を指している場合、最初の画像を表示
        if dispImageNo > imageNameArray.count - 1 {
            dispImageNo = 0
        }
        
        //表示している画像から名前を取り出し
        let name = imageNameArray[dispImageNo]
        
        //画像を読み込み
        let image = UIImage(named: name)
        
        //Image Viewに読み込んだ画像をセット
        imageView.image = image
    }

    ///一定の間隔で処理を行うためのタイマー
    var timer: Timer?
    
    ///表示している画像の番号
    var dispImageNo = 0
    
    ///Timerによって、一定の間隔で呼び出される関数
    @objc func onTimer(timer: Timer) {
        
        //関数が呼ばれていることを確認
        print("onTimer")
        
        //表示している画像の番号を1増やす
        dispImageNo += 1
        
        //表示している画像の番号を元に画像を表示する
        displayImage()
        
    }
    
    
    ///---------------------------------------------
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let image = UIImage(named: imageNameArray[dispImageNo])
        imageView.image = image
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    ///---------------------------------------------

    
    @IBOutlet weak var Next: UIButton!
    @IBOutlet weak var Back: UIButton!
    @IBOutlet weak var StartStop: UIButton!
    
    
    //①再生・停止メゾット
    @IBAction func StartStop(_ sender: Any) {
        
        // 動作中のタイマーを1つに保つために、 timer が存在しない場合だけ、タイマーを生成して動作させる
        if self.timer == nil {
            //再生ボタンを押すとタイマー作成、始動
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(ViewController.onTimer), userInfo: nil, repeats: true)
            
            //再生 -> 停止　ボタン名変更
            StartStop.setTitle("停止", for: .normal)
            
            //「進む」「戻る」ボタン無効化
            Next.isEnabled = false
            Back.isEnabled = false
            
        } else {
            timer?.invalidate()
            timer = nil
            
            //停止 -> 再生　ボタン名変更
            StartStop.setTitle("再生", for: .normal)
            
            //「進む」「戻る」ボタン　有効
            Next.isEnabled = true
            Back.isEnabled = true
            
        }
        
    }
    
    //②進むメゾット
    @IBAction func Next(_ sender: Any) {
        
        //表示している画像の番号を1増やす
        dispImageNo += 1
        
        //表示している番号を元に画像を表示する
        displayImage()
        
    }
    
    //③戻るメゾット
    @IBAction func Back(_ sender: Any) {
        
        //表示している画像の番号を1減らす
        dispImageNo -= 1
        
        //表示している画像の番号を元に画像を表示する
        displayImage()
        
    }
    
    
    ///viewをタップした時の処理---------------------------------------------
    
    @IBAction func tapView(_ sender: Any) {
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // segueから遷移先のResultViewControllerを取得する
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        // 遷移先のResultViewControllerで宣言しているimageNameに画像を代入して渡す
        resultViewController.imageName = imageNameArray[dispImageNo]
        
        if timer != nil {
            timer?.invalidate()
            timer = nil
            //停止 -> 再生　ボタン名変更
            StartStop.setTitle("停止", for: .normal)
            //「進む」「戻る」ボタン　有効
            Next.isEnabled = true
            Back.isEnabled = true
        }
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
}



