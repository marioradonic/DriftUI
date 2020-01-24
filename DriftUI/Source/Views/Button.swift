import UIKit

open class Button: View {
  public let _button: UIButton

  public init(type: UIButton.ButtonType = .system) {
    _button = UIButton(type: type)
    super.init(view: _button)
  }

  public init(_ button: UIButton) {
    _button = button
    super.init(view: button)
  }

  public func title(_ title: String) -> Self {
    _button.setTitle(title, for: .normal)
    return self
  }

  public func titleColor(_ color: UIColor) -> Self {
    _button.setTitleColor(color, for: .normal)
    return self
  }

  public func font(_ font: UIFont) -> Self {
    _button.titleLabel?.font = font
    return self
  }

  public func backgroundImage(_ image: UIImage?, forState state: UIButton.State) -> Self {
    _button.setBackgroundImage(image, for: state)
    return self
  }
}
