import UIKit

class SecondViewController: UIViewController {
    
    var stackofCircles: [UIView] = []
    let widthOfBall = 40
    let heightOfBall = 40
    var sequeendedString : String? = nil
    
    func random() -> CGFloat {
            return CGFloat(arc4random()) / CGFloat(UInt32.max)
        }
    
    func random() -> UIColor {
            return UIColor(
               red:   random(),
               green: random(),
               blue:  random(),
               alpha: 1.0
            )
        }
    
    @IBAction func close(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        let locationcircle = sender.location(in: view)
        let maxX = view.frame.width - 40
        let maxY = view.frame.height - 70
        let halfOfBall = CGFloat(widthOfBall / 2)
        
        for i in 0..<stackofCircles.count {
            if stackofCircles[i].frame.contains(locationcircle) {
                stackofCircles[i].removeFromSuperview()
                stackofCircles.remove(at: i)
                return
            }
        }

        if locationcircle.x - halfOfBall > 0 &&
            locationcircle.x < maxX + halfOfBall &&
            locationcircle.y < maxY &&
            locationcircle.y > halfOfBall {
            
            let circle = UIView()
            circle.frame = CGRect(x: locationcircle.x - halfOfBall,
                                  y: locationcircle.y - halfOfBall,
                                  width: CGFloat(widthOfBall),
                                  height: CGFloat(heightOfBall))
            circle.backgroundColor = random()
            stackofCircles.append(circle)
            circle.layer.cornerRadius = circle.frame.width / 2
            view.addSubview(circle)
                }
            
    }
    
    @IBSegueAction func stringfrom2to3(_ coder: NSCoder) -> ThirdViewController? {
        let newViewController = ThirdViewController(coder: coder)
        newViewController?.endedString = sequeendedString
        return newViewController
    }
    
}


