module main

import gg
import chipmunk2d as cp
import time
import math

fn main() {
	mut app := &App{}
	app.gg = gg.new_context(
		bg_color:     gg.rgb(127, 127, 127)
		width:        1100
		height:       700
		window_title: 'Chipmunk2D Demo'
		frame_fn:     frame
		init_fn:      init
		cleanup_fn:   cleanup
		event_fn:     event
		user_data:    app
	)
	app.gg.run()
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

	// Now let's make a ball that fall onto the line and roll off.
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
mut:
	gg    &gg.Context = unsafe { nil }
	ticks i64
	dt    f32
	frame i64
	last  i64
	pause bool
	ready bool
	//
	cms ChipmunkSpace
}

fn init(mut a App) {
	a.frame = 0
	a.last = time.ticks()

	a.cms = ChipmunkSpace{}
	a.cms.init()

	a.ready = true
}

fn cleanup(mut a App) {
	a.cms.free()
}

fn (mut a App) draw() {
	if !a.ready {
		return
	}

	mut ball_body := a.cms.ball_body
	pos := cp.body_get_position(ball_body)
	pos_x := f32(pos.x)
	pos_y := f32(pos.y)
	// vel := cp.body_get_velocity(ball_body)
	angle := f32(cp.body_get_angle(ball_body))
	radius := f32(cp.circle_shape_get_radius(a.cms.ball_shape))

	g_a_pos := cp.segment_shape_get_a(a.cms.ground)
	g_a_pos_x := f32(g_a_pos.x)
	g_a_pos_y := f32(g_a_pos.y)
	g_b_pos := cp.segment_shape_get_b(a.cms.ground)
	g_b_pos_x := f32(g_b_pos.x)
	g_b_pos_y := f32(g_b_pos.y)

	// println("Time is ${a.ticks} ball_body is at (${pos.x},${pos.y}). It's velocity is (${vel.x},${vel.y})")

	a.gg.draw_line(g_a_pos_x, g_a_pos_y, g_b_pos_x, g_b_pos_y, gg.black)

	a.gg.draw_circle_filled(pos_x, pos_y, radius, gg.red)
	a.gg.draw_circle_empty(pos_x, pos_y, radius, gg.white)

	origin_x, origin_y := pos_x, pos_y
	theta := angle
	r_x :=
		math.cosf(theta) * (pos_x - origin_x) - math.sinf(theta) * ((pos_y - radius) - origin_y) +
		origin_x
	r_y := math.sinf(theta) * (pos_x - origin_x) +
		math.cosf(theta) * ((pos_y - radius) - origin_y) + origin_y

	a.gg.draw_line(pos_x, pos_y, r_x, r_y, gg.white)

	if !a.pause {
		a.cms.step()
	}

	if pos_x + radius < 0 {
		cp.body_set_position(ball_body, cp.v(750, -radius))
		cp.body_set_moment(ball_body, 1)
		cp.body_set_velocity(ball_body, cp.v(0, 0))
	}
}

fn event(e &gg.Event, mut a App) {
	match e.typ {
		.key_down {
			match e.key_code {
				.escape, .q {
					a.gg.quit()
				}
				.p {
					a.pause = !a.pause
				}
				else {}
			}
		}
		else {}
	}
}

fn frame(mut a App) {
	a.gg.begin()

	a.frame++

	t := time.ticks()
	a.ticks = t
	a.dt = f32(t - a.last) / 1000.0

	a.draw()

	a.gg.end()
	a.last = t
}
