
import UIKit
import AlamofireImage

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

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
        detailTableView.register(DetailTableViewCell.self, forCellReuseIdentifier:"detailCell")
        
        //setup navigation bar
        setUpNavigation()
        
        DataAPI.GetDetailData(url: constants.DATA_URL, completion: { rows,header in
                    self.header = header
                    self.setUpNavigation()
                    self.arrayRow = rows
                    self.detailTableView.reloadData()

        })
    }

    
    //table view creation
    func createTableView() {
        detailTableView = UITableView()
        detailTableView.backgroundColor = .white

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
        self.navigationController?.navigationBar.barTintColor = UIColor.init(colorLiteralRed: 0.2431372549, green: 0.7647058824, blue: 0.8392156863, alpha: 1)
        self.navigationController?.navigationBar.isTranslucent = false
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName:UIColor.init(colorLiteralRed: 1, green: 1, blue: 1, alpha: 1)]

    }

    //table view methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = arrayRow?.count {
            return count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as! DetailTableViewCell
        cell.titleLabel.text = arrayRow?[indexPath.row].rowTitle
        cell.detailedLabel.text = arrayRow?[indexPath.row].rowDescription
            let urlImageHref:URL?
            if (arrayRow?[indexPath.row].rowImageHref != nil) {
                urlImageHref = URL(string: (arrayRow?[indexPath.row].rowImageHref)!)
                cell.imageViewHeader.af_setImage(withURL: urlImageHref!,
                                                 placeholderImage: UIImage(named:"loader"),
                                                 filter: nil,
                                                 progress: nil,
                                                 imageTransition: .crossDissolve(0.5),
                                                 runImageTransitionIfCached: true,
                                                 completion: nil)
            }else {
                cell.imageViewHeader.image = UIImage(named: "noimage")
            }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}








