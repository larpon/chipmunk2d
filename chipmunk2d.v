// Copyright(C) 2021 Lars Pontoppidan. All rights reserved.
module chipmunk2d

import c

pub const infinity = c.infinity

@[inline]
pub fn v(x Float, y Float) Vect {
	return Vect{x, y}
}

pub type Float = f64 // Float

pub type DataPointer = voidptr

pub type Float = f64

@[typedef]
struct C.cpVect {
pub mut:
	x Float
	y Float
}

pub type Vect = C.cpVect

pub const vzero = Vect{0.0, 0.0}

@[typedef]
struct C.cpTransform {
	a  Float
	b  Float
	c  Float
	d  Float
	tx Float
	ty Float
}

pub type Transform = C.cpTransform

/// Type used for various timestamps in Chipmunk.
//	typedef unsigned int cpTimestamp;
pub type Timestamp = u32

// Type used for cpSpace.collision_type.
// typedef uintptr_t cpCollisionType;

pub type CollisionType = &usize


