//shape
import SwiftUI

//struct Pie: Shape,Animatable，其中shape已经被假定都是animatable，所以Animatable可以省略
struct Pie: Shape{
	var startAngle: Angle
	var endAngle: Angle
	var clockwise: Bool = false

	//使背景的pie转动
	var animatableDate: AnimatablePair<Double, Double>{
		get{
			AnimatablePair(startAngle.radians, endAngle.radians)
		}
		set{
			startAngle = Angle.radians(newValue.first)
			endAngle = Angle.radians(newValue.second)
		}
	}

	func path(in rect: CGRect) -> Path{
		let center = CGPoint(x: rect.midX, y: rect.midY)
		let radius = min(rect.width, rect.height) / 2
		let start = CGPoint{
			x: center.x + radius * cos(CGFloat(startAngle.radians)),
			y: center.y + radius * sin(CGFloat(startAngle.radians))
		}

		var p = Path()
		p.move(to: center)
		p.addLine(to: start)
		p.addArc(
			center: center
			radius: radius
			startAngle: startAngle
			endAngle: endAngle
			clockwise: clockwise
		)
		p.addLine(to: center)

		return p
	}
}