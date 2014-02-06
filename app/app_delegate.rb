require 'pulseaudio'

class AppDelegate
  # attr_reader :status_item_controller

  def applicationDidFinishLaunching(notification)
    connect_to_pulse
  end

  def connect_to_pulse
    @context = ::PulseAudio::Asynchronous::Context.new
    set_subscribe_callback
    set_state_callback
    @context.connect
    @context.start # extract into loop object, see examples
  end

  def set_subscribe_callback
    @context.subscribe_callback_proc =
    proc do |context, facility, event_type, index, user_data|
      puts "#{facility} #{event_type} #{index}".yellow
    end
  end

  def set_state_callback
    @context.state_callback_proc =
    proc do |context, user_data|
      puts "Connection state has changed to #{context.state}"
      if context.ready?
        puts 'Connect: ready'.green
        ready
      elsif context.terminated?
        puts 'Terminated'.red
        # TODO: terminate thread
      end
    end
  end

  def ready
    puts "I am connected, my index is #{@context.index}"
    @context.operation.clients.all do |operation, list, user_data|
      puts 'List of all clients:'.underline
      puts list.size
      #inspect(list)
    end
    @context.subscribe! :all do |context, success, user_data|
      puts 'Subscribe: success'.green
    end
    @context.operation.sinks.all do |operation, list, user_data|
      puts 'List of all sinks:'.underline
      puts list.size
      #inspect(list)
    end
    @context.operation.sources.all do |operation, list, user_data|
      puts 'List of all sources:'.underline
      puts list.size
      #inspect(list)
    end
    @context.sink_inputs.all do |operation, list, user_data|
      puts 'List of all sink inputs:'.underline
      puts list.size
    end
    @context.operation.source_outputs.all do |operation, list, user_data|
      puts 'List of all source outputs:'.underline
      puts list.size
    end
  end

  def inspect(list)
    list.each { |i| ap(i, raw: true) }
  end
end

# def build_status_item(popup_panel_controller)
#   # TODO: begin here?
#   status_item_controller = StatusItemController.new(popup_panel_controller)
#   status_item_controller.status_item.setTitle(@app_name)
#   # TODO: popup_panel_controller.status_item = status_item_controller.status_item
# end

# def build_popup_panel
#   PopupPanelController.new
# end
