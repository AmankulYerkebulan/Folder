
import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.setUp()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
       
    }

}
extension AppDelegate {
    
    //MARK: - Setup
    
    private func setUp() {
        
        self.window = UIWindow(frame: CGRect(x: 0, y: 0, width: ScreenSize.SCREEN_WIDTH, height: ScreenSize.SCREEN_HEIGHT))
        let view = LaunchView(frame: UIScreen.main.bounds)
        window?.rootViewController = UIStoryboard(name: "LaunchScreen", bundle: nil).instantiateInitialViewController()
        window?.rootViewController?.view.addSubview(view)
        window?.rootViewController?.view.bringSubviewToFront(view)
        window?.makeKeyAndVisible()
        
        let rootVc = UINavigationController(rootViewController: AuthorizationViewController())
        rootVc.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        rootVc.navigationBar.shadowImage = UIImage()
        rootVc.navigationBar.isTranslucent = true
        rootVc.view.backgroundColor = .clear
        
        let newFont = Global.asinastraFont(size: StaticSize.s17)!
        let color = Global.whiteColor()
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UINavigationBar.classForCoder() as! UIAppearanceContainer.Type]).setTitleTextAttributes([NSAttributedString.Key.foregroundColor: color, NSAttributedString.Key.font: newFont], for: .normal)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.window?.rootViewController = rootVc
        }
        IQKeyboardManager.shared.enable = true
    }
    
}
