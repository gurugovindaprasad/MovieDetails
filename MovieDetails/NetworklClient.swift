import Foundation

class NetworkClient {
    let defaultSession = URLSession(configuration: .default)
    
    var dataTask: URLSessionDataTask?
    var baseURLString: String {
        return "https://raw.githubusercontent.com/FEND16/movie-json-data/master/json/top-rated-indian-movies-01.json"
    
    }
    
    func requestAllCharacters(completion: @escaping ([Movie]) -> Void) {
        dataTask?.cancel()
        let movieURL = baseURL()
        
        dataTask = defaultSession.dataTask(with: movieURL, completionHandler: {(data, response, error) in
            guard
                error == nil,
                let data = data
                else {
                    completion([])
                    return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                let movieResponse = try jsonDecoder.decode(Movie.self, from: data)
                completion([movieResponse])
            } catch {
                completion([])
            }
        })
        
        dataTask?.resume()
    }
    
    func baseURL() -> URL {
        guard let url = URL(string: baseURLString) else {
            fatalError("Invalid url generation")
        }
        
        return url
    }
}
