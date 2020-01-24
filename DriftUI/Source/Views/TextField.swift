import UIKit

open class TextField: View {
  public let _textField: UITextField

  public init() {
    _textField = UITextField()
    _textField.autocorrectionType = .no
    super.init(view: _textField)
  }

  public init(_ textField: UITextField) {
    _textField = textField
    _textField.autocorrectionType = .no
    super.init(view: _textField)
  }

  public func placeholder(_ placeholder: String) -> Self {
    _textField.placeholder = placeholder
    return self
  }

  public func keyboardType(_ type: UIKeyboardType) -> Self {
    _textField.keyboardType = type
    return self
  }

  public func inputView(builder: () -> ViewBuilder) -> Self {
    _textField.inputView = builder().uiView
    return self
  }

  public func borderStyle(_ borderStyle: UITextField.BorderStyle) -> Self {
    _textField.borderStyle = borderStyle
    return self
  }

  public func textColor(_ textColor: UIColor) -> Self {
    _textField.textColor = textColor
    return self
  }
}
