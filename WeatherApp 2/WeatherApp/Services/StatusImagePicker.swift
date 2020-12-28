import UIKit

class StatusImagePicker {
    private let imgs = ["clouds", "fog", "moon", "rain", "rainbow", "sky", "snow", "sun"]
    
    public func getImageByWeatherStatus(status: String) -> UIImage? {
        var pickedImg: UIImage? = nil
        
        imgs.forEach { (img) in
            if status.contains(img) {
                pickedImg = UIImage(named: img)
            }
        }
        return pickedImg
    }
 }
