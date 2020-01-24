import UIKit

public class Label: View {
  private let _label: UILabel

  public convenience init(_ text: String) {
    self.init(UILabel())
    _label.text = text
  }

  public init(_ label: UILabel = UILabel()) {
    _label = label
    super.init(view: label)
  }

  public func font(_ font: UIFont) -> Self {
    _label.font = font
    return self
  }

  public func color(_ color: UIColor) -> Self {
    _label.textColor = color
    return self
  }

  public func numberOfLines(_ number: Int) -> Self {
    _label.numberOfLines = number
    return self
  }

  public func lineHeight(_ height: CGFloat) -> Self {
    guard let text = _label.text, let font = _label.font, let color = _label.textColor else {
      assertionFailure("Text should be set before lineHeight")
      return self
    }
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.alignment = _label.textAlignment
    paragraphStyle.lineBreakMode = .byWordWrapping
    paragraphStyle.lineSpacing = height

    let attributedTitle = NSAttributedString(string: text,
                                             attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle,
                                                          NSAttributedString.Key.font: font,
                                                          NSAttributedString.Key.foregroundColor: color])
    _label.attributedText = attributedTitle
    return self
  }

  public func kern(_ kern: CGFloat) -> Self {
    guard let text = _label.text else {
      assertionFailure("Kerning should be set after the text")
      return self
    }
    _label.attributedText = NSMutableAttributedString(string: text, attributes: [NSAttributedString.Key.kern: kern])
    return self
  }
}
