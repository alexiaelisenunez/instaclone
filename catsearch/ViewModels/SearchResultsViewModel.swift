import Foundation

final class SearchResultsViewModel: ObservableObject {
    
    // MARK:- Infinite scroll
    private let itemsFromEndThreshold = 30
    private var totalItemsAvailable: Int = 0
    private var itemsLoadedCount: Int = 0
    private var page = 0
    private var currentSearchTerm = ""
    
    // MARK:- Services
    private let searchClient = SearchClient()
    internal static let searchText = "Search"
    internal static let searchSuggestion = "How about some cats?"
    
    // MARK:- published values
    @Published var imageViewModels: [ImageViewModel] = []
    @Published var isDataLoading = false
    
    func requestInitialSetOfItems(for queryString: String = "") {
        currentSearchTerm = queryString
        totalItemsAvailable = 0
        itemsLoadedCount = 0
        searchResultImages(for: currentSearchTerm)
    }
    
    func requestMoreItemsIfNeeded(index: Int) {
        let thresholdMet = thresholdMeet(itemsLoadedCount, index)
        let moreItemsRemaining = moreItemsRemaining(itemsLoadedCount, totalItemsAvailable)
            if thresholdMet && moreItemsRemaining {
                // Request next page
                page += 1
                searchResultImages(for: currentSearchTerm, page: page)
            }
        }
    
    func searchResultImages(for queryString: String = "", page: Int = 0) {
        do {
            isDataLoading = true
            Task {
                let viewModels = try await searchClient.fetchData(for: currentSearchTerm, page: page)
                    .map({ $0.images })
                    .compactMap({ $0 })
                    .joined()
                    .map({
                        ImageViewModel(id: $0.id,
                                       link: $0.link,
                                       description: $0.descriptionValue)
                    })
                    .compactMap({ $0 })
                    
                
                await MainActor.run(body: {
                    itemsLoadedCount = viewModels.count
                    totalItemsAvailable = viewModels.count
                    if page == 0 {
                        self.imageViewModels = viewModels
                    } else {
                        self.imageViewModels.append(contentsOf: viewModels)
                    }
                    
                    isDataLoading = false
                })
            }
        }
    }
}

private extension SearchResultsViewModel {
    private func thresholdMeet(_ itemsLoadedCount: Int, _ index: Int) -> Bool {
        // Should trigger when items loaded count - index passed in is less than the threshold
            return (itemsLoadedCount - index) <= itemsFromEndThreshold
        }
        
        /// Determines whether there is more data to load.
        private func moreItemsRemaining(_ itemsLoadedCount: Int, _ totalItemsAvailable: Int) -> Bool {
            // should trigger when the loaded count is less than the total items available
            return itemsLoadedCount <= totalItemsAvailable
        }
}
