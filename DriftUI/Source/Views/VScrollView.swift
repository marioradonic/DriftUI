import UIKit

public class VScrollView: View {
  private let _scrollView = UIScrollView()

  public override init(builder: () -> ViewBuilder) {
    super.init(view: _scrollView)
    let viewBuilder = builder()
    _scrollView.addSubview(viewBuilder.uiView)
    viewBuilder.uiView.autoPin(to: _scrollView)
    _scrollView.widthAnchor.constraint(equalTo: viewBuilder.uiView.widthAnchor).isActive = true
    _scrollView.translatesAutoresizingMaskIntoConstraints = false
  }
}
