import Foundation


enum NetworkError: String, Error {
    case badURL = "Something went wrong.Sorry for the inconvinence."
}

class NetworkClient
{
    let defaultSession = URLSession(configuration: .default)
    
    var dataTask: URLSessionDataTask?
    var baseURLString: String {
        return "https://raw.githubusercontent.com/FEND16/movie-json-data/master/json/top-rated-indian-movies-01.json"
    }
    
    func requestMovies(completion: @escaping ((Result<[Movie], NetworkError>) -> Void)) {
        dataTask?.cancel()
        let movieURL = baseURL()
        
        dataTask = defaultSession.dataTask(with: movieURL, completionHandler: {(data, response, error) in
            guard
                error == nil,
                let data = data
                else {
                    completion(.failure(.badURL))
                    return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                let movieResponse = try jsonDecoder.decode([Movie].self, from: data)
                completion(.success(movieResponse))
            } catch {
                 completion(.failure(.badURL))
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
