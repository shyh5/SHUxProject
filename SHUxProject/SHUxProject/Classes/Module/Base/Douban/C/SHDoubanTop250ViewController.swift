//
//  SHDoubanTop250ViewController.swift
//  SHUxProject
//
//  Created by SHyH5 on 2018/4/9.
//  Copyright © 2018年 SHyH5. All rights reserved.
//

import UIKit

class SHDoubanTop250ViewController: UIViewController {
    
    var dataArr = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUI()
        
    }
    
    func loadUI() {
        self.navigationController?.navigationBar.setNavigationBackgroundColor(backgroundColor: UIColor.yellow)
        self.navigationController?.navigationBar.sh_setNavBarAlpha(0)
        
        //title = "豆瓣top250"
        view.backgroundColor = UIColor.orange
        view.addSubview(tableView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: -- layout --
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: -64, width: SCREEN_WIDTH, height: SCREEN_HEIGHT + 64), style: UITableViewStyle.plain)
        tableView.delegate = self
        tableView.dataSource = self
        //tableView.separatorStyle = .none
        tableView.rowHeight = 200
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = UIColor.white
    
        //tableView.contentInset = UIEdgeInsets.init(top: 200, left: 0, bottom: 0, right: 0)
        //        tableView.register(UINib(nibName: "JFCategoryListCell", bundle: nil), forCellReuseIdentifier: self.videoListIdentifier)
        //        tableView.mj_footer = setupFooterRefresh(self, action: #selector(loadMoreData))
        return tableView
    }()
    

}

extension SHDoubanTop250ViewController: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = "第\(indexPath.row)行"
        cell?.backgroundColor = UIColor.yellow
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headview = SHDoubanHeadView()
        return headview
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200 + 64
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // 上滑是+， 下滑是-
        print("content: ",scrollView.contentOffset.y)
        let sectionHeaderHeight:CGFloat = 150
        var alphe =  (scrollView.contentOffset.y - 64)  / sectionHeaderHeight
        if alphe > 1 {
            alphe = 0.99
        }
        
      //  self.navigationController?.navigationBar.sh_setNavBarAlpha(alphe)
        
//        let navC = UIColor.init(white: 1, alpha: alphe)
//        self.navigationController?.navigationBar.setBackgroundImage(UIColor.creatImageWithColor(color: navC), for: .default)
        
       
        if scrollView.contentOffset.y <= sectionHeaderHeight && scrollView.contentOffset.y >= 0 {
            title = ""
            print("xia alpha : ", alphe)
            self.navigationController?.navigationBar.sh_setNavBarAlpha(alphe)
            
            scrollView.contentInset = UIEdgeInsets.init(top: -scrollView.contentOffset.y, left: 0, bottom: 0, right: 0)
        } else if scrollView.contentOffset.y >= sectionHeaderHeight {
            title = "豆瓣top250"
            print("shang alpha : ", alphe)
            self.navigationController?.navigationBar.sh_setNavBarAlpha(alphe)
            
            scrollView.contentInset = UIEdgeInsets.init(top: -sectionHeaderHeight, left: 0, bottom: 0, right: 0)
        }
    }
    
}

