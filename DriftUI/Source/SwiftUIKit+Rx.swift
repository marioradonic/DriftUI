import RxCocoa
import RxRelay
import RxSwift
import UIKit

public struct ViewDisposable<View: ViewBuilder>: ViewBuilder {
  public var uiView: UIView {
    return view.uiView
  }

  public func whenAddedToSuperview(block: @escaping (UIView) -> Void) {
    view.whenAddedToSuperview(block: block)
  }

  public func addedToSuperview(_ superview: UIView) {
    view.addedToSuperview(superview)
  }

  public let view: View
  public let disposables: [Disposable]
}

public extension ViewBuilder {
  var rx: ViewDisposable<Self> {
    return ViewDisposable(view: self, disposables: [])
  }
}

public extension ViewDisposable where View: Button {
  func onTap<Event>(send event: Event, to relay: PublishRelay<Event>) -> Self {
    let disposable = view._button.rx.tap.map { event }.bind(to: relay)
    return ViewDisposable(view: view, disposables: disposables + [disposable])
  }

  func isSelected(from obs: Observable<Bool>) -> Self {
    let disposable = obs.subscribe(view._button.rx.isSelected)
    return ViewDisposable(view: view, disposables: disposables + [disposable])
  }

  func isEnabled(from obs: Observable<Bool>) -> Self {
    let disposable = obs.bind(to: view._button.rx.isEnabled)
    return ViewDisposable(view: view, disposables: disposables + [disposable])
  }
}

public extension ViewDisposable where View: DatePicker {
  func onDateChange<Event>(send event: @escaping (Date) -> Event, to relay: PublishRelay<Event>) -> Self {
    let disposable = view._datePicker.rx.date.map { event($0) }.bind(to: relay)
    return ViewDisposable(view: view, disposables: disposables + [disposable])
  }

  func bindDate(from relay: Observable<Date>) -> Self {
    let disposable = relay.bind(to: view._datePicker.rx.date)
    return ViewDisposable(view: view, disposables: disposables + [disposable])
  }
}

public extension ViewDisposable where View: TextField {
  func onTextChange<Event>(send event: @escaping (String) -> Event, to relay: PublishRelay<Event>) -> Self {
    let disposable = view._textField.rx.text.orEmpty.map { event($0) }.bind(to: relay)
    return ViewDisposable(view: view, disposables: disposables + [disposable])
  }

  func bindText(from relay: Observable<String>) -> Self {
    let disposable = relay.bind(to: view._textField.rx.text)
    return ViewDisposable(view: view, disposables: disposables + [disposable])
  }
}

public extension ViewDisposable where View: Activity {
  func isAnimating(from obs: Observable<Bool>) -> Self {
    let disposable = obs.bind(to: view._activityIndicatorView.rx.isAnimating)
    return ViewDisposable(view: view, disposables: disposables + [disposable])
  }
}
