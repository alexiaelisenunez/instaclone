import SwiftUI
import CachedAsyncImage

struct ImgurSearchMainView: View {
    
    @ObservedObject var viewModel = SearchResultsViewModel()
    @State private var searchText = ""
    
    private static let spacing: CGFloat = 1
    
    private let columns = [
        GridItem(.flexible(), spacing: spacing),
        GridItem(.flexible(), spacing: spacing),
        GridItem(.flexible(), spacing: spacing),
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: Self.spacing) {
                    ForEach(Array(viewModel.imageViewModels.enumerated()), id: \.1) { index, viewModel in
                        if let thumbnailURL = viewModel.thumbnailUrl {
                            NavigationLink {
                                ImgurSearchDetailView(viewModel: viewModel)
                            } label: {
                                ImageView(urlString: thumbnailURL)
                                    .onAppear() {
                                        self.viewModel.requestMoreItemsIfNeeded(index: index)
                                    }
                            }
                        }
                    }
                }
            }
            .navigationTitle(SearchResultsViewModel.searchText)
        }
        .searchable(text: $searchText,
                    prompt: Text(SearchResultsViewModel.searchSuggestion))
        .onSubmit(of: .search) {
            showResults(for: searchText)
        }
        .onAppear() {
            showResults()
        }
    }
}

private extension ImgurSearchMainView {
    func showResults(for searchTerm: String = "cats") {
        Task {
            viewModel.requestInitialSetOfItems(for: searchTerm)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ImgurSearchMainView()
    }
}
