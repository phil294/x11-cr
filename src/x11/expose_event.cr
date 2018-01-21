require "./c/Xlib"
require "./window_event"

module X11
  # Wrapper from `X11::C::X::ExposeEvent` structure.
  class ExposeEvent < WindowEvent
    def initialize
      @event = X11::C::X::ExposeEvent.new
    end

    def initialize(event : X11::C::X::PExposeEvent)
      raise BadAllocException.new if event.null?
      @event = event.value
    end

    def initialize(@event : X11::C::X::ExposeEvent)
    end

    def to_unsafe : X11::C::X::PExposeEvent
      return pointerof(@event)
    end

    def to_x : X11::C::X::ExposeEvent
      @event
    end

    def type : Int32
      @event.type
    end

    def type=(type : Int32)
      @event.type = type
    end

    def serial : UInt64
      @event.serial
    end

    def serial=(serial : UInt64)
      @event.serial = serial
    end

    def send_event : Bool
      @event.send_event ? true : false
    end

    def send_event=(send_event : Bool)
      @event.send_event = send_event ? 1 : 0
    end

    def display : Display
      Display.new @event.display
    end

    def display=(display : Display)
      @event.display = display.to_unsafe
    end

    def window : X11::C::Window
      @event.window
    end

    def window=(window : X11::C::Window)
      @event.window = window
    end

    def x : Int32
      @event.x
    end

    def x=(x : Int32)
      @event.x = x
    end

    def y : Int32
      @event.y
    end

    def y=(y : Int32)
      @event.y = y
    end

    def width : Int32
      @event.width
    end

    def width=(width : Int32)
      @event.width = width
    end

    def height : Int32
      @event.height
    end

    def height=(height : Int32)
      @event.height = height
    end

    def count : Int32
      @event.count
    end

    def count=(count : Int32)
      @event.count = count
    end
  end
end
