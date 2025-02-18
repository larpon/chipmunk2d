// Copyright(C) 2025 Lars Pontoppidan. All rights reserved.
// Use of this source code is governed by an MIT license
// that can be found in the LICENSE file.
module chipmunk2d

//
// chipmunk_types.h
//

// TODO Non-numerical: #define CHIPMUNK_TYPES_H

// TODO Function: #define CP_PI ((cpFloat)3.14159265358979323846264338327950288)

// CollisionID; : Type used internally to cache colliding object info for cpCollideShapes().
// CollisionID; : Should be at least 32 bits.
// @C: typedef uint32_t cpCollisionID;
pub type CollisionID = u32

// NUKE
//
@[typedef]
pub struct C.cpMat2x2 {
pub mut:
	// Row major [[a, b][c d]]
	//
	a Float
	b Float
	c Float
	d Float
}

pub type Mat2x2 = C.cpMat2x2
