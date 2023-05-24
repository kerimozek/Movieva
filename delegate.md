Tabii, singleton yapısını kaldırarak protocol ve delegate kullanımına uygun bir şekilde `HomeViewModel` sınıfını güncelleyebiliriz. İşte örneği:

```swift
protocol HomeViewModelDelegate: AnyObject {
    func didFetchData(_ homePage: HomePage)
    func didFail(with error: Error)
}

class HomeViewModel {
    weak var delegate: HomeViewModelDelegate?
    private let networkManager = NetworkManagerTR()
    
    func fetchData() {
        networkManager.getRequest(path: "/get/home") { [weak self] result in
            switch result {
            case .success(let homePage):
                self?.delegate?.didFetchData(homePage)
            case .failure(let error):
                self?.delegate?.didFail(with: error)
            }
        }
    }
}
```

Yukarıdaki kodda, `HomeViewModelDelegate` adında bir protokol oluşturduk. `HomeViewModel` sınıfı bu protokolü kullanarak delegate özelliğini tanımladı. `fetchData` fonksiyonunda ise başarılı veri alındığında veya hata durumunda delegate üzerinden ilgili fonksiyonları çağırdık.

Bu şekilde, `HomeViewModel` sınıfını kullanacak diğer sınıfların bu protokolü uygulayarak `HomeViewModelDelegate` özelliklerini kullanabileceklerini belirtmeleri gerekmektedir.

Tabii, anasayfanın `ViewController`'ında `HomeViewModel`'i kullanmak ve `tableView`'ı yeniden yüklemek için aşağıdaki örnek kodu kullanabilirsiniz:

```swift
class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var homeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        homeViewModel.delegate = self
        homeViewModel.fetchData()
    }
}

extension HomeViewController: HomeViewModelDelegate {
    func didFetchData(_ homePage: HomePage) {
        DispatchQueue.main.async { [weak self] in
            // Veri alındığında tableView'ı yeniden yükle
            self?.tableView.reloadData()
        }
    }
    
    func didFail(with error: Error) {
        // Hata durumunu işle
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // homeViewModel'den gelen veriye göre hücre sayısını döndür
        return homeViewModel.homePageData?.data?[section].items?.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // homeViewModel'den gelen veriye göre bölüm sayısını döndür
        return homeViewModel.homePageData?.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Hücreyi oluştur ve veriyi göster
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        if let item = homeViewModel.homePageData?.data?[indexPath.section].items?[indexPath.row] {
            cell.textLabel?.text = item.title
            // Diğer hücre özelliklerini de ayarla
        }
        
        return cell
    }
}
```

Yukarıdaki kodda, `HomeViewController` sınıfında `HomeViewModel` örneği oluşturulur ve `tableView`'ın yeniden yüklenmesi için `HomeViewModelDelegate` protokolü uygulanır. `HomeViewModel`'in `fetchData` fonksiyonu çağrıldığında, veri alındığında `didFetchData` fonksiyonu tetiklenir ve `tableView` yeniden yüklenir. `tableView`'ın veri kaynağı ve delegesi de `HomeViewController` sınıfında uygulanır.
