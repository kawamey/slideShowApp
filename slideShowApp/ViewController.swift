//
//  ViewController.swift
//  slideShowApp
//
//  Created by 川目悠貴 on 2021/04/01.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    //添字の変数指定
    var imageIndex = 0
    //配列の宣言
    //let or var 配列名 = [(値１),(値２),(値３)...]
    //格納された要素には添字が付いている
    let images = [UIImage(named: "01.jpeg"), //0
                  UIImage(named: "02.jpeg"), //1
                  UIImage(named: "03.jpeg")] //2
    
    @IBOutlet weak var nextButton: UIButton!
    @IBAction func nextImage(_ sender: Any) {
        imageIndex += 1 //ボタンを押したらimageIndexに１追加していく
        //imageIndexが2より大きくなったらimageIndexは0にする
        if imageIndex > 2 {
            imageIndex = 0
        }
        //インスタンス名.プロパティ名 = 値   *値には”配列名[添字]”で配列の要素を取り出す
        imageView.image = images[imageIndex]
    }
    
    @IBOutlet weak var backButton: UIButton!
    @IBAction func backImage(_ sender: Any) {
        imageIndex -= 1//ボタンを押したらimageIndexから１マイナスしていく
        //imageIndexが0より小さくなったらimageIndexは2にする
        if imageIndex < 0 {
            imageIndex = 2
        }
        //インスタンス名.プロパティ名 = 値   *値には”配列名[添字]”で配列の要素を取り出す
        imageView.image = images[imageIndex]
    }
    //スライドショーに使用するタイマーの宣言
    var timer: Timer?
    @objc func changeImages(){
        imageIndex += 1
        if imageIndex > 2 {
            imageIndex = 0
        }
        imageView.image = images[imageIndex]
    }
    @IBOutlet weak var startButton: UIButton!
    @IBAction func slideShowButton(_ sender: Any) {
        //再生中か停止しているかを判定
        if (timer == nil)  {
            //再生時の処理を実装
            //タイマーをセットする
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImages), userInfo: nil, repeats: true)
            //ボタンの名前を停止に変える
            startButton.setTitle("停止", for: .normal)
            //他のボタンを無効化
            nextButton.isEnabled = false
            backButton.isEnabled = false
        }else{
            //再生中か停止しているかを判定
            //停止時の処理を実装
            if self.timer != nil {
                self.timer!.invalidate()
                self.timer = nil
                //ボタンの名前を再生に変える
                startButton.setTitle("再生", for: .normal)
                //他のボタンを有効にする
                nextButton.isEnabled = true
                backButton.isEnabled = true
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = images[imageIndex]
    }
    @IBAction func exImage(_ sender: Any) {
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //        segueから遷移先のExViewControllerを取得する
        let exViewController:ExViewController = segue.destination as! ExViewController
        exViewController.image = images[imageIndex]
        //停止時の処理を実装
        if self.timer != nil {
            self.timer!.invalidate()
            self.timer = nil
            //ボタンの名前を再生に変える
            startButton.setTitle("再生", for: .normal)
            //他のボタンを有効にする
            nextButton.isEnabled = true
            backButton.isEnabled = true
        }
    }
@IBAction func unwind(_ segue: UIStoryboardSegue){
    imageView.image = images[imageIndex]
}
}

