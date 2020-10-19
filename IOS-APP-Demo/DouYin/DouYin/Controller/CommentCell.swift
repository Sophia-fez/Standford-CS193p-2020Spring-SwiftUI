//
//  CommentCell.swift
//  DouYin
//
//  Created by Sophia_fez on 2020/10/18.
//

import UIKit
import Kingfisher

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
    
    // 点赞数变化监测
    var likeCount: Int = 0 {
        didSet {
            diggsCountLabel.text = likeCount.toWantStr
        }
    }
    
    // 是否点赞监测
    var likeTapped: Bool = false {
        didSet {
            if likeTapped {
                likeCount += 1
            } else {
                likeCount -= 1
            }
        }
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
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
        
        commentTextLabel.attributedText = NSAttributedString(string: comment.text)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
