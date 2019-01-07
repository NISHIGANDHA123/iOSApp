
import UIKit
import AlamofireImage

class ViewController: UIViewController {

    //variable declaration
    var detailTableView : UITableView!
    var arrayRow: [DataModel]?
    var header: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //create table view
        createTableView()
        
        //setting tableview delegate and datasource
        detailTableView.delegate = self
        detailTableView.dataSource = self
        
        //register cell
        detailTableView.register(DetailTableViewCell.self, forCellReuseIdentifier:Constants.cellReuseIdentifier)
        
        //setup navigation bar
        setUpNavigation()
        
        //API CALL
        DataAPI.GetDetailData(url: Constants.DATA_URL, completion: { rows,header in
                    self.header = header
                    self.setUpNavigation()
                    self.arrayRow = rows
                    self.detailTableView.reloadData()
        })
    }
    
    //table view creation
    func createTableView() {
        detailTableView = UITableView()
        detailTableView.backgroundColor = Constants.BG_COLOR_TABLE
        self.view.addSubview(detailTableView)
        
        detailTableView.translatesAutoresizingMaskIntoConstraints = false
        detailTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        detailTableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        detailTableView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true;
        detailTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true;
    }
    
    //Navigation bar creation
    func setUpNavigation() {
        navigationItem.title = self.header
        self.navigationController?.navigationBar.barTintColor = Constants.BAR_TINT_COLOR
        self.navigationController?.navigationBar.isTranslucent = false
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName:Constants.TITLE_TEXT_ATTRIBUTE]
    }
}

extension ViewController : UITableViewDelegate {
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 150
        }
}

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
        return cell
    }
}
