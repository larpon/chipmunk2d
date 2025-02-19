// Copyright(C) 2025 Lars Pontoppidan. All rights reserved.
// Use of this source code is governed by an MIT license
// that can be found in the LICENSE file.
module chipmunk2d

//
// chipmunk_types.h
//

pub type Float = f64 // Float

pub const pi = Float(C.CP_PI) // ((cpFloat)3.14159265358979323846264338327950288)

// Return the max of two cpFloats.
fn C.cpfmax(a Float, b Float) Float
pub fn fmax(a Float, b Float) Float {
	return C.cpfmax(a, b)
}

// Return the min of two cpFloats.
fn C.cpfmin(a Float, b Float) Float
pub fn fmin(a Float, b Float) Float {
	return C.cpfmin(a, b)
}

// Return the absolute value of a cpFloat.
fn C.cpfabs(f Float) Float
pub fn fabs(f Float) Float {
	return C.cpfabs(f)
}

// Clamp @c f to be between @c min and @c max.
fn C.cpfclamp(f Float, min Float, max Float) Float
pub fn fclamp(f Float, min Float, max Float) Float {
	return C.cpfclamp(f, min, max)
}

// Clamp @c f to be between 0 and 1.
fn C.cpfclamp01(f Float) Float
pub fn fclamp01(f Float) Float {
	return C.cpfclamp01(f)
}

// Linearly interpolate (or extrapolate) between @c f1 and @c f2 by @c t percent.
fn C.cpflerp(f1 Float, f2 Float, t Float) Float
pub fn flerp(f1 Float, f2 Float, t Float) Float {
	return C.cpflerp(f1, f2, t)
}

/// Linearly interpolate from @c f1 to @c f2 by no more than @c d.
fn C.cpflerpconst(f1 Float, f2 Float, d Float) Float
pub fn flerpconst(f1 Float, f2 Float, d Float) Float {
	return C.cpflerpconst(f1, f2, d)
}

// Hash value type.
// @C: `typedef uintptr_t cpHashValue;`
pub type HashValue = usize

// Type used internally to cache colliding object info for cpCollideShapes().
// Should be at least 32 bits.
// @C: `typedef uint32_t cpCollisionID;`
pub type CollisionID = u32

// Oh C, how we love to define our own boolean types to get compiler compatibility
// Chipmunk's boolean type.
// typedef unsigned char cpBool;
// #define cpTrue 1
// true value
pub const @true = u8(1)

// false value.
// #define cpFalse 0
pub const @false = u8(0)

// Type used for user data pointers.
// @C: `typedef void * cpDataPointer;`
pub type DataPointer = voidptr

// Type used for cpSpace.collision_type.
// @C: `typedef uintptr_t cpCollisionType;`
pub type CollisionType = usize

// Type used for cpShape.group.
// @C: `typedef uintptr_t cpGroup;`
pub type Group = usize

// Type used for cpShapeFilter category and mask.
// @C: `typedef unsigned int cpBitmask;`
pub type Bitmask = u32 // NOTE: V does not have `uint`

// Type used for various timestamps in Chipmunk.
// @C: `typedef unsigned int cpTimestamp;`
pub type Timestamp = u32

// Value for cpShape.group signifying that a shape is in no group.
// #define CP_NO_GROUP ((cpGroup)0)
pub const no_group = Group(0)

// Value for cpShape.layers signifying that a shape is in every layer.
// #define CP_ALL_CATEGORIES (~(cpBitmask)0)
pub const all_categories = (~(Bitmask(0)))

// cpCollisionType value internally reserved for hashing wildcard handlers.
// #define CP_WILDCARD_COLLISION_TYPE (~(cpCollisionType)0)
pub const wildcard_collision_type = (~(CollisionType(0)))

// Chipmunk's 2D vector type.
// @C: `typedef struct cpVect{cpFloat x,y;} cpVect;`
@[typedef]
struct C.cpVect {
pub mut:
	x Float
	y Float
}

pub type Vect = C.cpVect

// Column major affine transform.
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

// NUKE
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
