//
//  CircularTransition.swift
//  Scrappy
//
//  Created by Isaac Gonzalez on 5/17/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

class CircularTransition: NSObject {
    
     var circle = UIView()
    
     var startingPoint = CGPoint.zero {
        didSet {
            circle.center = startingPoint
        }
    }
    
    var circleColor = UIColor.white
    
    var duration = 0.3
    
    enum CircularTransitionMode: Int {
        case present, dismiss, pop, show
    }
    
    var transitionMode: CircularTransitionMode = .present
}


extension CircularTransition: UIViewControllerAnimatedTransitioning {
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView = transitionContext.containerView
        
        if transitionMode == .present {
            if let presentedView = transitionContext.view(forKey: .to) {
                let viewCenter = presentedView.center
                let viewSize = presentedView.frame.size
                
                circle = UIView()
                circle.frame = frameForCircle(viewCenter: viewCenter, viewSize: viewSize, startingPoint: startingPoint)
                circle.layer.cornerRadius = circle.frame.size.height/2
                circle.center = startingPoint
                circle.backgroundColor = UIColor.white
                circle.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                containerView.addSubview(circle)
                
                presentedView.center = startingPoint
                presentedView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                presentedView.alpha = 0
                containerView.addSubview(presentedView)
                
                UIView.animate(withDuration: duration, animations: {
                    self.circle.transform = CGAffineTransform.identity
                    presentedView.transform = CGAffineTransform.identity
                    presentedView.alpha = 1
                    presentedView.center = viewCenter
                }) { (success) in
                    transitionContext.completeTransition(success)
                }
            } else {
                let tranisitionKey = (transitionMode == .pop) ? UITransitionContextViewKey.to : UITransitionContextViewKey.from
                if let returningView = transitionContext.view(forKey: tranisitionKey) {
                    let viewCenter = returningView.center
                    let viewSize = returningView.frame.size
                    
                    circle.frame = frameForCircle(viewCenter: viewCenter, viewSize: viewSize, startingPoint: startingPoint)
                    circle.layer.cornerRadius = circle.frame.size.height/2
                    circle.center = startingPoint
                    
                    UIView.animate(withDuration: duration, animations: {
                        self.circle.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                        returningView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                        returningView.center = self.startingPoint
                        returningView.alpha = 0
                        if self.transitionMode == .pop {
                            containerView.insertSubview(returningView, belowSubview: returningView)
                            containerView.insertSubview(self.circle, belowSubview: returningView)
                        }
                    }) { (success) in
                        returningView.center = viewCenter
                        returningView.removeFromSuperview()
                        self.circle.removeFromSuperview()
                        transitionContext.completeTransition(success)
                    }
                    
                    
                }
            }
        }
    }
    
    
    
    func frameForCircle(viewCenter: CGPoint, viewSize: CGSize, startingPoint: CGPoint) -> CGRect {
        let xLength = fmax(startingPoint.x, viewSize.width - startingPoint.x)
        let yLength = fmax(startingPoint.y, viewSize.height - startingPoint.y)
        
        let offSetVector = sqrt(xLength * xLength + yLength * yLength) * 2
        let size = CGSize(width: offSetVector, height: offSetVector)
        
        return CGRect(origin: CGPoint.zero, size: size)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}
