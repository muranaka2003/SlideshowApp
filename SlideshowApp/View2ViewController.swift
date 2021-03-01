//
//  View2ViewController.swift
//  SlideshowApp
//
//  Created by 村中隆史 on 2021/03/01.
//

import UIKit

class View2ViewController: UIViewController {

    @IBOutlet var SecondView: UIView!
    @IBOutlet weak var View2Image: UIImageView!
    
    var receiveData: UIImageView! = nil // 受信イメージデータ
    
    override func viewDidLoad() {
        super.viewDidLoad()

        View2Image.image = receiveData!.image
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
