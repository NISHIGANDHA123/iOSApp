//
//  ViewController.swift
//  iOSApp
//
//  Created by Nishigandha Rajurkar on 03/01/19.
//  Copyright © 2019 iOS APP. All rights reserved.
//

import UIKit
import AlamofireImage

// Class used to show the list of rows data.
class ViewController: UIViewController {

    // Variable declaration
    var detailTableView : UITableView!
    var arrayRow: [DataModel]?
    var header: String?
    
    // Mark :- Controller cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTableView()
        
        detailTableView.delegate = self
        detailTableView.dataSource = self
        
        detailTableView.rowHeight = UITableViewAutomaticDimension
        detailTableView.estimatedRowHeight = CGFloat(Constants.TABLE_HEIGHT)
        
        detailTableView.register(DetailTableViewCell.self, forCellReuseIdentifier:Constants.cellReuseIdentifier)
        
        createRefreshControl()
        
        APICallForGetData()
    }
    
    // Table view creation
    private func createTableView() {
        detailTableView = UITableView()
        detailTableView.backgroundColor = Constants.BG_COLOR_TABLE
        self.view.addSubview(detailTableView)
        
        detailTableView.translatesAutoresizingMaskIntoConstraints = false
        detailTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        detailTableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        detailTableView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true;
        detailTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true;
    }
    
    // Navigation bar creation.
    private func setUpNavigation() {
        navigationItem.title = self.header
        self.navigationController?.navigationBar.barTintColor = Constants.BAR_TINT_COLOR
        self.navigationController?.navigationBar.isTranslucent = false
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName:Constants.TITLE_TEXT_ATTRIBUTE]
    }
    
    // Refresh control creation.
    private func createRefreshControl()  {
        let refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: Constants.PULL_TO_REFRESH)
        refreshControl.addTarget(self, action: #selector(refreshView), for: .valueChanged)
        detailTableView.refreshControl = refreshControl
    }
    
    // Refresh control functionality.
    func refreshView(refreshControl: UIRefreshControl) {
        APICallForGetData()
        refreshControl.endRefreshing()
    }
    
    private func APICallForGetData()  {
        
        //if network is rechable
        if Reachability.isConnectedToInternet() {
            DataAPI.GetDetailData(url: Constants.DATA_URL, success: { rows,header in
                // if API returns success
                self.header = header
                self.setUpNavigation()
                self.arrayRow = rows
                self.detailTableView.reloadData()
            }, failure: { fail in
                // API returns failure
                self.showAlert(title: Constants.API_ERROR_TITLE,
                               message: Constants.API_ERROR_MESSAGE,
                               action: Constants.ALERT_ACTION)
            })
        } else {
            
            //if network not rechable
            self.showAlert(title: Constants.NO_INTERNET_TITLE,
                           message: Constants.NO_INTERNET_MESSAGE,
                           action: Constants.ALERT_ACTION)
        }
    }
    
    private func showAlert(title: String, message: String, action: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: action,
                                      style: UIAlertActionStyle.default,
                                      handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

// Mark :- UITableViewDelegate
extension ViewController : UITableViewDelegate {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return CGFloat(Constants.TABLE_HEIGHT)
//    }
}

// Mark :- UITableViewDataSource
extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = arrayRow?.count {
            return count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellReuseIdentifier, for: indexPath) as! DetailTableViewCell
        if (arrayRow?[indexPath.row].rowTitle != nil) {
            cell.titleLabel.text = arrayRow?[indexPath.row].rowTitle
        } else {
            cell.titleLabel.text = Constants.EPMTY_STRING
        }
        
        if (arrayRow?[indexPath.row].rowDescription != nil) {
            cell.detailedLabel.text = arrayRow?[indexPath.row].rowDescription
        } else {
            cell.detailedLabel.text = Constants.EPMTY_STRING
        }
        let urlImageHref:URL?
        if (arrayRow?[indexPath.row].rowImageHref != nil) {
            urlImageHref = URL(string: (arrayRow?[indexPath.row].rowImageHref)!)
            cell.imageViewHeader.af_setImage(withURL: urlImageHref!,
                                             placeholderImage: UIImage(named:Constants.PLACEHOLDER_IMAGE),
                                             filter: nil,
                                             progress: nil,
                                             imageTransition: .crossDissolve(0.5),
                                             runImageTransitionIfCached: true,
                                             completion: nil)
        } else {
            cell.imageViewHeader.image = UIImage(named: Constants.NO_IMAGE_AVAILABLE)
        }
        cell.setNeedsLayout()
        cell.layoutIfNeeded()
        return cell
    }
}
