// Copyright(C) 2025 Lars Pontoppidan. All rights reserved.
// Use of this source code is governed by an MIT license
// that can be found in the LICENSE file.
module chipmunk2d

//
// chipmunk_unsafe.h
//

// TODO Non-numerical: #define CHIPMUNK_UNSAFE_H

// @C: `CP_EXPORT void cpCircleShapeSetRadius(cpShape *shape, cpFloat radius)`
fn C.cpCircleShapeSetRadius(shape &Shape, radius Float)

// circle_shape_set_radius : Set the radius of a circle shape.
pub fn circle_shape_set_radius(shape &Shape, radius Float) {
	C.cpCircleShapeSetRadius(shape, radius)
}

// @C: `CP_EXPORT void cpCircleShapeSetOffset(cpShape *shape, cpVect offset)`
fn C.cpCircleShapeSetOffset(shape &Shape, offset Vect)

// circle_shape_set_offset : Set the offset of a circle shape.
pub fn circle_shape_set_offset(shape &Shape, offset Vect) {
	C.cpCircleShapeSetOffset(shape, offset)
}

// @C: `CP_EXPORT void cpSegmentShapeSetEndpoints(cpShape *shape, cpVect a, cpVect b)`
fn C.cpSegmentShapeSetEndpoints(shape &Shape, a Vect, b Vect)

// segment_shape_set_endpoints : Set the endpoints of a segment shape.
pub fn segment_shape_set_endpoints(shape &Shape, a Vect, b Vect) {
	C.cpSegmentShapeSetEndpoints(shape, a, b)
}

// @C: `CP_EXPORT void cpSegmentShapeSetRadius(cpShape *shape, cpFloat radius)`
fn C.cpSegmentShapeSetRadius(shape &Shape, radius Float)

// segment_shape_set_radius : Set the radius of a segment shape.
pub fn segment_shape_set_radius(shape &Shape, radius Float) {
	C.cpSegmentShapeSetRadius(shape, radius)
}

// @C: `CP_EXPORT void cpPolyShapeSetVerts(cpShape *shape, int count, cpVect *verts, cpTransform transform)`
fn C.cpPolyShapeSetVerts(shape &Shape, count int, verts &Vect, transform C.cpTransform)

// poly_shape_set_verts : Set the vertexes of a poly shape.
pub fn poly_shape_set_verts(shape &Shape, count int, verts &Vect, transform C.cpTransform) {
	C.cpPolyShapeSetVerts(shape, count, verts, transform)
}

// @C: `CP_EXPORT void cpPolyShapeSetVertsRaw(cpShape *shape, int count, cpVect *verts)`
fn C.cpPolyShapeSetVertsRaw(shape &Shape, count int, verts &Vect)

// poly_shape_set_verts_raw is currently undocumented
pub fn poly_shape_set_verts_raw(shape &Shape, count int, verts &Vect) {
	C.cpPolyShapeSetVertsRaw(shape, count, verts)
}

// @C: `CP_EXPORT void cpPolyShapeSetRadius(cpShape *shape, cpFloat radius)`
fn C.cpPolyShapeSetRadius(shape &Shape, radius Float)

// poly_shape_set_radius : Set the radius of a poly shape.
pub fn poly_shape_set_radius(shape &Shape, radius Float) {
	C.cpPolyShapeSetRadius(shape, radius)
}
