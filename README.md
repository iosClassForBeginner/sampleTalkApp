 
# 第12回: １時間でiPhoneアプリを作ろう
## 文字読み上げアプリ開発

  <div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/sampleTalkApp/blob/master/Assets/sample.png" /></div>
  
  当アカウントへ訪れていただき、誠にありがとうございます。第12回アプリ教室では、文字読み上げアプリを作ります。自分のペースで勉強したい、勉強前に予習したい、内容を復習したい場合、ご利用ください。
  
## アプリ教室に興味ある方、歓迎します。  
  Meetup  
  http://www.meetup.com/ios-dev-in-namba/
  
## 別途アプリ教室(有料)も開いております  
  http://learning-ios-dev.esy.es/  

## 問い合わせ
  株式会社ジーライブ
  http://geelive-inc.com  

## アプリ作成手順

#### 0, アプリ開発準備
> 0-1. Auto Layout, Size ClassesをOFFにします
<div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/sampleTalkApp/blob/master/Assets/0.gif" /></div>

#### 1, Storyboardで、アプリのデザイン
> 1-1. main.storyboardを選択し、UI部品からUItexyfield, UIbuttonを配置します。(ドラッグ&ドロップ)

> 1-2. StoryboardのUItexyfieldを、ViewController.swiftに紐づけます

> 1-3. StoryboardのUIbuttonを、ViewController.swiftに紐づけます（actionで）

#### 2, ViewController.swiftにコード記述
- 以下コードブロックを記入
  
```Swift
import UIKit
// importが必要
import AVFoundation

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var myText: UITextField!
    
    // 読み上げに必要な変数
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
```
