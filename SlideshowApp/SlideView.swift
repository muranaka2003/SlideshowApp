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
        
        // imageAriaのタップを有効化
        self.imageAria.isUserInteractionEnabled = true
        
        // viewにタップを登録
        self.imageAria.addGestureRecognizer(tap)
        
 

        displayImage()
        // Do any additional setup after loading the view.
    }



    /// viewをタップされた時の処理
    @objc func viewTap(sender: UITapGestureRecognizer){
        // 自動再生をストップ
                PlayChange(PlaySelect: false)
        // ①storyboardのインスタンス取得
        let storyboard: UIStoryboard = self.storyboard!
        // ②遷移先ViewControllerのインスタンス取得
        let nextView = storyboard.instantiateViewController(withIdentifier: "view2") as! View2ViewController
        nextView.receiveData = imageAria
        // ③画面遷移
        self.present(nextView, animated: true, completion: nil)

    }

    
    /// 表示している画像の番号を元に画像を表示する
    func  displayImage() {

        // 画像の名前の配列
        let imageNameArray = [
            "IMG_2665.jpeg",
            "IMG_3095.jpeg",
            "IMG_3249.jpeg",
            "IMG_3303.jpeg"
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
    @IBAction func actionNextPB(_ sender: Any) {
        if PlayBool == false{           // スライド中は無効
            dispImageNo = dispImageNo + 1
            displayImage()
        }
    }

    
    // 「戻る」ボタン押下
    @IBAction func actionPrevPB(_ sender: Any) {
        if PlayBool == false{           // スライド中は無効
            dispImageNo = dispImageNo - 1
            displayImage()
        }
    }

    
    // 「再生/停止」ボタン押下
    @IBAction func PlayStopPB(_ sender: Any) {
        // 再生⇄停止 切替
        PlayChange(PlaySelect: !PlayBool)
    }

    @objc func timerCounter() {
        if PlayBool == true{
            dispImageNo = dispImageNo + 1
            displayImage()
        }
    }
    
    @IBOutlet weak var NextPB: UIButton!
    @IBOutlet weak var PrevPB: UIButton!
    @IBOutlet weak var PlayStopOutput: UIButton!
    
    // 再生⇄停止 切替
    func PlayChange(PlaySelect:Bool){
        if PlaySelect == true {
            PlayBool = true
            // 「進む」「戻る」を使用禁止
            NextPB.isEnabled = false
            PrevPB.isEnabled = false
            PlayStopOutput.setTitle("停止", for: .normal)
            PlayStopOutput.backgroundColor = UIColor.systemRed
        }else{
            PlayBool = false
            // 「進む」「戻る」を使用許可
            NextPB.isEnabled = true
            PrevPB.isEnabled = true
            PlayStopOutput.setTitle("再生", for: .normal)
            PlayStopOutput.backgroundColor = UIColor.systemBackground
        }
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
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
