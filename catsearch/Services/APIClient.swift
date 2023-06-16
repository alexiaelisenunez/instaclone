import Foundation

protocol APIClientProtocol {
    func fetchData(for searchQuery: String, page: Int) async throws -> SearchResults
}

enum APIClientError: Error {
    case invalidURL
    case invalidJSON
}

struct APIClient {
    private let clientID = "b067d5cb828ec5a"
    private let baseURL = "https://api.imgur.com/3/gallery/search/"
}

private extension APIClient {
    func request(for URL: URL) -> URLRequest {
        var request = URLRequest(url: URL)
        request.timeoutInterval = 10
        request.setValue("Client-ID \(clientID)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        return request
    }
}

extension APIClient: APIClientProtocol {
    func fetchData(for searchQuery: String = "", page: Int = 0) async throws -> SearchResults {
        let paginatedUrl = baseURL + "\(page)"
        guard
            var url = URL(string: paginatedUrl)
        else {
            throw APIClientError.invalidURL
        }
        
        
        url.append(queryItems: [URLQueryItem(name: "q", value: searchQuery)])
        
        let request = request(for: url)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        return try JSONDecoder().decode(SearchResults.self, from: data)
    }
}
