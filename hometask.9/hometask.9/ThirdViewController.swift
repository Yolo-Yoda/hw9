import UIKit

class ThirdViewController: UIViewController {
    
    var endedString: String? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        callball()
    }
    
    func callball() {
        ball.frame = CGRect(x: view.frame.width / 2 - 25,
                            y: view.frame.height / 2 - 25,
                            width: 50,
                            height: 50)
        ball.backgroundColor = .lightGray
        ball.layer.cornerRadius = 25
    }
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
    
    @IBOutlet weak var ball: UIView!
    
    @IBAction func close(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }

    @IBAction func tapAction(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view)
        if let view = sender.view {
            view.center = CGPoint(x: view.center.x + translation.x,
                                  y: view.center.y + translation.y)
        }
        sender.setTranslation(CGPoint.zero, in: self.view)
        sender.view?.backgroundColor = random()
    }
    
    @IBSegueAction func strinfFrom3to4(_ coder: NSCoder) -> FourthViewController? {
        let newViewController = FourthViewController(coder: coder)
        newViewController?.endString = endedString
        return newViewController
    }
    
}
