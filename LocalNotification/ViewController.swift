//
//  ViewController.swift
//  LocalNotification
//
//  Created by 曽我滉 on 2020/11/19.
//

import UIKit

class ViewController: UIViewController {
    
    // 通知を作成
    @IBAction func setNotification(_ sender: Any) {
        // タイトル、本文、サウンド設定の保持
        let content = UNMutableNotificationContent()
        content.title = "タイトル"
        content.subtitle = "サブタイトル"
        content.body = "タップしてアプリを開いてください"
        content.sound = UNNotificationSound.default
        
        // seconds後に起動するトリガーを保持
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10,
                                                        repeats: false)
        
        // 識別子とともに通知の表示内容とトリガーをrequestに内包する
        let request = UNNotificationRequest(identifier: "Timer",
                                            content: content,
                                            trigger: trigger)
        
        // UNUserNotificationCenterにrequest
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
