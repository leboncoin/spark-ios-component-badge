# Badge
A badge is a visual indicator for numeric values such as tallies and scores.

## Specifications
The badge specifications on Zeroheight is [here](https://spark.adevinta.com/1186e1705/p/8711ec-badge).

![Figma anatomy](https://github.com/adevinta/spark-ios-component-badge/blob/main/.github/assets/anatomy.png)

## Usage
Badge is available both in UIKit and SwiftUI. There are `BadgeUIView` and `BadgeView`. 

### BadgeUIView
**Parameters**:
* `theme`: The Spark-Theme. [You always can define your own theme.](https://github.com/adevinta/spark-ios/wiki/Theming#your-own-theming)
* `intent`: property of `BadgeIntentType`. There are different intent types available, such as: `alert`, `danger`, `info`, `neutral`, `main`, `support`, `success`, `accent`, and `basic`. Colors for badge are set based on these types.
* `size`: `.normal` by default. Also `.small` is available.
* `value`: `Int?` value that would be shown on the Badge. Pass `nil` to show empty circle.
* `format`: `BadgeFormat` property that determines text appearance. Available formats are: 
    * `.default` — simple number is shown
    * `.overflowCounter(maxValue:)` — define max value of the badge and everything that is more than `maxValue`, would be shown as `maxValue+`.
    * `custom(formatter:)` - you can define your own behaviour by implementing `formatter` that conforming to `BadgeFormatting` protocol with `func formatText(for: Int?) -> String`.
* `isBorderVisible`: Boolean property that determines should border be shown or not. `true` by default.

**Modifiers**:
To update Badge there are several functions available:
* `setIntent(BadgeIntentType)` — updates intent type.
* `setBorderVisible(Bool)` - updates outline state.
* `setValue(Int?)` — updates value.
* `setFormat(BadgeFormat)` — updates format.
* `setSize(BadgeSize)` — updates size.
* `setTheme(Theme)` — updates theme that is currently in use.

### BadgeView
**Parameters**:
* `theme`: The Spark-Theme. [You always can define your own theme.](https://github.com/adevinta/spark-ios/wiki/Theming#your-own-theming)
* `intent`: Badge intent type.
* `value`: `Int?` value that would be shown on the Badge. Pass `nil` to show empty circle.

**Modifiers**:
`BadgeView` view has `format` and `isBorderVisible` set by default to `.default` and `true`. 
There are modifiers for Badge:
* `.borderVisible(Bool) -> Self` where `Self` is `BadgeView`: updates outline state. 
* `.size(BadgeSize) -> Self` where `Self` is `BadgeView`: updates size.
* `.format(BadgeFormat) -> Self` where `Self` is `BadgeView`: updates format.
* `.theme(SparkTheme) -> Self` where `Self` is `BadgeView`: updates theme.
* `.value(Int?) -> Self` where `Self` is `BadgeView`: updates value.

## Examples
### BadgeUIView

```swift
let badgeView = BadgeUIView(
    theme: self.theme,
    intent: .main,
    size: .normal,
    value: 22,
    format: .overflowCounter(maxValue: 20)
)

let containerView = UIView()
containerView.translatesAutoresizingMaskIntoConstraints = false
let label = UILabel()
label.translatesAutoresizingMaskIntoConstraints = false
label.text = "Messages"

containerView.addSubview(label)
containerView.addSubview(badgeView)
NSLayoutConstraint.activate([
    label.leadingAnchor.constraint(greaterThanOrEqualTo: containerView.leadingAnchor),
    label.topAnchor.constraint(equalTo: containerView.topAnchor),
    label.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
    badgeView.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 5),
    badgeView.centerYAnchor.constraint(equalTo: label.centerYAnchor, constant: 0)
])
```

### BadgeView

```swift
@State var badgeValue: Int? = 3
@State var isBorderVisible: Bool = true
@State var format: BadgeFormat = .overflowCounter(maxValue: 10)

var body: some View {
    HStack {
        Text("Messages")
        BadgeView(
            theme: self.theme,
            intent: .main,
            value: badgeValue
        )
        .format(format)
        .borderVisible(isBorderVisible)
    }
}
```