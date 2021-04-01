// TimelineViewController.swift

import UIKit

class TimelineViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    var tweets: [Tweet] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // ダミーデータの生成
        let user = User(id: "1", screenName: "ktanaka117", name: "ダンボー田中", profileImageURL: "https://pbs.twimg.com/profile_images/832034247414206464/PCKoQRPD.jpg")
        let tweet = Tweet(id: "01", text: "Twitterクライアント作成なう", user: user)

        let tweets = [tweet]
        self.tweets = tweets

        // tableViewのリロード
        tableView.reloadData()
    }
}

extension TimelineViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("セルがタップされたよ！")
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension TimelineViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetTableViewCell") as! TweetTableViewCell

        // TweetTableViewCellの描画内容となるtweetを渡す
        cell.fill(tweet: tweets[indexPath.row])

        return cell
    }
}
