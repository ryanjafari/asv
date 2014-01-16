class PopupPanel < NSPanel
  def init_popup(width, height)
    initWithContentRect(NSMakeRect(0, 0, width, height),
                        styleMask: NSUtilityWindowMask ||
                        NSNonactivatingPanelMask,
                        backing: NSBackingStoreBuffered,
                        defer: true)

    init_appearance
    init_behavior
    init_background_view

    self
  end

  def init_appearance
    setHasShadow(true)
    setAllowsToolTipsWhenApplicationIsInactive(false)
    setShowsToolbarButton(false)
    setOpaque(false)
    setBackgroundColor(NSColor.clearColor)
  end

  def init_behavior
    setReleasedWhenClosed(false)
    setHidesOnDeactivate(false)
    setAutorecalculatesKeyViewLoop(false)
    setRestorable(false)
    setAcceptsMouseMovedEvents(true)
    setCollectionBehavior(NSWindowCollectionBehaviorMoveToActiveSpace ||
                          NSWindowCollectionBehaviorIgnoresCycle)
    setAnimationBehavior(NSWindowAnimationBehaviorNone)
    setOneShot(false)
  end

  def init_background_view
    @background_view = PopupBackgroundView.alloc.initWithFrame(frame)
    # TODO: move this into the background_view
    @background_view.setAutoresizesSubviews(true)
    setContentView(@background_view)
  end

  def hide
    orderOut(false)
  end

  def show(point)
    setFrameTopLeftPoint(point)
    @background_view.arrow_x = frame.size.width / 2
    NSApp.activateIgnoringOtherApps(true)
    makeKeyAndOrderFront(self)
  end

  def canBecomeKeyWindow
    true
  end
end
