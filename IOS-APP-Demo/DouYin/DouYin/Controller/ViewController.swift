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
    
    
    var awemeList = [AwemeList]()
    var videoJsonIndex = 12
    
    var currentPage = 0
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        awemeList.count
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
    
    // 行高，图片全屏适配
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UIScreen.main.bounds.size.height
    }
    
    // 拖动加载，滑动显示下一页
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        videoJsonIndex -= 1
        if videoJsonIndex == 0 {
            videoJsonIndex = 12;
        }
        getList()
        
        // 获取当前页码，可以在本组数据滑完前提前加载后一组数据（但还未实现该功能）
        currentPage = tableView.indexPathsForVisibleRows!.last!.row
        print("页码： ", currentPage)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadingView.startAnimating() // 在获取到数据前一直播放加载动画
        getList()
    }
    
    // 获取数据列表
    func getList() {
        let url = URL(string: DouYinURL.baseLocal + videoJsonIndex.description + DouYinURL.feedFile)!
        getAwemeList(url: url)
    }
    
    func getAwemeList(url: URL) {
        do {
            let feed = try Feed(fromURL: url)
            
            if let awemeList = feed.awemeList {
                self.awemeList += awemeList
                self.loadingView.stopAnimating() // 已获得数据停止加载动画
                self.tableView.reloadData()
            }
        } catch {
            debugPrint("解析错误", error)
        }
    }
}

