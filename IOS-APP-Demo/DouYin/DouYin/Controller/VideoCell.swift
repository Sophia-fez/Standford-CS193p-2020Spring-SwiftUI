//
//  VideoCell.swift
//  DouYin
//
//  Created by Sophia_fez on 2020/10/15.
//

import UIKit
import MarqueeLabel
import Kingfisher
import ChainableAnimations
import Lottie

class VideoCell: UITableViewCell {
    
    var addFollowAnimator: ChainableAnimator! // 关注按钮的动画
    var diskAnimator: ChainableAnimator! // 转盘的动画
    var addLikeAnimator: AnimationView! // 点赞的动画
    
    // 重复使用cell所以有些动画要清空重制
    override func prepareForReuse() {
        // 重制关注按钮的所有动画
        if addFollowAnimator != nil {
            addFollowAnimator.stop()
            
            addFollowBtn.transform = .identity
            addFollowBtn.layer.removeAllAnimations()
            
            addFollowBtn.setImage(UIImage(named: "icon_personal_add_little"), for: .normal)
        }
        
        // 重制唱盘转动动画
        if diskAnimator != nil {
            diskAnimator.stop()
            
            subDiskView.transform = .identity
            subDiskView.layer.removeAllAnimations()
        }
        
        // 重置音符散发动画
        diskView.resetViewAnimation()
        
        // TODO: 点赞按钮的状态是否重制，判断条件应该是获取服务器json数据里是否点过赞
        addLikeBtn.setImage(UIImage(named: "icon_home_like_before"), for: .normal) // 重置点赞icon为白色
        likeTapped = false // 重置点赞状态
    }
    
    // 关注动画
    @IBAction func addFollowTap(_ sender: UIButton) {
        print("关注")
        
        addFollowAnimator = ChainableAnimator(view: sender) // 将动画关联到关注按钮
        
        UIView.transition(with: sender, duration: 0.2, options: .transitionCrossDissolve) {
            sender.setImage(UIImage(named: "iconSignDone"), for: .normal)
        } completion: { (_) in
            // 关注旋转动画
            self.addFollowAnimator.rotate(angle: 360)
                .thenAfter(t: 0.6) // 旋转完再消失
                .wait(t: 0.3) // 再等待一下
                .transform(scale: 0)
                .animate(t: 0.2)
        }
    }
    
    // TODO: 点赞动画
    // VideoCell的点赞动画和CommentCell的高度重合，可以写成扩展文件然后调用函数
    // 点赞动画结束后移除动画层与剩下的icon颜色有些违和，调用lottie动画的一般是如何解决这个问题的
    // 点赞动画结束后才将动画层移除，如何应对点完赞立刻要取消点赞的情况（动画播放时间22帧此问题其实可以忽略不计）
    
    // 点赞动画
    // 点赞数变化监测
    var likeCount: Int = 0 {
        didSet {
            labelLikeNum.text = likeCount.toWantStr
        }
    }
    
    // 监测是否点赞
    var likeTapped: Bool = false {
        didSet {
            if likeTapped {
                print("点赞")
                likeCount += 1
                
                addLikeBtn.setImage(UIImage(named: "icon_home_like_after"), for: .normal)
                
                addLikeAnimator = AnimationView(name: "addLike") // 将动画关联到点赞按钮
                
                // 动画的范围，frame或者使用自动布局，这里位置不对
                addLikeAnimator.frame = CGRect(x: -addLikeBtn.center.x - 8, y: -addLikeBtn.center.y - 15, width: 106, height: 106)
                
                // 添加到父视图上
                addLikeBtn.addSubview(addLikeAnimator)
                
                addLikeAnimator.play(fromProgress: 0, toProgress: 1, loopMode: .playOnce) { (isFinished) in
                    // 播放完成后的回调闭包
                    self.addLikeAnimator.stop()
                    self.addLikeAnimator.removeFromSuperview()
                }
            } else {
                print("取消点赞")
                likeCount -= 1
                
                addLikeBtn.setImage(UIImage(named: "icon_home_like_before"), for: .normal)
            }
        }
    }

    // 点赞
    @IBAction func addLikeTap(_ sender: UIButton) {
        likeTapped.toggle()
    }
    
    // 加载数据
    var aweme : AwemeList! {
        didSet {
            // 用户名、视频描述
            labelAuthor.text = aweme.author!.nickname
            labelDesc.text = aweme.desc!
            
            // 视频封面图
            let cover = aweme.video!.cover!.urlList![0]
            let coverUrl = URL(string: cover)
            coverImageView.kf.setImage(with: coverUrl)
            
            // 标题、作者，因为类型就是MarqueeLabel所以会自己跑马灯
            labelMusic.text = aweme.music!.title! + " - " + aweme.music!.author!
            
            // 作者头像、关注
            let authorAvatar = aweme.author!.avatarThumb!.urlList![0]
            let avatarUrl = URL(string: authorAvatar)
            followBtn.kf.setImage(with: avatarUrl, for: .normal)
            
//            // 圆角化，不用一个个写，用extension统一写
//            followBtn.layer.cornerRadius = 25
//            followBtn.clipsToBounds = true
            
            // 点赞、评论、转发的数量
            likeCount = aweme.statistics!.diggCount!
            labelLikeNum.text = likeCount.toWantStr
            labelCommentNum.text = aweme.statistics!.commentCount!.description
            labelShareNum.text = aweme.statistics!.shareCount!.description
            
            // 唱盘音乐封面
            let musicCover = aweme.music!.coverThumb!.urlList![0]
            musicCoverImageView.kf.setImage(with: URL(string: musicCover)!)
            
            // 唱盘转动动画
            diskAnimator = ChainableAnimator(view: subDiskView) // 将动画关联到唱盘
            diskAnimator.rotate(angle: 180).animateWithRepeat(t: 3.5, count: 50) // 旋转并重复
            
            // 音符散发动画
            diskView.raiseAnimate(imageName: "icon_home_musicnote1", delay: 0) // raiseAnimate()写在extension里了，所有的UIView都可以用
            diskView.raiseAnimate(imageName: "icon_home_musicnote2", delay: 1) // 延迟1s散发第二个音符
            diskView.raiseAnimate(imageName: "icon_home_musicnote1", delay: 2) // 延迟2s散发第三个音符
        }
    }

    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var pauseImageView: UIImageView!
    
    @IBOutlet weak var labelAuthor: UILabel!
    @IBOutlet weak var labelDesc: UILabel!
    @IBOutlet weak var labelMusic: MarqueeLabel!
    
    
    @IBOutlet weak var followBtn: UIButton!
    @IBOutlet weak var addFollowBtn: UIButton!
    
    @IBOutlet weak var addLikeBtn: UIButton!
    @IBOutlet weak var labelLikeNum: UILabel!
    
    @IBOutlet weak var commentBtn: UIButton!
    @IBOutlet weak var labelCommentNum: UILabel!
    
    @IBOutlet weak var shareBtn: UIButton!
    @IBOutlet weak var labelShareNum: UILabel!
    
    @IBOutlet weak var diskView: UIView!
    @IBOutlet weak var subDiskView: UIView!
    @IBOutlet weak var rotateDiskView: UIImageView!
    @IBOutlet weak var musicCoverImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
