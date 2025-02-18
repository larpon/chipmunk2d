// Copyright(C) 2025 Lars Pontoppidan. All rights reserved.
// Use of this source code is governed by an MIT license
// that can be found in the LICENSE file.
module chipmunk2d

//
// chipmunk.h
//

// TODO Non-numerical: #define CHIPMUNK_H

// @C: ``
/*
TODO:
CP_EXPORT void cpMessage(const char *condition, const char *file, int line, int isError, int isHardError, const char *message, ...);
*/

// /* TODO: */ is currently undocumented
/*
TODO:
CP_EXPORT void cpMessage(const char *condition, const char *file, int line, int isError, int isHardError, const char *message, ...);
*/

// TODO Function: #define cpAssertHard(__condition__, ...) if(!(__condition__)){cpMessage(#__condition__, __FILE__, __LINE__, 1, 1, __VA_ARGS__); abort();}

@[noinit; typedef]
pub struct C.cpArray {
	// NOTE: Opaque type
}

pub type Array = C.cpArray

@[noinit; typedef]
pub struct C.cpHashSet {
	// NOTE: Opaque type
}

pub type HashSet = C.cpHashSet

@[noinit; typedef]
pub struct C.cpBody {
	// NOTE: Opaque type
}

pub type Body = C.cpBody

@[noinit; typedef]
pub struct C.cpShape {
	// NOTE: Opaque type
}

pub type Shape = C.cpShape

@[noinit; typedef]
pub struct C.cpCircleShape {
	// NOTE: Opaque type
}

pub type CircleShape = C.cpCircleShape

@[noinit; typedef]
pub struct C.cpSegmentShape {
	// NOTE: Opaque type
}

pub type SegmentShape = C.cpSegmentShape

@[noinit; typedef]
pub struct C.cpPolyShape {
	// NOTE: Opaque type
}

pub type PolyShape = C.cpPolyShape

@[noinit; typedef]
pub struct C.cpConstraint {
	// NOTE: Opaque type
}

pub type Constraint = C.cpConstraint

@[noinit; typedef]
pub struct C.cpPinJoint {
	// NOTE: Opaque type
}

pub type PinJoint = C.cpPinJoint

@[noinit; typedef]
pub struct C.cpSlideJoint {
	// NOTE: Opaque type
}

pub type SlideJoint = C.cpSlideJoint

@[noinit; typedef]
pub struct C.cpPivotJoint {
	// NOTE: Opaque type
}

pub type PivotJoint = C.cpPivotJoint

@[noinit; typedef]
pub struct C.cpGrooveJoint {
	// NOTE: Opaque type
}

pub type GrooveJoint = C.cpGrooveJoint

@[noinit; typedef]
pub struct C.cpDampedSpring {
	// NOTE: Opaque type
}

pub type DampedSpring = C.cpDampedSpring

@[noinit; typedef]
pub struct C.cpDampedRotarySpring {
	// NOTE: Opaque type
}

pub type DampedRotarySpring = C.cpDampedRotarySpring

@[noinit; typedef]
pub struct C.cpRotaryLimitJoint {
	// NOTE: Opaque type
}

pub type RotaryLimitJoint = C.cpRotaryLimitJoint

@[noinit; typedef]
pub struct C.cpRatchetJoint {
	// NOTE: Opaque type
}

pub type RatchetJoint = C.cpRatchetJoint

@[noinit; typedef]
pub struct C.cpGearJoint {
	// NOTE: Opaque type
}

pub type GearJoint = C.cpGearJoint

@[noinit; typedef]
pub struct C.cpSimpleMotorJoint {
	// NOTE: Opaque type
}

pub type SimpleMotorJoint = C.cpSimpleMotorJoint

@[noinit; typedef]
pub struct C.cpCollisionHandler {
	// NOTE: Opaque type
}

pub type CollisionHandler = C.cpCollisionHandler

@[noinit; typedef]
pub struct C.cpContactPointSet {
	// NOTE: Opaque type
}

pub type ContactPointSet = C.cpContactPointSet

@[noinit; typedef]
pub struct C.cpArbiter {
	// NOTE: Opaque type
}

pub type Arbiter = C.cpArbiter

@[noinit; typedef]
pub struct C.cpSpace {
	// NOTE: Opaque type
}

pub type Space = C.cpSpace

// Chipmunk 7.0.3
pub const version_major = C.CP_VERSION_MAJOR // 7

pub const version_minor = C.CP_VERSION_MINOR // 0

pub const version_release = C.CP_VERSION_RELEASE // 3

// @C: `CP_EXPORT extern const char *cpVersionString`
fn C.cpVersionString(const_cp_version_string &char) &char

// version_string : Version string.
pub fn version_string(const_cp_version_string &char) &char {
	return C.cpVersionString(const_cp_version_string)
}

// @C: `CP_EXPORT cpFloat cpMomentForCircle(cpFloat m, cpFloat r1, cpFloat r2, cpVect offset)`
fn C.cpMomentForCircle(m Float, r1 Float, r2 Float, offset Vect) Float

// moment_for_circle : Calculate the moment of inertia for a circle.
// moment_for_circle : @c r1 and @c r2 are the inner and outer diameters. A solid circle has an inner diameter of 0.
pub fn moment_for_circle(m Float, r1 Float, r2 Float, offset Vect) Float {
	return C.cpMomentForCircle(m, r1, r2, offset)
}

// @C: `CP_EXPORT cpFloat cpAreaForCircle(cpFloat r1, cpFloat r2)`
fn C.cpAreaForCircle(r1 Float, r2 Float) Float

// area_for_circle : Calculate area of a hollow circle.
// area_for_circle : @c r1 and @c r2 are the inner and outer diameters. A solid circle has an inner diameter of 0.
pub fn area_for_circle(r1 Float, r2 Float) Float {
	return C.cpAreaForCircle(r1, r2)
}

// @C: `CP_EXPORT cpFloat cpMomentForSegment(cpFloat m, cpVect a, cpVect b, cpFloat radius)`
fn C.cpMomentForSegment(m Float, a Vect, b Vect, radius Float) Float

// moment_for_segment : Calculate the moment of inertia for a line segment.
// moment_for_segment : Beveling radius is not supported.
pub fn moment_for_segment(m Float, a Vect, b Vect, radius Float) Float {
	return C.cpMomentForSegment(m, a, b, radius)
}

// @C: `CP_EXPORT cpFloat cpAreaForSegment(cpVect a, cpVect b, cpFloat radius)`
fn C.cpAreaForSegment(a Vect, b Vect, radius Float) Float

// area_for_segment : Calculate the area of a fattened (capsule shaped) line segment.
pub fn area_for_segment(a Vect, b Vect, radius Float) Float {
	return C.cpAreaForSegment(a, b, radius)
}

// @C: `CP_EXPORT cpFloat cpMomentForPoly(cpFloat m, int count, const cpVect *verts, cpVect offset, cpFloat radius)`
fn C.cpMomentForPoly(m Float, count int, const_verts &Vect, offset Vect, radius Float) Float

// moment_for_poly : Calculate the moment of inertia for a solid polygon shape assuming it's center of gravity is at it's centroid. The offset is added to each vertex.
pub fn moment_for_poly(m Float, count int, const_verts &Vect, offset Vect, radius Float) Float {
	return C.cpMomentForPoly(m, count, const_verts, offset, radius)
}

// @C: `CP_EXPORT cpFloat cpAreaForPoly(const int count, const cpVect *verts, cpFloat radius)`
fn C.cpAreaForPoly(const_count int, const_verts &Vect, radius Float) Float

// area_for_poly : Calculate the signed area of a polygon. A Clockwise winding gives positive area.
// area_for_poly : This is probably backwards from what you expect, but matches Chipmunk's the winding for poly shapes.
pub fn area_for_poly(const_count int, const_verts &Vect, radius Float) Float {
	return C.cpAreaForPoly(const_count, const_verts, radius)
}

// @C: `CP_EXPORT cpVect cpCentroidForPoly(const int count, const cpVect *verts)`
fn C.cpCentroidForPoly(const_count int, const_verts &Vect) Vect

// centroid_for_poly : Calculate the natural centroid of a polygon.
pub fn centroid_for_poly(const_count int, const_verts &Vect) Vect {
	return C.cpCentroidForPoly(const_count, const_verts)
}

// @C: `CP_EXPORT cpFloat cpMomentForBox(cpFloat m, cpFloat width, cpFloat height)`
fn C.cpMomentForBox(m Float, width Float, height Float) Float

// moment_for_box : Calculate the moment of inertia for a solid box.
pub fn moment_for_box(m Float, width Float, height Float) Float {
	return C.cpMomentForBox(m, width, height)
}

// @C: `CP_EXPORT cpFloat cpMomentForBox2(cpFloat m, cpBB box)`
fn C.cpMomentForBox2(m Float, box BB) Float

// moment_for_box2 : Calculate the moment of inertia for a solid box.
pub fn moment_for_box2(m Float, box BB) Float {
	return C.cpMomentForBox2(m, box)
}

// @C: `CP_EXPORT int cpConvexHull(int count, const cpVect *verts, cpVect *result, int *first, cpFloat tol)`
fn C.cpConvexHull(count int, const_verts &Vect, result &Vect, first &int, tol Float) int

// convex_hull : Calculate the convex hull of a given set of points. Returns the count of points in the hull.
// convex_hull : @c result must be a pointer to a @c cpVect array with at least @c count elements. If @c verts == @c result, then @c verts will be reduced inplace.
// @c first is an optional pointer to an integer to store where the first vertex in the hull came from (i.e. verts[first] == result[0])
// @c tol is the allowed amount to shrink the hull when simplifying it. A tolerance of 0.0 creates an exact hull.
pub fn convex_hull(count int, const_verts &Vect, result &Vect, first &int, tol Float) int {
	return C.cpConvexHull(count, const_verts, result, first, tol)
}

// TODO Non-numerical: #define CP_CONVEX_HULL(__count__, __verts__, __count_var__, __verts_var__) \

// SpacePointQueryBlock is currently undocumented
// @C: typedef void (^cpSpacePointQueryBlock)(cpShape *shape, cpVect point, cpFloat distance, cpVect gradient);
pub type SpacePointQueryBlock = fn (shape &Shape, point Vect, distance Float, gradient Vect)

// SpaceSegmentQueryBlock is currently undocumented
// @C: typedef void (^cpSpaceSegmentQueryBlock)(cpShape *shape, cpVect point, cpVect normal, cpFloat alpha);
pub type SpaceSegmentQueryBlock = fn (shape &Shape, point Vect, normal Vect, alpha Float)

// SpaceBBQueryBlock is currently undocumented
// @C: typedef void (^cpSpaceBBQueryBlock)(cpShape *shape);
pub type SpaceBBQueryBlock = fn (shape &Shape)

// SpaceShapeQueryBlock is currently undocumented
// @C: typedef void (^cpSpaceShapeQueryBlock)(cpShape *shape, cpContactPointSet *points);
pub type SpaceShapeQueryBlock = fn (shape &Shape, points &ContactPointSet)
