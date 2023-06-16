import Foundation
import SwiftUI
import CachedAsyncImage

struct ImgurSearchDetailView: View {
    let viewModel: ImageViewModel
    let descriptionDefaultString = "No description given"
    let errorString = "Oops, something went wrong."
    
    var body: some View {
        if let urlString = viewModel.fullImageUrl {
            ScrollView {
                HStack {
                    VStack(alignment: .leading) {
                        ImageView(urlString: urlString)
                        VStack {
                            Text(viewModel.description ?? descriptionDefaultString)
                                .font(.footnote)
                        }
                        .padding(8)
                    }
                }
            }
        } else {
            Text(errorString)
                .bold()
        }
    }
}
