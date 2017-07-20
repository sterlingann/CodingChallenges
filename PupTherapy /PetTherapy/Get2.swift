import Foundation

class Get {
    
    static let shared = Get()
    init() {}
    
     var repeatCheck = [String:Bool]()
    var callCount = 0
    
    func secondGiphData(giphARr: [[String]], completion: @escaping ([[String:Any]]) -> Void ) {
        let disGroup = DispatchGroup()
        
        var exitArr = [[String:Any]]()
        
        for giph in giphARr {
            
            var urlStr = giph[0]
            
            if urlStr.isEmpty == false {
                
                disGroup.enter()
                
                var urlStrChars = Array(urlStr.characters)
                
                //Sometimes Giphy gives URLS with httpss which fails.
                if urlStrChars[5] == Character("s")
                {
                    urlStrChars.remove(at: 5)
                    
                    urlStr = String(urlStrChars)
                }
                
                let url = URL(string: "\(urlStr)")
                
                let task = URLSession.shared.dataTask(with: url!)
                {
                    (data, response, error) in
                    
                    if error != nil
                    {
                        print("there is an error -SL get2", error ?? "")
                    }
                        
                    else
                    {                        
                        exitArr.append([kURL:url!, kData:data!, kName:""])
                        
                        disGroup.leave()
                    }
                }
                
                task.resume()
            }
            
        }
        disGroup.notify(queue: .main) {
            
            completion(exitArr)
        }
     }//func secondGifphData
}//Class Get
