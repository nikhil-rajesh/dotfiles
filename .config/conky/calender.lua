require "cairo"
json = require "json"

local cs
corner_r = 20 --> Corner Radius
bg_colour = 0x141c21 --> Background Color
bg_alpha = 0.55 --> Background Transparency
font = "Montserrat"
font_size = 16
red, green, blue, alpha = 1, 1, 1, 1
font_slant = CAIRO_FONT_SLANT_NORMAL
font_face = CAIRO_FONT_WEIGHT_NORMAL

function rgb_to_r_g_b(colour, alpha)
    return ((colour / 0x10000) % 0x100) / 255., ((colour / 0x100) % 0x100) / 255., (colour % 0x100) / 255., alpha
end

function conky_main()
    if conky_window == nil then
        return
    end

    cs =
        cairo_xlib_surface_create(
        conky_window.display,
        conky_window.drawable,
        conky_window.visual,
        conky_window.width,
        conky_window.height
    )

    local data = json.decode(conky_parse("${execpi 300 python3 /home/bee/Projects/gcal/gcal.py}"))

    pad = 0
    for i = 1, 10 do
        if data[i]["day"] ~= "" then
            pad = pad + 8
        end
        x, y = 0, (i - 1) * 53 + pad

        draw_rect(x, y, data[i]["now"])
        draw_divider(x, y, data[i]["color"])
        write_text(x, y, data[i])
    end

    cairo_surface_destroy(cs)
end

function draw_divider(x, y, color)
    cr = cairo_create(cs)
    cairo_set_source_rgb(cr, rgb_to_r_g_b(color))
    cairo_set_line_width(cr, 3)
    cairo_set_line_cap(cr, CAIRO_LINE_CAP_ROUND)
    cairo_move_to(cr, x + 90.0, y + 8)
    cairo_line_to(cr, x + 90.0, y + 42)
    cairo_stroke(cr)

    cairo_destroy(cr)
    cr = nil
end

function draw_rect(x, y, border)
    cr = cairo_create(cs)

    width, height, aspect = 500, 50, 1.0
    corner_radius = 9

    radius = corner_radius / aspect
    degrees = 3.14 / 180.0

    cairo_new_sub_path(cr)
    cairo_arc(cr, x + width - radius, y + radius, radius, -90 * degrees, 0 * degrees)
    cairo_arc(cr, x + width - radius, y + height - radius, radius, 0 * degrees, 90 * degrees)
    cairo_arc(cr, x + radius, y + height - radius, radius, 90 * degrees, 180 * degrees)
    cairo_arc(cr, x + radius, y + radius, radius, 180 * degrees, 270 * degrees)
    cairo_close_path(cr)

    cairo_set_source_rgba(cr, rgb_to_r_g_b(bg_colour, bg_alpha))
    cairo_fill_preserve(cr)

    if border then
        cairo_set_source_rgb(cr, rgb_to_r_g_b("0xf54242"))
        cairo_stroke(cr)
    end

    cairo_destroy(cr)
    cr = nil
end

function write_text(x, y, data)
    cr = cairo_create(cs)

    cairo_select_font_face(cr, font, font_slant, font_face)
    cairo_set_source_rgba(cr, red, green, blue, alpha)

    cairo_set_font_size(cr, 12)

    if data["date"] == "" then
        cairo_move_to(cr, x + 30, y + 30)
        cairo_show_text(cr, data["day"])
    else
        cairo_move_to(cr, x + 30, y + 22)
        cairo_show_text(cr, data["day"])
        cairo_move_to(cr, x + 30, y + 37)
        cairo_show_text(cr, data["date"])
    end

    cairo_set_font_size(cr, 14)
    cairo_move_to(cr, x + 100, y + 22)
    cairo_show_text(cr, data["summary"])
    cairo_move_to(cr, x + 100, y + 37)
    cairo_show_text(cr, data["time"])

    cairo_destroy(cr)
    cr = nil
end
