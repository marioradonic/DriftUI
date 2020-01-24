import RxSwift
import UIKit

@_functionBuilder
public class ViewArrayFunctionBuilder {
  public static func buildBlock(_ children: ViewBuilder...) -> [ViewBuilder] {
    return children
  }
}

public protocol ViewBuilder {
  var uiView: UIView { get }
  var disposables: [Disposable] { get }
  func whenAddedToSuperview(block: @escaping (UIView) -> Void)
  func addedToSuperview(_ superview: UIView)
}

extension ViewBuilder {
  public var fullWidth: Self {
    return fullWidth(margins: 16)
  }

  public func fullWidth(margins: CGFloat) -> Self {
    let view = uiView
    whenAddedToSuperview { superview in
      view.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: margins).isActive = true
      view.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -margins).isActive = true
      view.translatesAutoresizingMaskIntoConstraints = false
    }

    return self
  }

  public func fullHeight(margins: CGFloat = 0) -> Self {
    let view = uiView
    whenAddedToSuperview { superview in
      view.topAnchor.constraint(equalTo: superview.topAnchor, constant: margins).isActive = true
      view.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: margins).isActive = true
      view.translatesAutoresizingMaskIntoConstraints = false
    }

    return self
  }

  public var fullSized: Self {
    let view = uiView
    whenAddedToSuperview { superview in
      view.autoPin(to: superview)
    }

    return self
  }

  public var center: Self {
    let view = uiView
    whenAddedToSuperview { superview in
      view.centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
      view.centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
      view.translatesAutoresizingMaskIntoConstraints = false
    }

    return self
  }

  public var centerVertically: Self {
    let view = uiView
    whenAddedToSuperview { superview in
      view.centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
      view.translatesAutoresizingMaskIntoConstraints = false
    }

    return self
  }

  public var centerHorizontally: Self {
    let view = uiView
    whenAddedToSuperview { superview in
      view.centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
      view.translatesAutoresizingMaskIntoConstraints = false
    }

    return self
  }

  public var pinToBottom: Self {
    return pinToBottom(offset: 0)
  }

  public func pinToBottom(offset: CGFloat) -> Self {
    let view = uiView
    whenAddedToSuperview { superview in
      view.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -offset).isActive = true
      view.translatesAutoresizingMaskIntoConstraints = false
    }

    return self
  }

  public func pinToTop(offset: CGFloat = 0) -> Self {
    let view = uiView
    whenAddedToSuperview { superview in
      view.topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor, constant: offset).isActive = true
      view.translatesAutoresizingMaskIntoConstraints = false
    }

    return self
  }

  public func backgroundColor(_ color: UIColor) -> Self {
    uiView.backgroundColor = color
    return self
  }

  public func frame(_ frame: CGRect) -> Self {
    uiView.frame = frame
    return self
  }

  public func hide(if condition: Bool) -> Self {
    uiView.isHidden = condition
    return self
  }

  public func height(_ value: CGFloat) -> Self {
    uiView.heightAnchor.constraint(equalToConstant: value).isActive = true
    uiView.translatesAutoresizingMaskIntoConstraints = false
    return self
  }

  public func cornerRadius(_ value: CGFloat) -> Self {
    uiView.layer.cornerRadius = value

    return self
  }

  public func border(color: UIColor, width: CGFloat) -> Self {
    uiView.layer.borderColor = color.cgColor
    uiView.layer.borderWidth = width
    return self
  }

  public func shadow(radius: CGFloat, offsetX: CGFloat, offsetY: CGFloat, color: UIColor) -> Self {
    let layer = uiView.layer
    layer.shadowColor = color.cgColor
    layer.shadowOffset = .init(width: offsetX, height: offsetY)
    layer.shadowRadius = radius
    layer.shadowOpacity = 1

    return self
  }

  public var clipsToBounds: Self {
    uiView.clipsToBounds = true
    return self
  }
}
