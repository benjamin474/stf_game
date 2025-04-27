import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

// Added a method to present the leaderboard with animation

import UIKit

extension UIViewController {
    func presentLeaderboard(withScore score: Int) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let leaderboardVC = storyboard.instantiateViewController(withIdentifier: "LeaderboardViewController") as? LeaderboardViewController else {
            return
        }

        leaderboardVC.modalPresentationStyle = .overFullScreen
        leaderboardVC.loadViewIfNeeded()
        leaderboardVC.saveScore(score)

        let animator = UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut) {
            self.present(leaderboardVC, animated: false, completion: nil)
        }
        animator.startAnimation()
    }
}
