
function throw_bar(awful,set_wallpaper,tasklist_buttons,wibox,gears,color,taglist_buttons)

    local cpu_widget = require("awesome-wm-widgets.cpu-widget.cpu-widget")
    local battery_widget = require("awesome-wm-widgets.battery-widget.battery")
    local brightness_widget = require("awesome-wm-widgets.brightness-widget.brightness")
    local ram_widget = require("awesome-wm-widgets.ram-widget.ram-widget")
    local volume_widget = require('awesome-wm-widgets.volume-widget.volume')
    local logout_menu_widget = require("awesome-wm-widgets.logout-menu-widget.logout-menu")
    local fs_widget = require("awesome-wm-widgets.fs-widget.fs-widget")
    local net_speed_widget = require("awesome-wm-widgets.net-speed-widget.net-speed")


    awful.screen.connect_for_each_screen(function(s)
        -- widget personales(https://awesomewm.org/doc/api/classes/wibox.widget.textbox.html)
        time_update = 2
        --uso de ram
        mostra_men_user = awful.widget.watch('bash -c "free -m | grep Mem | awk \'{print $3}\'"', time_update)
        text_memoria = wibox.widget{
            markup = ' MB ',
            align  = 'center',
            valign = 'center',
            widget = wibox.widget.textbox
        }
        -- Fondo de pantalla
        set_wallpaper(s)
        -- Cada pantalla tiene su propia tabla de etiquetas.
        awful.tag({"Principal", "Multimedia", "Internet", "Otros"}, s, awful.layout.layouts[1])
        -- Crear un cuadro de diálogo para cada pantalla
        s.mypromptbox = awful.widget.prompt()
        -- Cree un widget de cuadro de imagen que contendrá un icono que indica qué diseño estamos usando.
        -- Necesitamos un cuadro de diseño por pantalla.
        s.mylayoutbox = awful.widget.layoutbox(s)
        s.mylayoutbox:buttons(gears.table.join(
            awful.button({}, 1, function() awful.layout.inc(1)  end), 
            awful.button({}, 3, function() awful.layout.inc(-1) end),
            awful.button({}, 4, function() awful.layout.inc(1)  end),
            awful.button({}, 5, function() awful.layout.inc(-1) end)
        ))
        -- Crear un widget de lista de etiquetas
        s.mytaglist = awful.widget.taglist {
            screen = s,
            filter = awful.widget.taglist.filter.all,
            buttons = taglist_buttons
        }
        -- Crear un widget de lista de tareas, el listado de programas abiertos en la mesa de trabajo actual
        s.mytasklist = awful.widget.tasklist {
            screen = s,
            filter = awful.widget.tasklist.filter.currenttags,
            buttons = tasklist_buttons
        }
        -- crear la barra de tareas / estados (https://awesomewm.org/apidoc/popups_and_bars/awful.wibar.html)
        s.mywibox = awful.wibar({
            position = "top", --"left",
            screen = s
        })
        -- Add widgets to the wibox
        s.mywibox:setup{
            layout = wibox.layout.align.horizontal,
            {-- iquierda widgets
                layout = wibox.layout.fixed.horizontal,
                mylauncher,
                s.mytaglist,
                s.mypromptbox
            },
            s.mytasklist,  -- Widget medio listado de aplicaciones abiertas
            { -- Right widgets
                layout = wibox.layout.fixed.horizontal,
                mykeyboardlayout,
                wibox.widget.systray(),
                -- mis wigeds
                net_speed_widget(),
                fs_widget(),
                ram_widget(),
                cpu_widget({
                    width = 70,
                    step_width = 2,
                    step_spacing = 0,
                    color = '#434c5e'
                }),
                battery_widget(),
                brightness_widget(),
                volume_widget(),
                mytextclock,
                s.mylayoutbox,
                logout_menu_widget()
            }
        }
    end)
end
