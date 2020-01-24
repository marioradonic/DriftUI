import UIKit

public class DatePicker: View {
  public let _datePicker = UIDatePicker()

  public init(mode: UIDatePicker.Mode = .date) {
    super.init(view: _datePicker)
    _datePicker.datePickerMode = mode
  }
}
