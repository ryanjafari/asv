class AppDelegate
  attr_reader :status_item_controller

  def applicationDidFinishLaunching(notification)
    # TODO: BubbleWrap
    @app_name = NSBundle.mainBundle.infoDictionary['CFBundleDisplayName']
    @popup_panel_controller = build_popup_panel
    @status_item_controller = build_status_item(@popup_panel_controller)
  end

  def build_status_item(popup_panel_controller)
    # TODO: begin here?
    status_item_controller = StatusItemController.new(popup_panel_controller)
    status_item_controller.status_item.setTitle(@app_name)
    # TODO: popup_panel_controller.status_item = status_item_controller.status_item
  end

  def build_popup_panel
    PopupPanelController.new
  end
end
