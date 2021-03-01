//
//  SlideView.swift
//  SlideshowApp
//
//  Created by 村中隆史 on 2021/02/28.
//

import UIKit

class SlideView: UIViewController {
    @IBOutlet weak var imageAria: UIImageView!

    var dispImageNo = 2
    var PlayBool = false
    weak var timer: Timer!

    override func viewDidLoad() {
        super.viewDidLoad()

        
        timer = Timer.scheduledTimer(
            timeInterval: 2.0,
            target: self,
            selector: #selector(self.timerCounter),
            userInfo: nil,
            repeats: true)
        
        // タップを定義
        let tap = UITapGestureRecognizer(target: self, action: #selector(viewTap(sender:)))
        
        // viewにタップを登録
        self.view.addGestureRecognizer(tap)
        
 

        displayImage()
        // Do any additional setup after loading the view.
    }



    /// viewをタップされた時の処理
    @objc func viewTap(sender: UITapGestureRecognizer){
        print("タップされました")

        // ①storyboardのインスタンス取得
        let storyboard: UIStoryboard = self.storyboard!
 
        // ②遷移先ViewControllerのインスタンス取得
        let nextView = storyboard.instantiateViewController(withIdentifier: "view2") as! View2ViewController
 
        // ③画面遷移
        self.present(nextView, animated: true, completion: nil)

    }

    
    /// 表示している画像の番号を元に画像を表示する
    func displayImage() {

        // 画像の名前の配列
        let imageNameArray = [
            "IMG_2665",
            "IMG_3095",
            "IMG_3249",
            "IMG_3303"
        ]

        // 画像の番号が正常な範囲を指しているかチェック

        // 範囲より下を指している場合、最後の画像を表示
        if dispImageNo < 0 {
            dispImageNo = 3
        }

        // 範囲より上を指している場合、最初の画像を表示
        if dispImageNo > 3 {
            dispImageNo = 0
        }

        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]

        // 画像を読み込み
        let image = UIImage(named: name)

        // Image Viewに読み込んだ画像をセット
        imageAria.image = image
        
    }

    // 「進む」ボタン押下
    @IBAction func NextPB(_ sender: Any) {
        dispImageNo = dispImageNo + 1
        displayImage()
    }

    // 「戻る」ボタン押下
    @IBAction func PrevPB(_ sender: Any) {
        dispImageNo = dispImageNo - 1
        displayImage()
    }
    
    @IBOutlet weak var PlayStopOutput: UIButton!
    // 「再生/停止」ボタン押下
    @IBAction func PlayStopPB(_ sender: Any) {
        if PlayBool == false {
            PlayBool = true
            PlayStopOutput.backgroundColor = UIColor.systemRed
        }else{
            PlayBool = false
            PlayStopOutput.backgroundColor = UIColor.systemBackground
        }
    }

    @objc func timerCounter() {
        if PlayBool == true{
            dispImageNo = dispImageNo + 1
            displayImage()
        }
    }
    
    @IBAction func OnTap2(_ sender: UITapGestureRecognizer) {
        print("Tap")
    }
    
    @IBAction func onTapImage(_ sender: UITapGestureRecognizer) {

        // セグエを使用して画面を遷移
        performSegue(withIdentifier: "result", sender: nil)

               // ①storyboardのインスタンス取得
               let storyboard: UIStoryboard = self.storyboard!
        
               // ②遷移先ViewControllerのインスタンス取得
               let nextView = storyboard.instantiateViewController(withIdentifier: "result") as! View2ViewController
        
               // ③画面遷移
               self.present(nextView, animated: true, completion: nil)
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
