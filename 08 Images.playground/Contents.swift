import UIKit
import PlaygroundSupport
import AVFoundation

final class CustomView: UIView {
	override func draw(_ rect: CGRect) {
		guard let context = UIGraphicsGetCurrentContext() else { return }

		let colorSpace = CGColorSpaceCreateDeviceRGB()
		let color = CGColor(colorSpace: colorSpace, components: [1, 1, 1, 1])!

		context.setFillColor(color)
		context.fill(bounds)

		let image = #imageLiteral(resourceName: "Yosemite@2x.png")
//		image.draw(in: bounds)

		context.saveGState()

		context.translateBy(x: bounds.midX, y: bounds.midY)
		context.scaleBy(x: 1, y: -1)
		context.translateBy(x: -bounds.midX, y: -bounds.midY)

		let rect = AVMakeRect(aspectRatio: image.size, insideRect: bounds)
		context.draw(image.cgImage!, in: rect)

		context.setBlendMode(.overlay)

		context.draw(#imageLiteral(resourceName: "Underwater@2x.png").cgImage!, in: bounds)

		context.restoreGState()
	}
}

PlaygroundPage.current.liveView = CustomView(frame: CGRect(x: 0, y: 0, width: 320, height: 320))
