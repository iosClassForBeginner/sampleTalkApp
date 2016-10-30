//
//  ViewController.swift
//  sampleTalkApp
//
//  Created by Muneharu Onoue on 2016/10/30.
//  Copyright © 2016年 Muneharu Onoue. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var myText: UITextField!
    
    var speak:AVSpeechSynthesizer = AVSpeechSynthesizer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        myText.delegate = self
        
        // キーボードの設定
        myText.clearButtonMode = UITextFieldViewMode.always
        myText.keyboardType = UIKeyboardType.default
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // speakボタンを押した時に実行
    @IBAction func speak(_ sender: AnyObject) {

        // 音声用のコンテンツ作成
        let content = AVSpeechUtterance(string: self.myText.text ?? "")
        // 言語の設定
        content.voice = AVSpeechSynthesisVoice(language: "ja-JP")
        // 音声再生
        self.speak.speak(content)
    }
    

    // キーボードのreturnボタンが押された時に実行
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // キーボードを閉じる
        myText.resignFirstResponder()
        return true
    }

}

