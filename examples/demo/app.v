module main

import chipmunk2d as cp
import time
import sokol.sapp
import sokol.gfx
import sokol.sgl
import sgldraw as draw

fn main() {
	mut app := &App{
		width:  1100
		height: 700
	}
	app.run()
}

struct ChipmunkSpace {
mut:
	space      &cp.Space = unsafe { nil }
	ground     &cp.Shape = unsafe { nil }
	ball_body  &cp.Body  = unsafe { nil }
	ball_shape &cp.Shape = unsafe { nil }

	time_step f64 = 1.0 / 60.0
}

fn (mut cs ChipmunkSpace) init() {
	gravity := cp.v(0, 700)

	// Create an empty space.
	mut space := cp.space_new()
	cp.space_set_gravity(space, gravity)

	cs.space = space
	// Add a static line segment shape for the ground.
	// We'll make it slightly tilted so the ball will roll off.
	// We attach it to a static body to tell Chipmunk it shouldn't be movable.
	mut ground := cp.segment_shape_new(cp.space_get_static_body(space), cp.v(-20, 500),
		cp.v(1100 + 20, 500 - 150), 0)
	cp.shape_set_friction(ground, 1)
	cp.shape_set_elasticity(ground, 0.8)
	cp.space_add_shape(space, ground)

	cs.ground = ground

	// Now let's make a ball that falls onto the line and rolls off.
	// First we need to make a cpBody to hold the physical properties of the object.
	// These include the mass, position, velocity, angle, etc. of the object.
	// Then we attach collision shapes to the cpBody to give it a size and shape.

	radius := 50 // cp.Float(50)
	mass := 10 // cp.Float(1)

	// The moment of inertia is like mass for rotation
	// Use the cpMomentFor*() functions to help you approximate it.
	moment := cp.moment_for_circle(mass, 0, radius, cp.vzero)

	// The cpSpaceAdd*() functions return the thing that you are adding.
	// It's convenient to create and add an object in one line.
	mut ball_body := cp.space_add_body(space, cp.body_new(mass, moment))
	cp.body_set_position(ball_body, cp.v(750, 15))

	cs.ball_body = ball_body
	// Now we create the collision shape for the ball.
	// You can create multiple collision shapes that point to the same body.
	// They will all be attached to the body and move around to follow it.
	mut ball_shape := cp.space_add_shape(space, cp.circle_shape_new(ball_body, radius,
		cp.vzero))
	cp.shape_set_friction(ball_shape, 0.5)
	cp.shape_set_elasticity(ball_shape, 0.8)

	cs.ball_shape = ball_shape
}

fn (mut cs ChipmunkSpace) free() {
	// Clean up our objects and exit!
	unsafe {
		cp.shape_free(cs.ball_shape)
		cp.body_free(cs.ball_body)
		cp.shape_free(cs.ground)
		cp.space_free(cs.space)
	}
}

fn (mut cs ChipmunkSpace) step() {
	cp.space_step(cs.space, cs.time_step)
}

@[heap]
struct App {
	pass_action gfx.PassAction = gfx.create_clear_pass_action(0.5, 0.5, 0.5, 1.0)
mut:
	d          Debug
	ticks      i64
	dt         f32
	width      int
	height     int
	frame      i64
	last       i64
	pause      bool
	alpha_pip  sgl.Pipeline
	keys_state map[sapp.KeyCode]bool
	ready      bool
	//
	cms ChipmunkSpace
}

fn (mut a App) init() {
	a.frame = 0
	a.last = time.ticks()

	sgl.load_pipeline(a.alpha_pip)

	a.cms = ChipmunkSpace{}
	a.cms.init()

	a.ready = true
}

fn (mut a App) quit() {
	sapp.quit()
}

fn (mut a App) cleanup() {
	a.cms.free()
}

fn (mut a App) run() {
	title := 'Chipmunk2D demo'
	desc := sapp.Desc{
		width:               a.width
		height:              a.height
		user_data:           a
		init_userdata_cb:    init
		frame_userdata_cb:   frame
		event_userdata_cb:   event
		window_title:        title.str
		html5_canvas_name:   title.str
		cleanup_userdata_cb: cleanup
	}
	sapp.run(&desc)
}

fn (mut a App) on_resized() {
}

fn (mut a App) handle_input() {
	/*
	if a.key_is_held(.right) {
		a.rx += 10
	}
	if a.key_is_held(.left) {
		a.rx -= 10
	}
	if a.key_is_held(.up) {
		a.ry -= 10
	}
	if a.key_is_held(.down) {
		a.ry += 10
	}*/
}

fn (mut a App) draw() {
	if !a.ready {
		return
	}

	a.d.plng(.draw | .flood, @STRUCT + '.' + @FN + '() called...')

	sgl.defaults()
	sgl.matrix_mode_projection()
	sgl.ortho(0, f32(a.width), f32(a.height), 0.0, -1.0, 1.0)

	black := draw.Shape{
		colors: draw.Colors{draw.rgb(0, 0, 0), draw.rgba(255, 255, 255, 127)}
	}

	red := draw.Shape{
		colors: draw.Colors{draw.rgb(255, 0, 0), draw.rgba(255, 255, 255, 127)}
	}

	/*
	grey := draw.Shape{
		colors: draw.brush_colors( draw.rgb(127, 127, 127) )
	}
	*/

	// mut brush := grey

	mut ball_body := a.cms.ball_body
	pos := cp.body_get_position(ball_body)
	pos_x := f32(pos.x)
	pos_y := f32(pos.y)
	// vel := ball_body.get_velocity()
	angle := f32(cp.body_get_angle(ball_body))
	radius := f32(cp.circle_shape_get_radius(a.cms.ball_shape))

	g_a_pos := cp.segment_shape_get_a(a.cms.ground)
	g_a_pos_x := f32(g_a_pos.x)
	g_a_pos_y := f32(g_a_pos.y)
	g_b_pos := cp.segment_shape_get_b(a.cms.ground)
	g_b_pos_x := f32(g_b_pos.x)
	g_b_pos_y := f32(g_b_pos.y)

	// println("Time is $time ball_body is at ($pos.x,$pos.y). It's velocity is ($vel.x,$vel.y)")

	black.line(g_a_pos_x, g_a_pos_y, g_b_pos_x, g_b_pos_y)

	red.circle(pos_x, pos_y, radius, 40)

	draw.push_matrix()
	draw.translate(pos_x, pos_y, 0.0)
	draw.rotate(angle, 0.0, 0.0, 1.0)
	draw.translate(-pos_x, -pos_y, 0.0)
	black.line(pos_x, pos_y, pos_x, pos_y - radius)
	draw.pop_matrix()

	/*
	if a.d.all(.draw) {
		debug_brush := draw.Brush{
			fill: .outline
			colors: draw.brush_colors(draw.rgba(0, 0, 125, 25))
		}
		draw.rectangle(a.rx, a.ry, a.size_w, a.size_h, debug_brush)
	}*/

	if !a.pause {
		a.cms.step()
	}

	if pos_x + radius < 0 {
		cp.body_set_position(ball_body, cp.v(750, -radius))
		cp.body_set_moment(ball_body, 1)
		cp.body_set_velocity(ball_body, cp.v(0, 0))
	}
}

fn (a App) key_is_held(kc sapp.KeyCode) bool {
	return kc in a.keys_state.keys() && a.keys_state[kc]
}

fn (mut a App) on_key_down(ev &C.sapp_event) {
	a.keys_state[ev.key_code] = true

	if ev.key_code == .p {
		a.pause = !a.pause
	}

	// Debug input
	if a.key_is_held(.period) {
		if ev.key_code == .comma {
			eprintln(a.d.flags)
			return
		}

		if ev.key_code == .f {
			a.d.toggle(.flood)
		}

		// Debug draw control
		if a.key_is_held(.d) {
			a.d.on(.draw)

			if ev.key_code == .minus || a.key_is_held(.minus) {
				a.d.off(.draw)
			} else {
			}
		}

		// Debug print control
		if a.key_is_held(.p) {
			a.d.on(.print)

			if ev.key_code == .a {
				a.d.toggle(.app)
			} else if ev.key_code == .i {
				a.d.toggle(.input)
			} else if ev.key_code == .minus || a.key_is_held(.minus) {
				a.d.pln(.debug_state, 'print off')
				a.d.off(.print)
			} else {
			}
		}
	}
}

fn (mut a App) on_key_up(ev &C.sapp_event) {
	a.keys_state[ev.key_code] = false

	// Handle quit event
	if ev.key_code == .escape || ev.key_code == .q {
		a.quit()
		return
	}
}

fn init(user_data voidptr) {
	mut app := unsafe { &App(user_data) }
	desc := sapp.create_desc()
	gfx.setup(&desc)
	sgl_desc := sgl.Desc{
		max_vertices: 50 * 65536
	}
	sgl.setup(&sgl_desc)
	mut pipdesc := gfx.PipelineDesc{}
	unsafe { vmemset(&pipdesc, 0, int(sizeof(pipdesc))) }

	color_state := gfx.ColorTargetState{
		blend: gfx.BlendState{
			enabled:        true
			src_factor_rgb: .src_alpha
			dst_factor_rgb: .one_minus_src_alpha
		}
	}
	pipdesc.colors[0] = color_state

	// pipdesc.depth = gfx.DepthState{
	// 	write_enabled: true
	// 	compare:       .less_equal
	// }
	// pipdesc.cull_mode = .back

	app.alpha_pip = sgl.make_pipeline(&pipdesc)

	app.init()
}

fn cleanup(user_data voidptr) {
	mut app := unsafe { &App(user_data) }
	app.cleanup()
	gfx.shutdown()
}

fn frame(user_data voidptr) {
	mut app := unsafe { &App(user_data) }
	app.frame++

	t := time.ticks()
	app.ticks = t
	app.dt = f32(t - app.last) / 1000.0

	if app.width != sapp.width() || app.height != sapp.height() {
		app.d.pln(.app, 'resized from ${app.width}x${app.height} to ${sapp.width()}x${sapp.height()}')
		app.on_resized()
		app.width = sapp.width()
		app.height = sapp.height()
	}

	app.handle_input()
	app.draw()

	pass := sapp.create_default_pass(app.pass_action)
	gfx.begin_pass(&pass)
	sgl.default_pipeline()
	sgl.draw()
	gfx.end_pass()
	gfx.commit()

	app.last = t
}

fn event(ev &C.sapp_event, mut app App) {
	if ev.@type == .mouse_move {
		//
	}
	if ev.@type == .mouse_up || ev.@type == .mouse_down {
		if ev.mouse_button == .left {
			is_pressed := ev.@type == .mouse_down
			if is_pressed {
				//
			}
		}
	}
	if ev.@type == .key_up {
		app.on_key_up(ev)
	}
	if ev.@type == .key_down {
		app.on_key_down(ev)
	}
	if ev.@type == .touches_began || ev.@type == .touches_moved {
		if ev.num_touches > 0 {
			touch_point := ev.touches[0]
			app.d.pln(.input, '${touch_point}')
			//
		}
	}
}
