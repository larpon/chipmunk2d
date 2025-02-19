// Copyright(C) 2025 Lars Pontoppidan. All rights reserved.
// Use of this source code is governed by an MIT license
// that can be found in the LICENSE file.
module chipmunk2d

//
// cpPolyShape.h
//

// @C: `CP_EXPORT cpPolyShape* cpPolyShapeAlloc(void)`
fn C.cpPolyShapeAlloc() &PolyShape

// poly_shape_alloc : Allocate a polygon shape.
pub fn poly_shape_alloc() &PolyShape {
	return C.cpPolyShapeAlloc()
}

// @C: `CP_EXPORT cpPolyShape* cpPolyShapeInit(cpPolyShape *poly, cpBody *body, int count, const cpVect *verts, cpTransform transform, cpFloat radius)`
fn C.cpPolyShapeInit(poly &PolyShape, body &Body, count int, const_verts &Vect, transform Transform, radius Float) &PolyShape

// poly_shape_init : Initialize a polygon shape with rounded corners.
// poly_shape_init : A convex hull will be created from the vertexes.
pub fn poly_shape_init(poly &PolyShape, body &Body, count int, const_verts &Vect, transform Transform, radius Float) &PolyShape {
	return C.cpPolyShapeInit(poly, body, count, const_verts, transform, radius)
}

// @C: `CP_EXPORT cpPolyShape* cpPolyShapeInitRaw(cpPolyShape *poly, cpBody *body, int count, const cpVect *verts, cpFloat radius)`
fn C.cpPolyShapeInitRaw(poly &PolyShape, body &Body, count int, const_verts &Vect, radius Float) &PolyShape

// poly_shape_init_raw : Initialize a polygon shape with rounded corners.
// poly_shape_init_raw : The vertexes must be convex with a counter-clockwise winding.
pub fn poly_shape_init_raw(poly &PolyShape, body &Body, count int, const_verts &Vect, radius Float) &PolyShape {
	return C.cpPolyShapeInitRaw(poly, body, count, const_verts, radius)
}

// @C: `CP_EXPORT cpShape* cpPolyShapeNew(cpBody *body, int count, const cpVect *verts, cpTransform transform, cpFloat radius)`
fn C.cpPolyShapeNew(body &Body, count int, const_verts &Vect, transform Transform, radius Float) &Shape

// poly_shape_new : Allocate and initialize a polygon shape with rounded corners.
// poly_shape_new : A convex hull will be created from the vertexes.
pub fn poly_shape_new(body &Body, count int, const_verts &Vect, transform Transform, radius Float) &Shape {
	return C.cpPolyShapeNew(body, count, const_verts, transform, radius)
}

// @C: `CP_EXPORT cpShape* cpPolyShapeNewRaw(cpBody *body, int count, const cpVect *verts, cpFloat radius)`
fn C.cpPolyShapeNewRaw(body &Body, count int, const_verts &Vect, radius Float) &Shape

// poly_shape_new_raw : Allocate and initialize a polygon shape with rounded corners.
// poly_shape_new_raw : The vertexes must be convex with a counter-clockwise winding.
pub fn poly_shape_new_raw(body &Body, count int, const_verts &Vect, radius Float) &Shape {
	return C.cpPolyShapeNewRaw(body, count, const_verts, radius)
}

// @C: `CP_EXPORT cpPolyShape* cpBoxShapeInit(cpPolyShape *poly, cpBody *body, cpFloat width, cpFloat height, cpFloat radius)`
fn C.cpBoxShapeInit(poly &PolyShape, body &Body, width Float, height Float, radius Float) &PolyShape

// box_shape_init : Initialize a box shaped polygon shape with rounded corners.
pub fn box_shape_init(poly &PolyShape, body &Body, width Float, height Float, radius Float) &PolyShape {
	return C.cpBoxShapeInit(poly, body, width, height, radius)
}

// @C: `CP_EXPORT cpPolyShape* cpBoxShapeInit2(cpPolyShape *poly, cpBody *body, cpBB box, cpFloat radius)`
fn C.cpBoxShapeInit2(poly &PolyShape, body &Body, box BB, radius Float) &PolyShape

// box_shape_init2 : Initialize an offset box shaped polygon shape with rounded corners.
pub fn box_shape_init2(poly &PolyShape, body &Body, box BB, radius Float) &PolyShape {
	return C.cpBoxShapeInit2(poly, body, box, radius)
}

// @C: `CP_EXPORT cpShape* cpBoxShapeNew(cpBody *body, cpFloat width, cpFloat height, cpFloat radius)`
fn C.cpBoxShapeNew(body &Body, width Float, height Float, radius Float) &Shape

// box_shape_new : Allocate and initialize a box shaped polygon shape.
pub fn box_shape_new(body &Body, width Float, height Float, radius Float) &Shape {
	return C.cpBoxShapeNew(body, width, height, radius)
}

// @C: `CP_EXPORT cpShape* cpBoxShapeNew2(cpBody *body, cpBB box, cpFloat radius)`
fn C.cpBoxShapeNew2(body &Body, box BB, radius Float) &Shape

// box_shape_new2 : Allocate and initialize an offset box shaped polygon shape.
pub fn box_shape_new2(body &Body, box BB, radius Float) &Shape {
	return C.cpBoxShapeNew2(body, box, radius)
}

// @C: `CP_EXPORT int cpPolyShapeGetCount(const cpShape *shape)`
fn C.cpPolyShapeGetCount(const_shape &Shape) int

// poly_shape_get_count : Get the number of verts in a polygon shape.
pub fn poly_shape_get_count(const_shape &Shape) int {
	return C.cpPolyShapeGetCount(const_shape)
}

// @C: `CP_EXPORT cpVect cpPolyShapeGetVert(const cpShape *shape, int index)`
fn C.cpPolyShapeGetVert(const_shape &Shape, index int) Vect

// poly_shape_get_vert : Get the @c ith vertex of a polygon shape.
pub fn poly_shape_get_vert(const_shape &Shape, index int) Vect {
	return C.cpPolyShapeGetVert(const_shape, index)
}

// @C: `CP_EXPORT cpFloat cpPolyShapeGetRadius(const cpShape *shape)`
fn C.cpPolyShapeGetRadius(const_shape &Shape) Float

// poly_shape_get_radius : Get the radius of a polygon shape.
pub fn poly_shape_get_radius(const_shape &Shape) Float {
	return C.cpPolyShapeGetRadius(const_shape)
}
