import UIKit

class Transition: NSObject, UIViewControllerTransitioningDelegate {

    private let alertStyle: AlertControllerStyle

    init(alertStyle: AlertControllerStyle) {
        self.alertStyle = alertStyle
    }

#if swift(>=2.3)

    func presentationControllerForPresentedViewController(presented: UIViewController,
                                                          presentingViewController presenting: UIViewController?, sourceViewController source: UIViewController)
                    -> UIPresentationController? {
        return PresentationController(presentedViewController: presented, presentingViewController: presenting)
    }

#else

    func presentationControllerForPresentedViewController(presented: UIViewController,
                                                          presentingViewController presenting: UIViewController, sourceViewController source: UIViewController)
                    -> UIPresentationController? {
        return PresentationController(presentedViewController: presented, presentingViewController: presenting)
    }

#endif

    func animationControllerForPresentedController(presented: UIViewController,
                                                   presentingController presenting: UIViewController, sourceController source: UIViewController)
                    -> UIViewControllerAnimatedTransitioning? {
        if self.alertStyle == .ActionSheet {
            return nil
        }

        let animationController = AnimationController()
        animationController.isPresentation = true
        return animationController
    }

    func animationControllerForDismissedController(dismissed: UIViewController)
                    -> UIViewControllerAnimatedTransitioning? {
        return self.alertStyle == .Alert ? AnimationController() : nil
    }
}
