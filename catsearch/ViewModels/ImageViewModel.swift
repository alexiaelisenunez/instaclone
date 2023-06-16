import Foundation

struct ImageViewModel: Identifiable, Hashable {
    enum ImageSize: String {
        case thumbnail = "t"
        case fullImage = "h"
    }
    
    var id: String?
    var link: String?
    var name: String?
    var submittedBy: String?
    var description: String?
}

extension ImageViewModel {
    var thumbnailUrl: String? {
        imageURLString(for: .thumbnail)
    }
    
    var fullImageUrl: String? {
        imageURLString(for: .fullImage)
    }
}

private extension ImageViewModel {
    func imageURLString(for type: ImageSize) -> String? {
        guard let id = id, let link = link else { return nil }
        let comps = link.components(separatedBy: ".")
        guard comps.count > 2, let fileExtension = comps.last else { return nil }
        
        let fullImageUrl = "https://i.imgur.com/\(id)\(type.rawValue).\(fileExtension)"
        
        return fullImageUrl
    }
}
