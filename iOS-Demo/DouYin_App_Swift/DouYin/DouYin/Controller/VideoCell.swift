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
import AVFoundation

// 通过ASAutoPlayVideoLayerContainer协议，计算cell可见高度
class VideoCell: UITableViewCell, ASAutoPlayVideoLayerContainer {

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
    
    var addFollowAnimator: ChainableAnimator! // 关注按钮的动画
    var diskAnimator: ChainableAnimator! // 转盘的动画
    var addLikeAnimator: AnimationView! // 点赞的动画
    var tapGesture : UITapGestureRecognizer!
        
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
            
            // 标题、作者，因为类型就是MarqueeLabel所以会自己跑马灯
            labelMusic.text = aweme.music!.title! + " - " + aweme.music!.author!
            labelMusic.restartLabel()
            
            // 作者头像、关注
            let avatarUrl = URL(string: aweme.author!.avatarThumb!.urlList![0])
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
            let musicCover = URL(string: aweme.music!.coverThumb!.urlList![0])
            musicCoverImageView.kf.setImage(with: musicCover)
            
            // 唱盘转动动画
            diskAnimator = ChainableAnimator(view: subDiskView) // 将动画关联到唱盘
            diskAnimator.rotate(angle: 180).animateWithRepeat(t: 3.5, count: 50) // 旋转并重复
            
            // 音符散发动画
            diskView.raiseAnimate(imageName: "icon_home_musicnote1", delay: 0) // raiseAnimate()写在extension里了，所有的UIView都可以用
            diskView.raiseAnimate(imageName: "icon_home_musicnote2", delay: 1) // 延迟1s散发第二个音符
            diskView.raiseAnimate(imageName: "icon_home_musicnote1", delay: 2) // 延迟2s散发第三个音符
        
            // 视频封面图
            let coverUrl = URL(string: aweme.video!.cover!.urlList![0])
            coverImageView.kf.setImage(with: coverUrl)
            
            //设置视频播放地址
            videoURL = aweme.video!.playAddr!.urlList![2]
        }
    }
    
    // 1.视频有值了，对播放器进行初始化
    var videoLayer = AVPlayerLayer()
    var videoURL: String? {
        didSet {
            if let videoURL = videoURL {
                ASVideoPlayerController.sharedVideoPlayer.setupVideoFor(url: videoURL)
            }
            videoLayer.isHidden = videoURL == nil
        }
    }
    
    // 暂停/播放功能切换
    @objc func pausePlayer() {
        showPauseViewAnim(rate: videoLayer.player!.rate)
        ASVideoPlayerController.sharedVideoPlayer.pausePlayer()
    }
    
    func setupUI() {
        coverImageView.layer.borderColor = UIColor.gray.withAlphaComponent(0.3).cgColor
        
        videoLayer.backgroundColor = UIColor.clear.cgColor
        videoLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        coverImageView.layer.addSublayer(videoLayer)
        
        pauseImageView.isHidden = true

        //添加全屏暂停 点击
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(pausePlayer))
        self.contentView.addGestureRecognizer(tapGesture)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    // 重复使用cell所以有些动画要清空重制
    override func prepareForReuse() {
        coverImageView.image = nil
        pauseImageView.isHidden = true
        
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
        
        super.prepareForReuse()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        videoLayer.frame = CGRect(x: 0, y: 0, width: width, height: height)
        //        print("视频层frame：",videoLayer.frame)
    }
    
    // 2.计算可见的视频层高度，以便播放在可视范围内的cell
    /// - REturns: 可见的视频层高度
    func visibleVideoHeight() -> CGFloat {
        let videoFrameInParentSuperView = superview?.superview?.convert(coverImageView.frame, from: coverImageView)

        guard let videoFrame = videoFrameInParentSuperView, let superViewFrame = superview?.frame else {
            return 0
        }

        let visibleVideoFrame = videoFrame.intersection(superViewFrame)
        print("视频可见高度： ", visibleVideoFrame.size.height)
        return visibleVideoFrame.size.height
    }

    // 视频暂停/播放按钮的动画
    /// - Parameter rate: 视频播放速率
    func showPauseViewAnim(rate: Float) {
        if rate == 0 {
            UIView.animate(withDuration: 0.25) {
                self.pauseImageView.alpha = 0
            } completion: { (_) in
                self.pauseImageView.isHidden = true
            }
        } else {
            pauseImageView.isHidden = false
            pauseImageView.transform = CGAffineTransform.init(scaleX: 1.8, y: 1.8)
            pauseImageView.alpha = 1.0

            UIView.animate(withDuration: 0.25, delay: 0.0, options: .curveEaseIn) {
                self.pauseImageView.transform = .init(scaleX: 1.0, y: 1.0)
            }
        }
    }

}
