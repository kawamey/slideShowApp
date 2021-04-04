//
//  ExViewController.swift
//  slideShowApp
//
//  Created by 川目悠貴 on 2021/04/04.
//

import UIKit

class ExViewController: UIViewController {
    @IBOutlet weak var exImageView: UIImageView!
    //受け取るためのプロパティの宣言
    var image : UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        exImageView.image = image
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
