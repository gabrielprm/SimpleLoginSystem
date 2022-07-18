import UIKit

class CustomShapeView: UIView {
    
    private var screenSize: CGRect {
        return UIScreen.main.bounds
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = .clear
    }

    override func draw(_ rect: CGRect) {
        let size = self.bounds.size
        let h = size.height * 0.85
        
        let p1 = self.bounds.origin
        let p2 = CGPoint(x:p1.x + size.width, y:p1.y)
        let p3 = CGPoint(x:p2.x, y:p2.y + h)
        let curve1 = CGPoint(x:p2.x * 0.45, y: p3.y)
        let curve1Control1 = CGPoint(x: p2.x * 0.8, y: p3.y * 0.9)
        let curve1Control2 = CGPoint(x: p2.x * 0.6, y: p3.y * 0.95)
        let curve2 = CGPoint(x: p1.x, y: p3.y)
        let curve2Control1 = CGPoint(x: p2.x * 0.30, y: p3.y * 1.05)
        let curve2Control2 = CGPoint(x: p2.x * 0.15, y: p3.y * 1.05)
        
        let path = UIBezierPath()
        path.move(to: p1)
        path.addLine(to: p2)
        path.addLine(to: p3)
        path.addCurve(to: curve1, controlPoint1: curve1Control1, controlPoint2: curve1Control2)
        path.addCurve(to: curve2, controlPoint1: curve2Control1, controlPoint2: curve2Control2)
        path.addLine(to: p1)
        path.close()

        UIColor.rgb(red: 188, green: 196, blue: 247).set()
        path.fill()
    }
 
}

