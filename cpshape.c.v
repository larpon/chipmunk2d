// Copyright(C) 2025 Lars Pontoppidan. All rights reserved.
// Use of this source code is governed by an MIT license
// that can be found in the LICENSE file.
module chipmunk2d

//
// cpShape.h
//

// Point query info struct.
//
@[typedef]
pub struct C.cpPointQueryInfo {
pub mut:
	// The nearest shape, NULL if no shape was within range.
	//
	shape &Shape = unsafe { nil }
	// The closest point on the shape's surface. (in world space coordinates)
	//
	point Vect
	// The distance to the point. The distance is negative if the point is inside the shape.
	//
	distance Float
	// The gradient of the signed distance function.
	// The value should be similar to info.p/info.d, but accurate even for very small values of info.d.
	//
	gradient Vect
}

pub type PointQueryInfo = C.cpPointQueryInfo

// Segment query info struct.
//
@[typedef]
pub struct C.cpSegmentQueryInfo {
pub mut:
	// The shape that was hit, or NULL if no collision occured.
	//
	shape &Shape = unsafe { nil }
	// The point of impact.
	//
	point Vect
	// The normal of the surface hit.
	//
	normal Vect
	// The normalized distance along the query segment in the range [0, 1].
	//
	alpha Float
}

pub type SegmentQueryInfo = C.cpSegmentQueryInfo

// Fast collision filtering type that is used to determine if two objects collide before calling collision or query callbacks.
//
@[typedef]
pub struct C.cpShapeFilter {
pub mut:
	// Two objects with the same non-zero group value do not collide.
	// This is generally used to group objects in a composite object together to disable self collisions.
	//
	group C.cpGroup
	// A bitmask of user definable categories that this object belongs to.
	// The category/mask combinations of both objects in a collision must agree for a collision to occur.
	//
	categories C.cpBitmask
	// A bitmask of user definable category types that this object object collides with.
	// The category/mask combinations of both objects in a collision must agree for a collision to occur.
	//
	mask C.cpBitmask
}

pub type ShapeFilter = C.cpShapeFilter

// @C: `CP_EXPORT void cpShapeDestroy(cpShape *shape)`
fn C.cpShapeDestroy(shape &Shape)

// shape_destroy : Destroy a shape.
pub fn shape_destroy(shape &Shape) {
	C.cpShapeDestroy(shape)
}

// @C: `CP_EXPORT void cpShapeFree(cpShape *shape)`
fn C.cpShapeFree(shape &Shape)

// shape_free : Destroy and Free a shape.
pub fn shape_free(shape &Shape) {
	C.cpShapeFree(shape)
}

// @C: `CP_EXPORT cpBB cpShapeCacheBB(cpShape *shape)`
fn C.cpShapeCacheBB(shape &Shape) BB

// shape_cache_bb : Update, cache and return the bounding box of a shape based on the body it's attached to.
pub fn shape_cache_bb(shape &Shape) BB {
	return C.cpShapeCacheBB(shape)
}

// @C: `CP_EXPORT cpBB cpShapeUpdate(cpShape *shape, cpTransform transform)`
fn C.cpShapeUpdate(shape &Shape, transform C.cpTransform) BB

// shape_update : Update, cache and return the bounding box of a shape with an explicit transformation.
pub fn shape_update(shape &Shape, transform C.cpTransform) BB {
	return C.cpShapeUpdate(shape, transform)
}

// @C: `CP_EXPORT cpFloat cpShapePointQuery(const cpShape *shape, cpVect p, cpPointQueryInfo *out)`
fn C.cpShapePointQuery(const_shape &Shape, p Vect, out &PointQueryInfo) Float

// shape_point_query : Perform a nearest point query. It finds the closest point on the surface of shape to a specific point.
// shape_point_query : The value returned is the distance between the points. A negative distance means the point is inside the shape.
pub fn shape_point_query(const_shape &Shape, p Vect, out &PointQueryInfo) Float {
	return C.cpShapePointQuery(const_shape, p, out)
}

// @C: `CP_EXPORT cpBool cpShapeSegmentQuery(const cpShape *shape, cpVect a, cpVect b, cpFloat radius, cpSegmentQueryInfo *info)`
fn C.cpShapeSegmentQuery(const_shape &Shape, a Vect, b Vect, radius Float, info &SegmentQueryInfo) bool // C.cpBool

// shape_segment_query : Perform a segment query against a shape. @c info must be a pointer to a valid cpSegmentQueryInfo structure.
pub fn shape_segment_query(const_shape &Shape, a Vect, b Vect, radius Float, info &SegmentQueryInfo) bool { // bool // C.cpBool
	return C.cpShapeSegmentQuery(const_shape, a, b, radius, info)
}

// @C: `CP_EXPORT cpContactPointSet cpShapesCollide(const cpShape *a, const cpShape *b)`
fn C.cpShapesCollide(const_a &Shape, const_b &Shape) ContactPointSet

// shapes_collide : Return contact information about two shapes.
pub fn shapes_collide(const_a &Shape, const_b &Shape) ContactPointSet {
	return C.cpShapesCollide(const_a, const_b)
}

// @C: `CP_EXPORT cpSpace* cpShapeGetSpace(const cpShape *shape)`
fn C.cpShapeGetSpace(const_shape &Shape) &Space

// shape_get_space : The cpSpace this body is added to.
pub fn shape_get_space(const_shape &Shape) &Space {
	return C.cpShapeGetSpace(const_shape)
}

// @C: `CP_EXPORT cpBody* cpShapeGetBody(const cpShape *shape)`
fn C.cpShapeGetBody(const_shape &Shape) &Body

// shape_get_body : The cpBody this shape is connected to.
pub fn shape_get_body(const_shape &Shape) &Body {
	return C.cpShapeGetBody(const_shape)
}

// @C: `CP_EXPORT void cpShapeSetBody(cpShape *shape, cpBody *body)`
fn C.cpShapeSetBody(shape &Shape, body &Body)

// shape_set_body : Set the cpBody this shape is connected to.
// shape_set_body : Can only be used if the shape is not currently added to a space.
pub fn shape_set_body(shape &Shape, body &Body) {
	C.cpShapeSetBody(shape, body)
}

// @C: `CP_EXPORT cpFloat cpShapeGetMass(cpShape *shape)`
fn C.cpShapeGetMass(shape &Shape) Float

// shape_get_mass : Get the mass of the shape if you are having Chipmunk calculate mass properties for you.
pub fn shape_get_mass(shape &Shape) Float {
	return C.cpShapeGetMass(shape)
}

// @C: `CP_EXPORT void cpShapeSetMass(cpShape *shape, cpFloat mass)`
fn C.cpShapeSetMass(shape &Shape, mass Float)

// shape_set_mass : Set the mass of this shape to have Chipmunk calculate mass properties for you.
pub fn shape_set_mass(shape &Shape, mass Float) {
	C.cpShapeSetMass(shape, mass)
}

// @C: `CP_EXPORT cpFloat cpShapeGetDensity(cpShape *shape)`
fn C.cpShapeGetDensity(shape &Shape) Float

// shape_get_density : Get the density of the shape if you are having Chipmunk calculate mass properties for you.
pub fn shape_get_density(shape &Shape) Float {
	return C.cpShapeGetDensity(shape)
}

// @C: `CP_EXPORT void cpShapeSetDensity(cpShape *shape, cpFloat density)`
fn C.cpShapeSetDensity(shape &Shape, density Float)

// shape_set_density : Set the density  of this shape to have Chipmunk calculate mass properties for you.
pub fn shape_set_density(shape &Shape, density Float) {
	C.cpShapeSetDensity(shape, density)
}

// @C: `CP_EXPORT cpFloat cpShapeGetMoment(cpShape *shape)`
fn C.cpShapeGetMoment(shape &Shape) Float

// shape_get_moment : Get the calculated moment of inertia for this shape.
pub fn shape_get_moment(shape &Shape) Float {
	return C.cpShapeGetMoment(shape)
}

// @C: `CP_EXPORT cpFloat cpShapeGetArea(cpShape *shape)`
fn C.cpShapeGetArea(shape &Shape) Float

// shape_get_area : Get the calculated area of this shape.
pub fn shape_get_area(shape &Shape) Float {
	return C.cpShapeGetArea(shape)
}

// @C: `CP_EXPORT cpVect cpShapeGetCenterOfGravity(cpShape *shape)`
fn C.cpShapeGetCenterOfGravity(shape &Shape) Vect

// shape_get_center_of_gravity : Get the centroid of this shape.
pub fn shape_get_center_of_gravity(shape &Shape) Vect {
	return C.cpShapeGetCenterOfGravity(shape)
}

// @C: `CP_EXPORT cpBB cpShapeGetBB(const cpShape *shape)`
fn C.cpShapeGetBB(const_shape &Shape) BB

// shape_get_bb : Get the bounding box that contains the shape given it's current position and angle.
pub fn shape_get_bb(const_shape &Shape) BB {
	return C.cpShapeGetBB(const_shape)
}

// @C: `CP_EXPORT cpBool cpShapeGetSensor(const cpShape *shape)`
fn C.cpShapeGetSensor(const_shape &Shape) bool // C.cpBool

// shape_get_sensor : Get if the shape is set to be a sensor or not.
pub fn shape_get_sensor(const_shape &Shape) bool { // bool // C.cpBool
	return C.cpShapeGetSensor(const_shape)
}

// @C: `CP_EXPORT void cpShapeSetSensor(cpShape *shape, cpBool sensor)`
fn C.cpShapeSetSensor(shape &Shape, sensor bool) // C.cpBool

// shape_set_sensor : Set if the shape is a sensor or not.
pub fn shape_set_sensor(shape &Shape, sensor bool) { // C.cpBool
	C.cpShapeSetSensor(shape, sensor)
}

// @C: `CP_EXPORT cpFloat cpShapeGetElasticity(const cpShape *shape)`
fn C.cpShapeGetElasticity(const_shape &Shape) Float

// shape_get_elasticity : Get the elasticity of this shape.
pub fn shape_get_elasticity(const_shape &Shape) Float {
	return C.cpShapeGetElasticity(const_shape)
}

// @C: `CP_EXPORT void cpShapeSetElasticity(cpShape *shape, cpFloat elasticity)`
fn C.cpShapeSetElasticity(shape &Shape, elasticity Float)

// shape_set_elasticity : Set the elasticity of this shape.
pub fn shape_set_elasticity(shape &Shape, elasticity Float) {
	C.cpShapeSetElasticity(shape, elasticity)
}

// @C: `CP_EXPORT cpFloat cpShapeGetFriction(const cpShape *shape)`
fn C.cpShapeGetFriction(const_shape &Shape) Float

// shape_get_friction : Get the friction of this shape.
pub fn shape_get_friction(const_shape &Shape) Float {
	return C.cpShapeGetFriction(const_shape)
}

// @C: `CP_EXPORT void cpShapeSetFriction(cpShape *shape, cpFloat friction)`
fn C.cpShapeSetFriction(shape &Shape, friction Float)

// shape_set_friction : Set the friction of this shape.
pub fn shape_set_friction(shape &Shape, friction Float) {
	C.cpShapeSetFriction(shape, friction)
}

// @C: `CP_EXPORT cpVect cpShapeGetSurfaceVelocity(const cpShape *shape)`
fn C.cpShapeGetSurfaceVelocity(const_shape &Shape) Vect

// shape_get_surface_velocity : Get the surface velocity of this shape.
pub fn shape_get_surface_velocity(const_shape &Shape) Vect {
	return C.cpShapeGetSurfaceVelocity(const_shape)
}

// @C: `CP_EXPORT void cpShapeSetSurfaceVelocity(cpShape *shape, cpVect surfaceVelocity)`
fn C.cpShapeSetSurfaceVelocity(shape &Shape, surface_velocity Vect)

// shape_set_surface_velocity : Set the surface velocity of this shape.
pub fn shape_set_surface_velocity(shape &Shape, surface_velocity Vect) {
	C.cpShapeSetSurfaceVelocity(shape, surface_velocity)
}

// @C: `CP_EXPORT cpDataPointer cpShapeGetUserData(const cpShape *shape)`
fn C.cpShapeGetUserData(const_shape &Shape) DataPointer

// shape_get_user_data : Get the user definable data pointer of this shape.
pub fn shape_get_user_data(const_shape &Shape) DataPointer {
	return C.cpShapeGetUserData(const_shape)
}

// @C: `CP_EXPORT void cpShapeSetUserData(cpShape *shape, cpDataPointer userData)`
fn C.cpShapeSetUserData(shape &Shape, user_data DataPointer)

// shape_set_user_data : Set the user definable data pointer of this shape.
pub fn shape_set_user_data(shape &Shape, user_data DataPointer) {
	C.cpShapeSetUserData(shape, user_data)
}

// @C: `CP_EXPORT cpCollisionType cpShapeGetCollisionType(const cpShape *shape)`
fn C.cpShapeGetCollisionType(const_shape &Shape) CollisionType

// shape_get_collision_type : Set the collision type of this shape.
pub fn shape_get_collision_type(const_shape &Shape) CollisionType {
	return C.cpShapeGetCollisionType(const_shape)
}

// @C: `CP_EXPORT void cpShapeSetCollisionType(cpShape *shape, cpCollisionType collisionType)`
fn C.cpShapeSetCollisionType(shape &Shape, collision_type CollisionType)

// shape_set_collision_type : Get the collision type of this shape.
pub fn shape_set_collision_type(shape &Shape, collision_type CollisionType) {
	C.cpShapeSetCollisionType(shape, collision_type)
}

// @C: `CP_EXPORT cpShapeFilter cpShapeGetFilter(const cpShape *shape)`
fn C.cpShapeGetFilter(const_shape &Shape) ShapeFilter

// shape_get_filter : Get the collision filtering parameters of this shape.
pub fn shape_get_filter(const_shape &Shape) ShapeFilter {
	return C.cpShapeGetFilter(const_shape)
}

// @C: `CP_EXPORT void cpShapeSetFilter(cpShape *shape, cpShapeFilter filter)`
fn C.cpShapeSetFilter(shape &Shape, filter ShapeFilter)

// shape_set_filter : Set the collision filtering parameters of this shape.
pub fn shape_set_filter(shape &Shape, filter ShapeFilter) {
	C.cpShapeSetFilter(shape, filter)
}

// @C: `CP_EXPORT cpCircleShape* cpCircleShapeAlloc(void)`
fn C.cpCircleShapeAlloc() &CircleShape

// circle_shape_alloc : Allocate a circle shape.
pub fn circle_shape_alloc() &CircleShape {
	return C.cpCircleShapeAlloc()
}

// @C: `CP_EXPORT cpCircleShape* cpCircleShapeInit(cpCircleShape *circle, cpBody *body, cpFloat radius, cpVect offset)`
fn C.cpCircleShapeInit(circle &CircleShape, body &Body, radius Float, offset Vect) &CircleShape

// circle_shape_init : Initialize a circle shape.
pub fn circle_shape_init(circle &CircleShape, body &Body, radius Float, offset Vect) &CircleShape {
	return C.cpCircleShapeInit(circle, body, radius, offset)
}

// @C: `CP_EXPORT cpShape* cpCircleShapeNew(cpBody *body, cpFloat radius, cpVect offset)`
fn C.cpCircleShapeNew(body &Body, radius Float, offset Vect) &Shape

// circle_shape_new : Allocate and initialize a circle shape.
pub fn circle_shape_new(body &Body, radius Float, offset Vect) &Shape {
	return C.cpCircleShapeNew(body, radius, offset)
}

// @C: `CP_EXPORT cpVect cpCircleShapeGetOffset(const cpShape *shape)`
fn C.cpCircleShapeGetOffset(const_shape &Shape) Vect

// circle_shape_get_offset : Get the offset of a circle shape.
pub fn circle_shape_get_offset(const_shape &Shape) Vect {
	return C.cpCircleShapeGetOffset(const_shape)
}

// @C: `CP_EXPORT cpFloat cpCircleShapeGetRadius(const cpShape *shape)`
fn C.cpCircleShapeGetRadius(const_shape &Shape) Float

// circle_shape_get_radius : Get the radius of a circle shape.
pub fn circle_shape_get_radius(const_shape &Shape) Float {
	return C.cpCircleShapeGetRadius(const_shape)
}

// @C: `CP_EXPORT cpSegmentShape* cpSegmentShapeAlloc(void)`
fn C.cpSegmentShapeAlloc() &SegmentShape

// segment_shape_alloc : Allocate a segment shape.
pub fn segment_shape_alloc() &SegmentShape {
	return C.cpSegmentShapeAlloc()
}

// @C: `CP_EXPORT cpSegmentShape* cpSegmentShapeInit(cpSegmentShape *seg, cpBody *body, cpVect a, cpVect b, cpFloat radius)`
fn C.cpSegmentShapeInit(seg &SegmentShape, body &Body, a Vect, b Vect, radius Float) &SegmentShape

// segment_shape_init : Initialize a segment shape.
pub fn segment_shape_init(seg &SegmentShape, body &Body, a Vect, b Vect, radius Float) &SegmentShape {
	return C.cpSegmentShapeInit(seg, body, a, b, radius)
}

// @C: `CP_EXPORT cpShape* cpSegmentShapeNew(cpBody *body, cpVect a, cpVect b, cpFloat radius)`
fn C.cpSegmentShapeNew(body &Body, a Vect, b Vect, radius Float) &Shape

// segment_shape_new : Allocate and initialize a segment shape.
pub fn segment_shape_new(body &Body, a Vect, b Vect, radius Float) &Shape {
	return C.cpSegmentShapeNew(body, a, b, radius)
}

// @C: `CP_EXPORT void cpSegmentShapeSetNeighbors(cpShape *shape, cpVect prev, cpVect next)`
fn C.cpSegmentShapeSetNeighbors(shape &Shape, prev Vect, next Vect)

// segment_shape_set_neighbors : Let Chipmunk know about the geometry of adjacent segments to avoid colliding with endcaps.
pub fn segment_shape_set_neighbors(shape &Shape, prev Vect, next Vect) {
	C.cpSegmentShapeSetNeighbors(shape, prev, next)
}

// @C: `CP_EXPORT cpVect cpSegmentShapeGetA(const cpShape *shape)`
fn C.cpSegmentShapeGetA(const_shape &Shape) Vect

// segment_shape_get_a : Get the first endpoint of a segment shape.
pub fn segment_shape_get_a(const_shape &Shape) Vect {
	return C.cpSegmentShapeGetA(const_shape)
}

// @C: `CP_EXPORT cpVect cpSegmentShapeGetB(const cpShape *shape)`
fn C.cpSegmentShapeGetB(const_shape &Shape) Vect

// segment_shape_get_b : Get the second endpoint of a segment shape.
pub fn segment_shape_get_b(const_shape &Shape) Vect {
	return C.cpSegmentShapeGetB(const_shape)
}

// @C: `CP_EXPORT cpVect cpSegmentShapeGetNormal(const cpShape *shape)`
fn C.cpSegmentShapeGetNormal(const_shape &Shape) Vect

// segment_shape_get_normal : Get the normal of a segment shape.
pub fn segment_shape_get_normal(const_shape &Shape) Vect {
	return C.cpSegmentShapeGetNormal(const_shape)
}

// @C: `CP_EXPORT cpFloat cpSegmentShapeGetRadius(const cpShape *shape)`
fn C.cpSegmentShapeGetRadius(const_shape &Shape) Float

// segment_shape_get_radius : Get the first endpoint of a segment shape.
pub fn segment_shape_get_radius(const_shape &Shape) Float {
	return C.cpSegmentShapeGetRadius(const_shape)
}
