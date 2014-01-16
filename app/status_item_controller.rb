class StatusItemController
  attr_reader :status_item

  def initialize(target)
    super.tap do
      @status_item = NSStatusBar
      .systemStatusBar
      .statusItemWithLength(NSVariableStatusItemLength).init
      # TODO: status item should highlight until toggled
      @status_item.setHighlightMode(true)
      @status_item.setTitle('test')
      @status_item.setTarget(target)
      @status_item.setAction('toggle')
    end
  end
end
