

import UIKit

class Gif: NSObject, NSCoding {
    var url:URL!
    var data:Data?
    var name:String?
    var youtubeURL:String?
    
    init(withDictionary dic:NSDictionary) {
        url         = dic.value(forKey: kURL) as! URL
        data        = dic.value(forKey: kData) as? Data
        name        = dic.value(forKey: kName) as? String
        youtubeURL  = dic.value(forKey: kYoutubeURL) as? String
    }
    
    required convenience init?(coder decoder: NSCoder) {
        guard let url = decoder.decodeObject(forKey: "url") as? URL!,
            let data = decoder.decodeObject(forKey: "data") as? Data?,
            let name = decoder.decodeObject(forKey: "name") as? String?,
            let youtubeURL = decoder.decodeObject(forKey: "youtubeURL") as? String?
            else {return nil}
        
        self.init(withDictionary:
            [
                kURL : url,
                kData : data ?? "no data",
                kName : name ?? "no data",
                kYoutubeURL: youtubeURL ?? "no data"
           ]
        )
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.url, forKey: "url")
        aCoder.encode(self.data, forKey: "data")
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.youtubeURL, forKey: "youtubeURL")
    }
}

