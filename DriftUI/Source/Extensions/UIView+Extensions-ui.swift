import UIKit

extension UIView {
  func autoPin(to other: UIView) {
    leadingAnchor.constraint(equalTo: other.leadingAnchor).isActive = true
    trailingAnchor.constraint(equalTo: other.trailingAnchor).isActive = true
    topAnchor.constraint(equalTo: other.topAnchor).isActive = true
    bottomAnchor.constraint(equalTo: other.bottomAnchor).isActive = true
    translatesAutoresizingMaskIntoConstraints = false
  }
}
