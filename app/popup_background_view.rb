class PopupBackgroundView < NSView
  # TODO: sugarcube pixels?
  ARROW_WIDTH = 12
  ARROW_HEIGHT = 8

  FILL_OPACITY = 0.9
  STROKE_OPACITY = 1.0

  LINE_THICKNESS = 1.0
  CORNER_RADIUS = 6.0

  SEARCH_INSET = 10.0

  def drawRect(dirty_rect)
    content_rect = NSInsetRect(bounds, LINE_THICKNESS, LINE_THICKNESS)
    path = NSBezierPath.bezierPath

    path.moveToPoint(NSMakePoint(@arrow_x, NSMaxY(content_rect)))
    path.lineToPoint(NSMakePoint(@arrow_x + ARROW_WIDTH / 2, NSMaxY(content_rect) - ARROW_HEIGHT))
    path.lineToPoint(NSMakePoint(NSMaxX(content_rect) - CORNER_RADIUS, NSMaxY(content_rect) - ARROW_HEIGHT))

    top_right_corner = NSMakePoint(NSMaxX(content_rect), NSMaxY(content_rect) - ARROW_HEIGHT)
    path.curveToPoint(NSMakePoint(NSMaxX(content_rect), NSMaxY(content_rect) - ARROW_HEIGHT - CORNER_RADIUS), controlPoint1: top_right_corner, controlPoint2: top_right_corner)

    path.lineToPoint(NSMakePoint(NSMaxX(content_rect), NSMinY(content_rect) + CORNER_RADIUS))

    bottom_right_corner = NSMakePoint(NSMaxX(content_rect), NSMinY(content_rect))
    path.curveToPoint(NSMakePoint(NSMaxX(content_rect) - CORNER_RADIUS, NSMinY(content_rect)), controlPoint1: bottom_right_corner, controlPoint2: bottom_right_corner)

    path.lineToPoint(NSMakePoint(NSMinX(content_rect) + CORNER_RADIUS, NSMinY(content_rect)))

    path.curveToPoint(NSMakePoint(NSMinX(content_rect), NSMinY(content_rect) + CORNER_RADIUS), controlPoint1: content_rect.origin, controlPoint2: content_rect.origin)

    path.lineToPoint(NSMakePoint(NSMinX(content_rect), NSMaxY(content_rect) - ARROW_HEIGHT - CORNER_RADIUS))

    top_left_corner = NSMakePoint(NSMinX(content_rect), NSMaxY(content_rect) - ARROW_HEIGHT)
    path.curveToPoint(NSMakePoint(NSMinX(content_rect) + CORNER_RADIUS, NSMaxY(content_rect) - ARROW_HEIGHT), controlPoint1: top_left_corner, controlPoint2: top_left_corner)

    path.lineToPoint(NSMakePoint(@arrow_x - ARROW_WIDTH / 2, NSMaxY(content_rect) - ARROW_HEIGHT))
    path.closePath

    # TODO: the gem with colors
    NSColor.colorWithDeviceWhite(1, alpha: FILL_OPACITY).setFill
    path.fill

    NSGraphicsContext.saveGraphicsState

    clip = NSBezierPath.bezierPathWithRect(bounds)
    clip.appendBezierPath(path)
    clip.addClip

    path.setLineWidth(LINE_THICKNESS * 2)
    NSColor.whiteColor.setStroke
    path.stroke

    NSGraphicsContext.restoreGraphicsState
  end

  def arrow_x=(value)
    @arrow_x = value
    setNeedsDisplay(true)
  end
end
