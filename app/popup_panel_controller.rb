class PopupPanelController < TeacupWindowController
  POPUP_HEIGHT = 122
  PANEL_WIDTH = 280

  stylesheet :popup_panel

  # TODO: for multiple sliders, space using motion-layout or
  # getting correct values inside the stylesheet, somehow...
  layout do
    subview(NSSlider, :slider)
  end

  def loadWindow
    self.window = PopupPanel.alloc.init_popup(PANEL_WIDTH, POPUP_HEIGHT)
    self.window.delegate = self
  end

  def windowDidResignKey(notice)
    window.hide
  end

  def toggle
    if window.isVisible
      window.hide
    else
      event_frame = NSApp.currentEvent.window.frame
      window_frame = window.frame
      x = event_frame.origin.x +
        (event_frame.size.width / 2) - (window_frame.size.width / 2)
      y = event_frame.origin.y
      # more Point methods here: https://github.com/clayallsopp/geomotion
      # place sugarcube-coregraphics with the above...
      window.show([x, y])
    end
  end

  # if need async: https://github.com/mattgreen/elevate/
  def running_applications
    NSWorkspace.sharedWorkspace.runningApplications
  end
end
