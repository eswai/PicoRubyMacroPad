# Initialize a Keyboard
kbd = Keyboard.new

# Initialize GPIO assign
kbd.init_pins(
  [ 2, 3, 4 ], # row0, row1,... respectively
  [ 6, 7, 8, 9, 10] # col0, col1,... respectively
)

# default layer should be added at first
# +---------+---------+---------+---------+---------+
kbd.add_layer :default, %i[
  KC_TAB    KC_P      KC_I      KC_C      KC_O 
  KC_R      KC_U      KC_B      KC_Y      KC_ENT
  KC_SPACE
]
# +---------+---------+---------+---------+---------+

# Tip: You can also switch current layer by single click like this:

# Initialize RGBLED with pin, underglow_size, backlight_size and is_rgbw.
rgb = RGB.new(
  15,    # pin number
  0,    # size of underglow pixel
  3,   # size of backlight pixel
  false # 32bit data will be sent to a pixel if true while 24bit if false
)
# Set an effect
#  `nil` or `:off` for turning off
rgb.effect = :rainbow_mood
# Set an action when you input
#  `nil` or `:off` for turning off
# rgb.action = :thunder
# Append the feature. Will possibly be able to write `Keyboard#append(OLED.new)` in the future
kbd.append rgb

kbd.start!
