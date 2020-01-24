import RxSwift
import UIKit

open class View: ViewBuilder {
  public let uiView: UIView

  public var disposables: [Disposable] = []

  private var _onAddToSuperviewBlocks = [(UIView) -> Void]()
  public func whenAddedToSuperview(block: @escaping (UIView) -> Void) {
    _onAddToSuperviewBlocks.append(block)
  }

  public func addedToSuperview(_ superview: UIView) {
    _onAddToSuperviewBlocks.forEach { $0(superview) }
  }

  public init(builder: () -> ViewBuilder) {
    uiView = UIView()
    let view = builder()
    uiView.addSubview(view.uiView)
    view.addedToSuperview(uiView)
  }

  public init(view: UIView) {
    uiView = view
  }

  public init(view: UIView, builder: () -> ViewBuilder) {
    uiView = view
    let view = builder()
    uiView.addSubview(view.uiView)
    disposables.append(contentsOf: view.disposables)
    view.addedToSuperview(uiView)
  }

  public func addDisposables(to disposeBag: DisposeBag) -> Self {
    disposables.forEach { $0.disposed(by: disposeBag) }
    return self
  }
}
