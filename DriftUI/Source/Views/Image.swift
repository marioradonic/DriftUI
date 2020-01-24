import UIKit

public class Image: View {
  private let _imageView: UIImageView

  public init(_ image: UIImage) {
    _imageView = UIImageView(image: image)
    super.init(view: _imageView)
  }

  public init(_ imageView: UIImageView) {
    _imageView = imageView
    super.init(view: _imageView)
  }
}
