//
//  ViewController.swift
//  DouYin
//
//  Created by Sophia_fez on 2020/10/14.
//

import UIKit
import NVActivityIndicatorView

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var loadingView: NVActivityIndicatorView!
    
    var flagAuthed = false
    
    var awemeList = [AwemeList]()
    var videoJsonIndex = 12
    var currentPage = 0
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        awemeList.count
    }
    
    //cell高度 = 整页宽度
    //★☆★ 注意： 如果高度始终固定，就把table view默认的 估算高度 关闭
    //否则随时行数新增（insertRows），高度计算量会增大，拖动性能会垮掉（大坑啊）
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UIScreen.main.bounds.size.height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 自定义的cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VideoCell
        // cell.textLabel?.text = awemeList[indexPath.row].desc // basic cell
        
        cell.aweme = awemeList[indexPath.row]
        
        return cell
    }
    
    // 状态栏设置为白色，默认是黑色
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    
    // 拖动加载，滑动显示下一页
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        videoJsonIndex -= 1
//        if videoJsonIndex == 0 {
//            videoJsonIndex = 12;
//        }
//        getList()
//
//        // 获取当前页码，可以在本组数据滑完前提前加载后一组数据（但还未实现该功能）
//        currentPage = tableView.indexPathsForVisibleRows!.last!.row
//        print("页码： ", currentPage)
//    }
    
    
    func getAwelist(url: URL)  {
        do {
            let feed = try Feed(fromURL: url)
            
            if let awemeList = feed.awemeList{
                debugPrint("获取视频列表成功!")
                loadingView.stopAnimating()

                //获取要新增的行的添加到TableView的位置，由新数据数组循环转化，从原数组末尾添加
                let indexPaths = awemeList.enumerated().map { (offset, element) -> IndexPath in
                    return IndexPath(row: self.awemeList.count + offset, section: 0)
                }

                //新数据添加到末尾
                self.awemeList += awemeList

                //开始插入新行
                tableView.beginUpdates()
                tableView.insertRows(at: indexPaths, with: .automatic)
                tableView.isPagingEnabled = true
                tableView.endUpdates()

            } else {
                debugPrint("视频列表字段错误！")
            }
        } catch  {
            debugPrint("解析错误",error)
        }
    }
    
    func dataFrom(local: Bool)  {
        loadingView.startAnimating()

        if !local {
            DouyinNetwork.checkAuth {
                OperationQueue.main.addOperation {
                    self.flagAuthed = true
                    self.getAwelist(url: DouyinURL.feedUrl)
                    
                    self.pausePlayerVideos() //解决第一个视频无法播放的bug
                }
            }
            return
        }

        let localUrl = URL(string: DouyinURL.baseLocal + videoJsonIndex.description + DouyinURL.feedFile)!
        getAwelist(url: localUrl)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //loadingView.startAnimating() // 在获取到数据前一直播放加载动画
        //getList()
        
        dataFrom(local: true)
        
        // 加入一个通知，当app进入后台要有的操作，这里让视频暂停
        NotificationCenter.default.addObserver(self, selector: #selector(self.appEnteredFromBackground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
}

// 评论总数
extension ViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? CommentController {
            dest.totalComments = awemeList[currentPage].statistics!.commentCount!
        }
    }
}

extension ViewController {
    // 减速停止
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pausePlayerVideos()
        
        currentPage = tableView.indexPathsForVisibleRows!.last!.row
        print("当前(可见行的最后)行: ", currentPage)
        
        print("当前可见行: ", tableView.indexPathsForVisibleRows!)
        
        // 获取视频
        if currentPage == (awemeList.count - 1) {
            OperationQueue.main.addOperation {
                print("开始获取新视频")
                self.videoJsonIndex -= 1
                let localUrl = URL(string: DouyinURL.baseLocal + self.videoJsonIndex.description + DouyinURL.feedFile)!
                print(localUrl)
                
                //self.getAwemeList(url: localUrl)
                self.dataFrom(local: true)
            }
        }
    }
    
    
    // scroll停止时，暂停视频
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            self.pausePlayerVideos()
        }
    }
    
    // 当cell被移除时，移除视频层，实现cell的复用
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let videoCell = cell as? ASAutoPlayVideoLayerContainer, let _ = videoCell.videoURL {
            ASVideoPlayerController.sharedVideoPlayer.removeLayerFor(cell: videoCell)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        pausePlayerVideos()
    }
    
    func pausePlayerVideos() {
        ASVideoPlayerController.sharedVideoPlayer.pausePlayeVideosFor(tableView: tableView)
    }
    
    @objc func appEnteredFromBackground() {
        ASVideoPlayerController.sharedVideoPlayer.pausePlayeVideosFor(tableView: tableView, appEnteredFromBackground: true)
    }
}
