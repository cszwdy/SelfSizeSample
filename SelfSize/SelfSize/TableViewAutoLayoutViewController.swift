//
//  TableViewAutoLayoutViewController.swift
//  SelfSize
//
//  Created by Emiaostein on 7/18/16.
//  Copyright © 2016 Emiaostein. All rights reserved.
//

import UIKit

class TableViewAutoLayoutViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedRowHeight = 410
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}

extension TableViewAutoLayoutViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return demo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AppCell")!
        
        if let textView = cell.viewWithTag(2003) as? UITextView {
            textView.text = { () -> String in
                switch demo[indexPath.item] {
                case 1:
                    return "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
                case 2:
                    return "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
                default:
                    return "Lorem ipsum dolor sit amet, consectetur adipisicing elit."
                }
            }()
        }
        
        return cell
    }
}

extension TableViewAutoLayoutViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                let n = demo[indexPath.item]
                demo[indexPath.item] = (n + 1) % 3 + 1
                tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}

var demo = [1,2,3,3,2,2,1]
