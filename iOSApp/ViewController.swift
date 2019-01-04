
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //variable declaration
    var detailTableView : UITableView!
    var arrayTitle = ["Beavers","Beavers","Beavers","Beavers","Beavers"]
    var arrayDescription = ["Beavers are second only to humans in their ability to manipulate and change their environment. They can measure up to 1.3 metres long. A group of beavers is called a colony", "It is a well known fact that polar bears are the main mode of transportation in Canada. They consume far less gas and have the added benefit of being difficult to steal.", "A chiefly Canadian interrogative utterance, usually expressing surprise or doubt or seeking confirmation.", "Warmer than you might think.", "Sadly it's true."]
    var imageArray = ["icon.png", "icon.png", "icon.png", "icon.png", "icon.png"]
    
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
        return arrayTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as! DetailTableViewCell        
        cell.titleLabel.text = arrayTitle[indexPath.row]  // test string doesn't work, returns nil
        cell.detailedLabel.text = arrayDescription[indexPath.row]
        cell.imageViewHeader.image = UIImage (imageLiteralResourceName: imageArray[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

