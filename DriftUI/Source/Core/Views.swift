import UIKit

open class Views: View {
  public init(@ViewArrayFunctionBuilder builder: () -> [ViewBuilder]) {
    let view = UIView()
    super.init(view: view)
    builder().forEach {
      uiView.addSubview($0.uiView)
      $0.addedToSuperview(uiView)
    }
  }

  public override init(view: UIView) {
    super.init(view: view)
  }
}
