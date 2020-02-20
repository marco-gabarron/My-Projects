
import Foundation

protocol CoinManagerDelegate {
    func didUpdateRate(_ coinManager: CoinManager, coin: CoinModel)
    func didFailWithError(error: Error)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "07C50BD5-B6E8-4F47-9E3D-1519C027C9E9"
    let currencyArray = ["USD", "EUR", "ETH"]
    
    var delegate: CoinManagerDelegate?
    
    func fetchRate(for currency: String){
        let finalCurrency = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        performRequest(with: finalCurrency)
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let coinRate = self.parseJSON(safeData) {
                        self.delegate?.didUpdateRate(self, coin: coinRate)

                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ coinData: Data) -> CoinModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: coinData)
            let rate = decodedData.rate
            let asset_id_quote = decodedData.asset_id_quote
            
            let coin = CoinModel(currency: asset_id_quote, rate: rate)
            
            return coin
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}
