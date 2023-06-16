import Foundation
/*
 {
     "id": "NyBy2Dq",
     "title": null,
     "description": "Learn more: https://drawdown.org/solutions/table-of-solutions",
     "datetime": 1686677397,
     "type": "image/png",
     "animated": false,
     "width": 1080,
     "height": 1080,
     "size": 458552,
     "views": 29,
     "bandwidth": 13298008,
     "vote": null,
     "favorite": false,
     "nsfw": null,
     "section": null,
     "account_url": null,
     "account_id": null,
     "is_ad": false,
     "in_most_viral": false,
     "has_sound": false,
     "tags": [],
     "ad_type": 0,
     "ad_url": "",
     "edited": "0",
     "in_gallery": false,
     "link": "https://i.imgur.com/NyBy2Dq.png",
     "comment_count": null,
     "favorite_count": null,
     "ups": null,
     "downs": null,
     "points": null,
     "score": null
 }
 */

struct Image: Codable {
    var type: String?
    var datetime: Int?
    var inMostViral: Bool?
    var size: Int?
    var height: Int?
    var edited: String?
    var isAd: Bool?
    var link: String?
    var adType: Int?
    var favorite: Bool?
    var inGallery: Bool?
    var id: String?
    var animated: Bool?
    var hasSound: Bool?
    var views: Int?
    var bandwidth: Int?
    var width: Int?
    var adUrl: String?
    var descriptionValue: String?
    
    enum CodingKeys: String, CodingKey {
        case type
        case datetime
        case inMostViral = "in_most_viral"
        case size
        case height
        case edited
        case isAd = "is_ad"
        case link
        case adType = "ad_type"
        case favorite
        case inGallery = "in_gallery"
        case id
        case animated
        case hasSound = "has_sound"
        case views
        case bandwidth
        case width
        case adUrl = "ad_url"
        case descriptionValue = "description"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decodeIfPresent(String.self, forKey: .type)
        datetime = try container.decodeIfPresent(Int.self, forKey: .datetime)
        inMostViral = try container.decodeIfPresent(Bool.self, forKey: .inMostViral)
        size = try container.decodeIfPresent(Int.self, forKey: .size)
        height = try container.decodeIfPresent(Int.self, forKey: .height)
        edited = try container.decodeIfPresent(String.self, forKey: .edited)
        isAd = try container.decodeIfPresent(Bool.self, forKey: .isAd)
        link = try container.decodeIfPresent(String.self, forKey: .link)
        adType = try container.decodeIfPresent(Int.self, forKey: .adType)
        favorite = try container.decodeIfPresent(Bool.self, forKey: .favorite)
        inGallery = try container.decodeIfPresent(Bool.self, forKey: .inGallery)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        animated = try container.decodeIfPresent(Bool.self, forKey: .animated)
        hasSound = try container.decodeIfPresent(Bool.self, forKey: .hasSound)
        views = try container.decodeIfPresent(Int.self, forKey: .views)
        bandwidth = try container.decodeIfPresent(Int.self, forKey: .bandwidth)
        width = try container.decodeIfPresent(Int.self, forKey: .width)
        adUrl = try container.decodeIfPresent(String.self, forKey: .adUrl)
        descriptionValue = try container.decodeIfPresent(String.self, forKey: .descriptionValue)
    }
}
