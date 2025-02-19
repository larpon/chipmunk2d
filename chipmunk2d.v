// Copyright(C) 2021 Lars Pontoppidan. All rights reserved.
// Use of this source code is governed by an MIT license
// that can be found in the LICENSE file.
module chipmunk2d

import c

pub const infinity = c.infinity

@[inline]
pub fn v(x Float, y Float) Vect {
	return Vect{x, y}
}

pub const vzero = Vect{0.0, 0.0}
