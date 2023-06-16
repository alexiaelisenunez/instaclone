import Foundation

protocol SearchClientProtocol {
    func fetchData(for queryString: String, page: Int) async throws -> [Gallery]
}

struct SearchClient {
    let apiClient: APIClientProtocol
    
    init(apiClient: APIClientProtocol = APIClient()) {
        self.apiClient = apiClient
    }
}

extension SearchClient: SearchClientProtocol {
    func fetchData(for queryString: String = "", page: Int = 0) async throws -> [Gallery] {
        do {
            return try await apiClient.fetchData(for: queryString, page: page).galleries ?? []
        }
    }
}
