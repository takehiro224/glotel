//
//  BookViewController.swift
//  tel
//
//  Created by Watanabe Takehiro on 2018/03/19.
//  Copyright © 2018年 Watanabe Takehiro. All rights reserved.
//

import UIKit

class BookViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.scrollView.contentSize = CGSize(width: 575, height: 554)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
