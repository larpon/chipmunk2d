// Copyright(C) 2019 Lars Pontoppidan. All rights reserved.
// Use of this source code is governed by an MIT license file distributed with this software package
module main

@[flag]
pub enum Flag {
	app
	print
	flood
	input
	draw
	debug_state
}

struct Debug {
mut:
	flags Flag = .print | .input | .app | .debug_state
}

fn (d Debug) all(flags Flag) bool {
	return d.flags.all(flags)
}

fn (d Debug) has(flags Flag) bool {
	return d.flags.has(flags)
}

fn (mut d Debug) on(flag Flag) {
	if !d.has(flag) {
		d.flags.set(flag)
		d.pln(.debug_state, flag.str().all_after('.').trim_right('}') + ' ${d.state(flag)}')
	}
}

fn (mut d Debug) off(flag Flag) {
	if d.has(flag) {
		d.flags.clear(flag)
		d.pln(.debug_state, flag.str().all_after('.').trim_right('}') + ' ${d.state(flag)}')
	}
}

fn (mut d Debug) toggle(flag Flag) {
	d.flags.toggle(flag)
	d.pln(.debug_state, flag.str().all_after('.').trim_right('}') + ' ${d.state(flag)}')
}

fn (d Debug) state(flag Flag) string {
	return if d.has(flag) { 'on' } else { 'off' }
}

//[if debug_print ?]
fn (d Debug) pln(flag Flag, str string) {
	if !d.flags.has(.print) {
		return
	}
	if d.flags.has(flag) {
		f := flag.str().all_after('.').trim_right('}')
		println(f + ' ' + str)
	}
}

//[if debug_print ?]
fn (d Debug) plng(flag Flag, str string) {
	if !d.flags.has(.print) {
		return
	}
	if d.flags & flag == flag {
		f := flag.str().all_after('.').trim_right('}').split(' | ').join('')
		println(f + ' ' + str)
	}
}
