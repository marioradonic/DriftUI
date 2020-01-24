import UIKit

public class VSpacer: View {
  public init(_ height: CGFloat) {
    super.init(view: UIView())
    _ = self.height(height)
  }
}

public class HSpacer: View {
  public init() {
    super.init(view: UIView())
    uiView.setContentHuggingPriority(.defaultLow, for: .horizontal)
  }
}
