import Foundation
import SwiftUI
import CachedAsyncImage

struct ImageView: View {
    var urlString: String?
    
    var body: some View {
        if let urlString = urlString,
        let url = URL(string: urlString) {
            Color.clear.overlay(
                CachedAsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .clipped()
                    } placeholder: {
                        ProgressView()
                    }
            )
            .frame(maxWidth: .infinity)
            .aspectRatio(1, contentMode: .fit)
            .clipped()
        } else {
            EmptyView()
        }
    }
}
