
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //variable declaration
    var detailTableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //create table view
        createTableView()
        
        //register cell
        detailTableView.register(UITableViewCell.self, forCellReuseIdentifier:"detailCell")
        
        //setting tableview delegate and datasource
        detailTableView.delegate = self
        detailTableView.dataSource = self
        
        //setup navigation bar
        setUpNavigation()
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
        navigationItem.title = "About Canada"
        self.navigationController?.navigationBar.barTintColor = UIColor.init(colorLiteralRed: 0.2431372549, green: 0.7647058824, blue: 0.8392156863, alpha: 1)
        self.navigationController?.navigationBar.isTranslucent = false
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName:UIColor.init(colorLiteralRed: 1, green: 1, blue: 1, alpha: 1)]

    }

    //table view methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
        cell.textLabel?.text = "Test"
        return cell
    }

}

