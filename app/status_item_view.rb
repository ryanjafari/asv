# class StatusItemView < NSView
#   alias :'super_initWithFrame:' :'initWithFrame:'

#   attr_accessor :status_item, :image, :alternate_image, :action

#   attr_reader :highlighted, :target

#   def initialize(status_item, images)
#     puts 'Initializing StatusItemView'.black.on_white
#     item_width = status_item.length
#     item_height = NSStatusBar.systemStatusBar.thickness
#     item_rect = NSMakeRect(0.0, 0.0, item_width, item_height)

#     @image = images[:image]
#     @alternate_image = images[:alternate_image]

#     # see if we can toss this and use self.initWithFrame,
#     # return self, and remove the extra initWithFrame below
#     super_initWithFrame(item_rect).tap do
#       puts 'Starting initialization'.black.on_white
#       @status_item = status_item
#       # @status_item.setHighlightMode(true)
#       @status_item.view = self
#       puts 'Finished initializing StatusItemView'.black.on_white
#     end
#   end

#   def initWithFrame(rect)
#     puts 'YOYO'.black.on_white
#     # @image = nil
#     # @alternate_image = nil
#     # super
#   end

#   def drawRect(dirty_rect)
#     puts 'Drawing StatusItemView rect'

#     @status_item.drawStatusBarBackgroundInRect(dirty_rect, withHighlight: @highlighted)
#     icon = @highlighted ? @alternate_image : @image

#     puts "=> image = #{@image.name}".yellow
#     puts "=> alternate_image = #{@alternate_image.name}".yellow

#     icon_size = icon.size
#     bounds = self.bounds
#     puts "=> bounds = #{bounds}".yellow

#     icon_x = ((NSWidth(bounds) - icon_size.width) / 2).round
#     icon_y = ((NSHeight(bounds) - icon_size.height) / 2).round

#     puts "=> icon_x = #{icon_x}".yellow
#     puts "=> icon_y = #{icon_y}".yellow

#     icon_point = NSMakePoint(icon_x, icon_y)

#     icon.drawAtPoint(icon_point, fromRect: NSZeroRect, operation: NSCompositeSourceOver, fraction: 1.0)
#   end

#   def mouseDown(event)
#     #puts "status_item_view was clicked".green
#     NSApp.sendAction(@action, to: self.target, from: self)
#   end

#   def global_rect
#     frame = self.frame
#     frame.origin = window.convertBaseToScreen(frame.origin)
#     puts "frame.origin.x = #{frame.origin.x}"
#     frame
#   end
# end
