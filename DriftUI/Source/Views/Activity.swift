import UIKit

public class Activity: View {
  let _activityIndicatorView: UIActivityIndicatorView

  public init(_ activityIndicatorView: UIActivityIndicatorView) {
    _activityIndicatorView = activityIndicatorView
    super.init(view: _activityIndicatorView)

    _activityIndicatorView.hidesWhenStopped = true
  }

  public init() {
    _activityIndicatorView = UIActivityIndicatorView()
    super.init(view: _activityIndicatorView)

    _activityIndicatorView.hidesWhenStopped = true
  }
}
