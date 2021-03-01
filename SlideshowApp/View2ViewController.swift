//
//  View2ViewController.swift
//  SlideshowApp
//
//  Created by 村中隆史 on 2021/03/01.
//

import UIKit

class View2ViewController: UIViewController {

    @IBOutlet var SecondView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(SecondView.widthAnchor)
        print(SecondView.heightAnchor)
        // Do any additional setup after loading the view.
    }
    
    func imageNo(imageNo){
        
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
