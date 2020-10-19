//
//  CommentCell.swift
//  DouYin
//
//  Created by Sophia_fez on 2020/10/18.
//

import UIKit
import Kingfisher
import Lottie

class CommentCell: UITableViewCell {
    
    // 获取评论数据后更新UI
    var comment: Comment! {
        didSet {
            setupUI()
        }
    }
    
    @IBOutlet weak var avatarBtn: UIButton!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var commentTextLabel: UILabel!
    @IBOutlet weak var createTimeLabel: UILabel!
    @IBOutlet weak var diggsCountLabel: UILabel!
    @IBOutlet weak var likeBtn: UIButton!
    
    var LikeAnimator: AnimationView! // 点赞的动画
    
    override func prepareForReuse() {
        // TODO: 点赞按钮的状态是否重制，判断条件应该是获取服务器json数据里是否点过赞
        likeBtn.setImage(UIImage(named: "icon_modern_feed_like_before_Normal"), for: .normal) // 重置点赞icon为白色
        likeTapped = false // 重置点赞状态
    }
    
    // 点赞数变化监测
    var likeCount: Int = 0 {
        didSet {
            diggsCountLabel.text = likeCount.toWantStr
        }
    }
    
    // 监测是否点赞
    var likeTapped: Bool = false {
        didSet {
            if likeTapped {
                print("点赞")
                likeCount += 1
                
                likeBtn.setImage(UIImage(named: "icon_modern_feed_like_after_Normal"), for: .normal)
                
                LikeAnimator = AnimationView(name: "addLike") // 将动画关联到点赞按钮
                
                // 动画的范围，frame或者使用自动布局，这里位置不对
                LikeAnimator.frame = CGRect(x: -likeBtn.center.x, y: -likeBtn.center.y - 8, width: 65, height: 65)
                
                // 添加到父视图上
                likeBtn.addSubview(LikeAnimator)
                
                LikeAnimator.play(fromProgress: 0, toProgress: 1, loopMode: .playOnce) { (isFinished) in
                    // 播放完成后的回调闭包
                    self.LikeAnimator.stop()
                    self.LikeAnimator.removeFromSuperview()
                }
            } else {
                print("取消点赞")
                likeCount -= 1
                
                likeBtn.setImage(UIImage(named: "icon_modern_feed_like_before_Normal"), for: .normal)
            }
        }
    }
    
    // 点赞
    @IBAction func likeBtnTap(_ sender: UIButton) {
        likeTapped.toggle()
    }
    
    func setupUI() {
        let avatarUrl = URL(string: comment.user.avatar_thumb.url_list[0])!
        
        avatarBtn.kf.setImage(with: avatarUrl, for: .normal)
        avatarBtn.layer.cornerRadius = 15
        avatarBtn.clipsToBounds = true
        userNameLabel.text = comment.user.nickname
        
        self.likeCount = comment.digg_count
        
        // json里的时间是从1970年1月1日到现在的秒数，需要转化一下
        let interval = Date().timeIntervalSince1970 - Double(exactly: comment.create_time)!
        createTimeLabel.text = interval.timeAgoDisplay()
        
        // TODO: 支持显示emoji，对emoji进行解析
        commentTextLabel.attributedText = NSAttributedString(string: comment.text)
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
