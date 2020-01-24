import UIKit

open class TextView: View {
  public let _textView: UITextView

  public init() {
    _textView = UITextView()
    _textView.autocorrectionType = .no
    super.init(view: _textView)
  }

  public init(_ textField: UITextView) {
    _textView = textField
    _textView.autocorrectionType = .no
    super.init(view: _textView)
  }

  public func keyboardType(_ type: UIKeyboardType) -> Self {
    _textView.keyboardType = type
    return self
  }
}
