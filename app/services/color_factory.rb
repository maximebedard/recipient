class ColorFactory
  def self.create_random_pastel(mix: Color.new(red: 255, green: 255, blue: 255))
    Color.new(
      red:   (Kernel.rand(256) + mix.red) / 2,
      green: (Kernel.rand(256) + mix.green) / 2,
      blue:  (Kernel.rand(256) + mix.blue) / 2
    )
  end

  class Color
    RGB_COMPONENTS = [:red, :green, :blue]
    HSL_COMPONENTS = [:hue, :saturation, :lightness]
    attr_reader :red, :green, :blue, :hue, :saturation, :lightness

    def initialize(red:0, green:0, blue:0)
      @red = red
      @green = green
      @blue = blue
    end

    # def initialize(_hue:0, _saturation:0, _lightness:0)
    # end

    def to_hex
      RGB_COMPONENTS.map { |comp| send(comp).to_s(16) } .join.upcase
    end
  end
end
