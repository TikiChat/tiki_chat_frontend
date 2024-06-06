import UIKit
import Flutter
import NaverThirdPartyLogin

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

 override func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {

         // AppDelegate.swift 내에서 kakao_flutter_sdk, flutter_naver_login 같은 override 함수에서 참조하고 있는 문제 충돌 존재
         // 안드로이드는 앱 위에 서드파티를 오픈하는데 IOS는 앱을 벗어나서 써드파티가 호출되고
         // 앱으로 다시 돌아오면서 SDK 내부 또는 버튼안에 딥링크를 통해서 통신을 하다보니 발생되는 이슈

         // -> 네이버 로그인에는 URL 스킴으로 thirdPartyLoginResult 라는 스트링이 포함되어 아래와 같이 예외처리
         if url.absoluteString.hasPrefix("kakao"){
            super.application(app, open:url, options: options)
            return true
         } else if url.absoluteString.contains("thirdPartyLoginResult") {
            NaverThirdPartyLoginConnection.getSharedInstance().application(app, open: url, options: options)
            return true
         } else {
            return true
         }
     }
}
