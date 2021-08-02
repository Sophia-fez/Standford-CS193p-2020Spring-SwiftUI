//
//  CommentController.swift
//  DouYin
//
//  Created by Sophia_fez on 2020/10/18.
//

import UIKit
import NVActivityIndicatorView

class CommentController: UIViewController {

    @IBOutlet weak var commentsLabel: UILabel! // 评论数
    @IBOutlet weak var commentAreaView: UIView! // 评论区域
    @IBOutlet weak var commentTableView: UITableView!
    
    @IBOutlet weak var loadingView: NVActivityIndicatorView!
    
    var comments: [Comment] = []
    
    var totalComments = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        commentsLabel.text = totalComments.description + "条评论"
        
        loadingView.startAnimating()
        
        DouyinNetwork.getComment { (data) in
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(Comments.self, from: data as! Data)
                    OperationQueue.main.addOperation {
                        self.loadingView.stopAnimating()
                        self.comments = result.comments
                        self.commentTableView.reloadData()
                    }
                } catch {
                    debugPrint("解析错误", error)
                }
            }
            
        }
    }
    
    // 点击关闭按钮关闭评论弹窗
    @IBAction func tapClose(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    // 点击其他空白区域关闭评论弹窗
    @IBAction func tapToClose(_ sender: UITapGestureRecognizer) {
        
        // 单机手势点击时相对于评论弹窗view的位置
        let tapPoint = sender.location(in: commentAreaView)
        
        // 如果位置不位与评论view内则关闭该view,即这个view包不包含点击的这个点
        if !commentAreaView.layer.contains(tapPoint) {
            self.dismiss(animated: true)
        }
    }
}

extension CommentController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing:  CommentCell.self), for: indexPath) as! CommentCell
        
        cell.comment = comments[indexPath.row]
        
        return cell
    }
}
