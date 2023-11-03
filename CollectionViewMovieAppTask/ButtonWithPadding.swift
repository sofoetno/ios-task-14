

import UIKit

class ButtonWithPadding: UIButton {
    var padding: UIEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)

    override var contentEdgeInsets: UIEdgeInsets {
        get {
            return padding
        }
        set {
            super.contentEdgeInsets = newValue
        }
    }

    func setPadding(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) {
        padding.top = top
        padding.left = left
        padding.bottom = bottom
        padding.right = right
    }
}
