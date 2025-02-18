// Copyright(C) 2025 Lars Pontoppidan. All rights reserved.
// Use of this source code is governed by an MIT license
// that can be found in the LICENSE file.
module chipmunk2d

//
// cpPolyline.h
//

// Polylines are just arrays of vertexes.
// They are looped if the first vertex is equal to the last.
// cpPolyline structs are intended to be passed by value and destroyed when you are done with them.
//
@[typedef]
pub struct C.cpPolyline {
pub mut:
	count    int
	capacity int
	// TODO 	verts []Vect
}

pub type Polyline = C.cpPolyline

// @C: `CP_EXPORT void cpPolylineFree(cpPolyline *line)`
fn C.cpPolylineFree(line &Polyline)

// polyline_free : Destroy and free a polyline instance.
pub fn polyline_free(line &Polyline) {
	C.cpPolylineFree(line)
}

// @C: `CP_EXPORT cpBool cpPolylineIsClosed(cpPolyline *line)`
fn C.cpPolylineIsClosed(line &Polyline) bool // C.cpBool

// polyline_is_closed : Returns true if the first vertex is equal to the last.
pub fn polyline_is_closed(line &Polyline) bool { // bool // C.cpBool
	return C.cpPolylineIsClosed(line)
}

// @C: `CP_EXPORT cpPolyline *cpPolylineSimplifyCurves(cpPolyline *line, cpFloat tol)`
fn C.cpPolylineSimplifyCurves(line &Polyline, tol Float) &Polyline

// polyline_simplify_curves 	returns a copy of a polyline simplified by using the Douglas-Peucker algorithm.
//	This works very well on smooth or gently curved shapes, but not well on straight edged or angular shapes.
pub fn polyline_simplify_curves(line &Polyline, tol Float) &Polyline {
	return C.cpPolylineSimplifyCurves(line, tol)
}

// @C: `CP_EXPORT cpPolyline *cpPolylineSimplifyVertexes(cpPolyline *line, cpFloat tol)`
fn C.cpPolylineSimplifyVertexes(line &Polyline, tol Float) &Polyline

// polyline_simplify_vertexes 	returns a copy of a polyline simplified by discarding "flat" vertexes.
//	This works well on straight edged or angular shapes, not as well on smooth shapes.
pub fn polyline_simplify_vertexes(line &Polyline, tol Float) &Polyline {
	return C.cpPolylineSimplifyVertexes(line, tol)
}

// @C: `CP_EXPORT cpPolyline *cpPolylineToConvexHull(cpPolyline *line, cpFloat tol)`
fn C.cpPolylineToConvexHull(line &Polyline, tol Float) &Polyline

// polyline_to_convex_hull : Get the convex hull of a polyline as a looped polyline.
pub fn polyline_to_convex_hull(line &Polyline, tol Float) &Polyline {
	return C.cpPolylineToConvexHull(line, tol)
}

// Polyline sets are collections of polylines, generally built by cpMarchSoft() or cpMarchHard().
//
@[typedef]
pub struct C.cpPolylineSet {
pub mut:
	count    int
	capacity int
	// TODO 	*lines &Polyline = unsafe { nil }
}

pub type PolylineSet = C.cpPolylineSet

// @C: `CP_EXPORT cpPolylineSet *cpPolylineSetAlloc(void)`
fn C.cpPolylineSetAlloc() &PolylineSet

// polyline_set_alloc : Allocate a new polyline set.
pub fn polyline_set_alloc() &PolylineSet {
	return C.cpPolylineSetAlloc()
}

// @C: `CP_EXPORT cpPolylineSet *cpPolylineSetInit(cpPolylineSet *set)`
fn C.cpPolylineSetInit(set &PolylineSet) &PolylineSet

// polyline_set_init : Initialize a new polyline set.
pub fn polyline_set_init(set &PolylineSet) &PolylineSet {
	return C.cpPolylineSetInit(set)
}

// @C: `CP_EXPORT cpPolylineSet *cpPolylineSetNew(void)`
fn C.cpPolylineSetNew() &PolylineSet

// polyline_set_new : Allocate and initialize a polyline set.
pub fn polyline_set_new() &PolylineSet {
	return C.cpPolylineSetNew()
}

// @C: `CP_EXPORT void cpPolylineSetDestroy(cpPolylineSet *set, cpBool freePolylines)`
fn C.cpPolylineSetDestroy(set &PolylineSet, free_polylines bool, l) // C.cpBool

// polyline_set_destroy : Destroy a polyline set.
pub fn polyline_set_destroy(set &PolylineSet, free_polylines bool) { // C.cpBool
	C.cpPolylineSetDestroy(set, free_polylines)
}

// @C: `CP_EXPORT void cpPolylineSetFree(cpPolylineSet *set, cpBool freePolylines)`
fn C.cpPolylineSetFree(set &PolylineSet, free_polylines bool) // C.cpBool

// polyline_set_free : Destroy and free a polyline set.
pub fn polyline_set_free(set &PolylineSet, free_polylines bool) { // C.cpBool
	C.cpPolylineSetFree(set, free_polylines)
}

// @C: `CP_EXPORT void cpPolylineSetCollectSegment(cpVect v0, cpVect v1, cpPolylineSet *lines)`
fn C.cpPolylineSetCollectSegment(v0 Vect, v1 Vect, lines &PolylineSet)

// polyline_set_collect_segment 	adds a line segment to a polyline set.
//	A segment will either start a new polyline, join two others, or add to or loop an existing polyline.
//	This is mostly intended to be used as a callback directly from cpMarchSoft() or cpMarchHard().
pub fn polyline_set_collect_segment(v0 Vect, v1 Vect, lines &PolylineSet) {
	C.cpPolylineSetCollectSegment(v0, v1, lines)
}

// @C: `CP_EXPORT cpPolylineSet *cpPolylineConvexDecomposition(cpPolyline *line, cpFloat tol)`
fn C.cpPolylineConvexDecomposition(line &Polyline, tol Float) &PolylineSet

// polyline_convex_decomposition is currently undocumented
pub fn polyline_convex_decomposition(line &Polyline, tol Float) &PolylineSet {
	return C.cpPolylineConvexDecomposition(line, tol)
}

// TODO Non-numerical: #define cpPolylineConvexDecomposition_BETA cpPolylineConvexDecomposition
