// Copyright(C) 2021 Lars Pontoppidan. All rights reserved.
module chipmunk2d

import c

pub const infinity = c.infinity

@[inline]
pub fn v(x Float, y Float) Vect {
	return Vect{x, y}
}
