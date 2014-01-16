# class MenubarController
#   STATUS_ITEM_VIEW_WIDTH = 24.0

#   attr_accessor :status_item_view, :has_active_icon

#   def initialize
#     super.tap do
#       puts 'Initializing MenubarController'.black.on_white
#       status_item = NSStatusBar.systemStatusBar.statusItemWithLength(STATUS_ITEM_VIEW_WIDTH)

#       # TOOD: try symbols for names
#       image = NSImage.imageNamed('Status')
#       alternate_image = NSImage.imageNamed('StatusHighlighted')
#       images = { image: image, alternate_image: alternate_image }

#       @status_item_view = StatusItemView.new(status_item, images)
#       # @status_item_view.action = 'toggle_panel:'
#     end
#   end
# end
