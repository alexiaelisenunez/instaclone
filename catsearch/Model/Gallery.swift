import Foundation
/*
 {
             "id": "QhXyhn0",
             "title": "Do it for them",
             "description": null,
             "datetime": 1686677457,
             "cover": "NyBy2Dq",
             "cover_width": 1080,
             "cover_height": 1080,
             "account_url": "rhinokitty",
             "account_id": 3091171,
             "privacy": "hidden",
             "layout": "blog",
             "views": 35,
             "link": "https://imgur.com/a/QhXyhn0",
             "ups": 6,
             "downs": 0,
             "points": 6,
             "score": 6,
             "is_album": true,
             "vote": null,
             "favorite": false,
             "nsfw": false,
             "section": "",
             "comment_count": 5,
             "favorite_count": 0,
             "topic": null,
             "topic_id": null,
             "images_count": 1,
             "in_gallery": true,
             "is_ad": false,
             "tags": [
                 {
                     "name": "cute",
                     "display_name": "Cute",
                     "followers": 169635,
                     "total_items": 283525,
                     "following": false,
                     "is_whitelisted": false,
                     "background_hash": "MifWJps",
                     "thumbnail_hash": null,
                     "accent": "3BA3B1",
                     "background_is_animated": false,
                     "thumbnail_is_animated": false,
                     "is_promoted": false,
                     "description": "",
                     "logo_hash": null,
                     "logo_destination_url": null,
                     "description_annotations": {}
                 },
                 {
                     "name": "memes",
                     "display_name": "memes",
                     "followers": 2806426,
                     "total_items": 576479,
                     "following": false,
                     "is_whitelisted": false,
                     "background_hash": "1z4dgZT",
                     "thumbnail_hash": null,
                     "accent": "ba519f",
                     "background_is_animated": false,
                     "thumbnail_is_animated": false,
                     "is_promoted": false,
                     "description": "the freshest memes",
                     "logo_hash": null,
                     "logo_destination_url": null,
                     "description_annotations": {}
                 },
                 {
                     "name": "cats",
                     "display_name": "Cats",
                     "followers": 213185,
                     "total_items": 135726,
                     "following": false,
                     "is_whitelisted": false,
                     "background_hash": "xeEIpAn",
                     "thumbnail_hash": null,
                     "accent": "BF63A7",
                     "background_is_animated": false,
                     "thumbnail_is_animated": false,
                     "is_promoted": false,
                     "description": "Our feline friends",
                     "logo_hash": null,
                     "logo_destination_url": null,
                     "description_annotations": {}
                 },
                 {
                     "name": "cat",
                     "display_name": "cat",
                     "followers": 2210526,
                     "total_items": 289259,
                     "following": false,
                     "is_whitelisted": false,
                     "background_hash": "xeEIpAn",
                     "thumbnail_hash": null,
                     "accent": "159559",
                     "background_is_animated": false,
                     "thumbnail_is_animated": false,
                     "is_promoted": false,
                     "description": "feline friends",
                     "logo_hash": null,
                     "logo_destination_url": null,
                     "description_annotations": {}
                 },
                 {
                     "name": "aww",
                     "display_name": "aww",
                     "followers": 3737135,
                     "total_items": 709132,
                     "following": false,
                     "is_whitelisted": false,
                     "background_hash": "avRBRpN",
                     "thumbnail_hash": null,
                     "accent": "60AEBB",
                     "background_is_animated": false,
                     "thumbnail_is_animated": false,
                     "is_promoted": false,
                     "description": "cute and adorable",
                     "logo_hash": null,
                     "logo_destination_url": null,
                     "description_annotations": {}
                 }
             ],
             "ad_type": 0,
             "ad_url": "",
             "in_most_viral": false,
             "include_album_ads": false,
             
             "ad_config": {
                 "safeFlags": [
                     "album",
                     "in_gallery",
                     "gallery"
                 ],
                 "highRiskFlags": [],
                 "unsafeFlags": [
                     "sixth_mod_unsafe",
                     "under_10",
                     "updated_date"
                 ],
                 "wallUnsafeFlags": [],
                 "showsAds": false,
                 "showAdLevel": 1,
                 "safe_flags": [
                     "album",
                     "in_gallery",
                     "gallery"
                 ],
                 "high_risk_flags": [],
                 "unsafe_flags": [
                     "sixth_mod_unsafe",
                     "under_10",
                     "updated_date"
                 ],
                 "wall_unsafe_flags": [],
                 "show_ads": false,
                 "show_ad_level": 1,
                 "nsfw_score": 0
             }
         }
 */

struct Gallery: Codable {
    var id: String?
    var title: String?
    var description: String?
    var datetime: Int?
    var cover: String?
    var images: [Image]?
    var coverWidth: Int?
    var coverHeight: Int?

//    "account_url": "rhinokitty",
//    "account_id": 3091171,
//    "privacy": "hidden",
//    "layout": "blog",
//    "views": 35,
//    "link": "https://imgur.com/a/QhXyhn0",
//    "ups": 6,
//    "downs": 0,
//    "points": 6,
//    "score": 6,
//    "is_album": true,
//    "vote": null,
//    "favorite": false,
//    "nsfw": false,
//    "section": "",
//    "comment_count": 5,
//    "favorite_count": 0,
//    "topic": null,
//    "topic_id": null,
//    "images_count": 1,
//    "in_gallery": true,
//    "is_ad": false,
    var layout: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case datetime
        case cover
        case layout
        case images
        case coverWidth = "cover_width"
        case coverHeight = "cover_height"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        title = try container.decodeIfPresent(String.self, forKey: .title)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        images = try container.decodeIfPresent([Image].self, forKey: .images)
        datetime = try container.decodeIfPresent(Int.self, forKey: .datetime)
        cover = try container.decodeIfPresent(String.self, forKey: .cover)
        layout = try container.decodeIfPresent(String.self, forKey: .layout)
        coverWidth = try container.decodeIfPresent(Int.self, forKey: .coverWidth)
        coverHeight = try container.decodeIfPresent(Int.self, forKey: .coverHeight)
    }
}
