import Foundation

struct SearchResults: Codable {
    var galleries: [Gallery]?
    
    enum CodingKeys: String, CodingKey {
        case galleries = "data"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        galleries = try container.decodeIfPresent([Gallery].self, forKey: .galleries)
    }
}
