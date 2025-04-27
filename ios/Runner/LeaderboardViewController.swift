import UIKit

class LeaderboardViewController: UIViewController {
    @IBOutlet weak var leaderboardTableView: UITableView!

    var scores: [Int] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        leaderboardTableView.dataSource = self
        leaderboardTableView.delegate = self
        loadScores()
    }

    func loadScores() {
        let defaults = UserDefaults.standard
        scores = defaults.array(forKey: "TopScores") as? [Int] ?? []
        scores.sort(by: >) // Sort scores in descending order
    }

    func saveScore(_ score: Int) {
        let defaults = UserDefaults.standard
        scores.append(score)
        scores.sort(by: >)
        if scores.count > 5 {
            scores = Array(scores.prefix(5)) // Keep only top 5 scores
        }
        defaults.set(scores, forKey: "TopScores")
    }

    func showGameOverAlert(withScore score: Int) {
        let alert = UIAlertController(title: "遊戲結束", message: "你得到了 \(score) 分！是否保存到排行榜？", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "保存", style: .default, handler: { _ in
            self.presentLeaderboard(withScore: score)
        }))

        alert.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))

        present(alert, animated: true, completion: nil)
    }

    @IBAction func dismissLeaderboard(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

extension LeaderboardViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scores.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScoreCell", for: indexPath)
        cell.textLabel?.text = "第 \(indexPath.row + 1) 名: \(scores[indexPath.row]) 分"
        return cell
    }
}