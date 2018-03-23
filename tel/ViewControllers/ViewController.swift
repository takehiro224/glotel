//
//  ViewController.swift
//  tel
//
//  Created by Watanabe Takehiro on 2018/03/19.
//  Copyright © 2018年 Watanabe Takehiro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var bookBarItem: UITabBarItem!
    @IBOutlet weak var bookView: UIView!
    @IBOutlet weak var historyView: UIView!
    @IBOutlet weak var accountView: UIView!
    @IBOutlet weak var leftBarItem: UIBarButtonItem!
    @IBOutlet weak var rightBarItem: UIBarButtonItem!
    
    @IBOutlet weak var navigationTop: NSLayoutConstraint!
    @IBOutlet weak var menuWidth: NSLayoutConstraint!
    @IBOutlet weak var accountViewTop: NSLayoutConstraint!
    
    var searchBar: UISearchBar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let screen = UIScreen.main.bounds.size
//        print(screen.width)
        
        // ナビゲーションバーの位置を設定
        self.navigationTop.constant = UIApplication.shared.statusBarFrame.height
        self.menuWidth.constant = 250
        
        #if DEBUG
            print("debug")
        #elseif DEVELOP
            print("develop")
        #else
            print("release")
        #endif
        
        self.leftBarItem.title = "設定"
        self.scrollView.delegate = self
        self.tabBar.delegate = self
        
        self.tabBar.selectedItem = self.bookBarItem
        self.viewInit()
        self.setupSearchBar()
    }
    
    private func viewInit() {
        self.tabSelect(0)
    }
    
    private func setupSearchBar() {
        var searchBar: UISearchBar!
        if let bar = self.searchBar {
            searchBar = bar
        } else {
            let navigationBarFrame = self.navigationBar.bounds
            let searchBar = UISearchBar(frame: navigationBarFrame)
            searchBar.delegate = self
            searchBar.placeholder = "Search"
            searchBar.keyboardType = UIKeyboardType.default
            self.searchBar = searchBar
        }
        navigationItem.titleView = searchBar
        navigationItem.titleView?.frame = searchBar.frame
        navigationItem.leftBarButtonItem = leftBarItem
        navigationItem.rightBarButtonItem = rightBarItem
        self.navigationBar.setItems([navigationItem], animated: false)
    }
    
    private func setupAccountNavigationBar() {
        navigationItem.titleView = nil
        navigationItem.leftBarButtonItem = leftBarItem
        navigationItem.rightBarButtonItem = rightBarItem
        self.navigationBar.setItems([navigationItem], animated: false)
    }
    
    private func setupHitstoryNavigationBar() {
        navigationItem.titleView = nil
        navigationItem.leftBarButtonItem = leftBarItem
        navigationItem.rightBarButtonItem = rightBarItem
        self.navigationBar.setItems([navigationItem], animated: false)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.scrollView.contentOffset = CGPoint(x: 250, y: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tabSelect(_ tag: Int) {
        switch tag {
        case 0:
            self.setupSearchBar()
            self.bookView.isHidden = false
            self.historyView.isHidden = true
            self.accountView.isHidden = true
        case 1:
            self.setupHitstoryNavigationBar()
            self.bookView.isHidden = true
            self.historyView.isHidden = false
            self.accountView.isHidden = true
        case 2:
            self.setupAccountNavigationBar()
            self.bookView.isHidden = true
            self.historyView.isHidden = true
            self.accountView.isHidden = false
        default:
            break
        }
    }

}

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    }
    
}

extension ViewController: UITabBarDelegate {
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        self.tabSelect(item.tag)
    }
    
}
extension ViewController: UISearchBarDelegate {
    
}
