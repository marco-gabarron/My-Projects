
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    var coinManager = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //set self as CoinManager delegate, protocol implemented on extension below
        coinManager.delegate = self
        
        //set self as CoinManager delegate and date source, protocol implemented on extension below
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        
        //fetch data for USD as inicial value
        coinManager.fetchRate(for: coinManager.currencyArray[0])
        
    }
}

//MARK: - UIPickerViewDataSource and UIPickerViewDelegate
extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        coinManager.fetchRate(for: coinManager.currencyArray[row])
    }
    
}

//MARK: - CoinManagerDelegate
extension ViewController: CoinManagerDelegate{
    
    func didUpdateRate(_ coinManager: CoinManager, coin: CoinModel) {
        DispatchQueue.main.async {
            self.bitcoinLabel.text = String(coin.rate)
            self.currencyLabel.text = coin.currency
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
}
