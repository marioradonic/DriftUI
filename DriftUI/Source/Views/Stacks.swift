import UIKit

public class Stack: Views {
  let _stackView: UIStackView

  public override init(@ViewArrayFunctionBuilder builder: () -> [ViewBuilder]) {
    _stackView = UIStackView()
    super.init(view: _stackView)

    builder().forEach {
      _stackView.addArrangedSubview($0.uiView)
      $0.addedToSuperview(_stackView)
    }
  }

  public func spacing(_ spacing: CGFloat) -> Self {
    _stackView.spacing = spacing
    return self
  }

  public func distribution(_ value: UIStackView.Distribution) -> Self {
    _stackView.distribution = value
    return self
  }

  public func alignment(_ alignment: UIStackView.Alignment) -> Self {
    _stackView.alignment = alignment
    return self
  }
}

public class VStack: Stack {
  public override init(@ViewArrayFunctionBuilder builder: () -> [ViewBuilder]) {
    super.init(builder: builder)
    _stackView.axis = .vertical
  }
}

public class HStack: Stack {
  public override init(@ViewArrayFunctionBuilder builder: () -> [ViewBuilder]) {
    super.init(builder: builder)
    _stackView.axis = .horizontal
  }
}
