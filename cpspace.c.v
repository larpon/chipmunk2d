// Copyright(C) 2025 Lars Pontoppidan. All rights reserved.
// Use of this source code is governed by an MIT license
// that can be found in the LICENSE file.
module chipmunk2d

//
// cpSpace.h
//

// CollisionBeginFunc : Collision begin event function callback type.
// CollisionBeginFunc : Returning false from a begin callback causes the collision to be ignored until
// the the separate callback is called when the objects stop colliding.
// @C: typedef cpBool (*cpCollisionBeginFunc)(cpArbiter *arb, cpSpace *space, cpDataPointer userData);
pub type CollisionBeginFunc = fn (arb &Arbiter, space &Space, user_data DataPointer) bool // C.cpBool

// CollisionPreSolveFunc : Collision pre-solve event function callback type.
// CollisionPreSolveFunc : Returning false from a pre-step callback causes the collision to be ignored until the next step.
// @C: typedef cpBool (*cpCollisionPreSolveFunc)(cpArbiter *arb, cpSpace *space, cpDataPointer userData);
pub type CollisionPreSolveFunc = fn (arb &Arbiter, space &Space, user_data DataPointer) bool // C.cpBool

// CollisionPostSolveFunc : Collision post-solve event function callback type.
// @C: typedef void (*cpCollisionPostSolveFunc)(cpArbiter *arb, cpSpace *space, cpDataPointer userData);
pub type CollisionPostSolveFunc = fn (arb &Arbiter, space &Space, user_data DataPointer)

// CollisionSeparateFunc : Collision separate event function callback type.
// @C: typedef void (*cpCollisionSeparateFunc)(cpArbiter *arb, cpSpace *space, cpDataPointer userData);
pub type CollisionSeparateFunc = fn (arb &Arbiter, space &Space, user_data DataPointer)

// Struct that holds function callback pointers to configure custom collision handling.
// Collision handlers have a pair of types; when a collision occurs between two shapes that have these types, the collision handler functions are triggered.
//
@[typedef]
pub struct C.cpCollisionHandler {
pub mut:
	// Collision type identifier of the first shape that this handler recognizes.
	// In the collision handler callback, the shape with this type will be the first argument. Read only.
	//
	typeA CollisionType
	// Collision type identifier of the second shape that this handler recognizes.
	// In the collision handler callback, the shape with this type will be the second argument. Read only.
	//
	typeB CollisionType
	// This function is called when two shapes with types that match this collision handler begin colliding.
	//
	beginFunc C.cpCollisionBeginFunc
	// This function is called each step when two shapes with types that match this collision handler are colliding.
	// It's called before the collision solver runs so that you can affect a collision's outcome.
	//
	preSolveFunc C.cpCollisionPreSolveFunc
	// This function is called each step when two shapes with types that match this collision handler are colliding.
	// It's called after the collision solver runs so that you can read back information about the collision to trigger events in your game.
	//
	postSolveFunc C.cpCollisionPostSolveFunc
	// This function is called when two shapes with types that match this collision handler stop colliding.
	//
	separateFunc C.cpCollisionSeparateFunc
	// This is a user definable context pointer that is passed to all of the collision handler functions.
	//
	userData DataPointer
}

pub type CollisionHandler = C.cpCollisionHandler

// @C: `CP_EXPORT cpSpace* cpSpaceAlloc(void)`
fn C.cpSpaceAlloc() &Space

// space_alloc : Allocate a cpSpace.
pub fn space_alloc() &Space {
	return C.cpSpaceAlloc()
}

// @C: `CP_EXPORT cpSpace* cpSpaceInit(cpSpace *space)`
fn C.cpSpaceInit(space &Space) &Space

// space_init : Initialize a cpSpace.
pub fn space_init(space &Space) &Space {
	return C.cpSpaceInit(space)
}

// @C: `CP_EXPORT cpSpace* cpSpaceNew(void)`
fn C.cpSpaceNew() &Space

// space_new : Allocate and initialize a cpSpace.
pub fn space_new() &Space {
	return C.cpSpaceNew()
}

// @C: `CP_EXPORT void cpSpaceDestroy(cpSpace *space)`
fn C.cpSpaceDestroy(space &Space)

// space_destroy : Destroy a cpSpace.
pub fn space_destroy(space &Space) {
	C.cpSpaceDestroy(space)
}

// @C: `CP_EXPORT void cpSpaceFree(cpSpace *space)`
fn C.cpSpaceFree(space &Space)

// space_free : Destroy and free a cpSpace.
pub fn space_free(space &Space) {
	C.cpSpaceFree(space)
}

// @C: `CP_EXPORT int cpSpaceGetIterations(const cpSpace *space)`
fn C.cpSpaceGetIterations(const_space &Space) int

// space_get_iterations : Number of iterations to use in the impulse solver to solve contacts and other constraints.
pub fn space_get_iterations(const_space &Space) int {
	return C.cpSpaceGetIterations(const_space)
}

// @C: `CP_EXPORT void cpSpaceSetIterations(cpSpace *space, int iterations)`
fn C.cpSpaceSetIterations(space &Space, iterations int)

// space_set_iterations is currently undocumented
pub fn space_set_iterations(space &Space, iterations int) {
	C.cpSpaceSetIterations(space, iterations)
}

// @C: `CP_EXPORT cpVect cpSpaceGetGravity(const cpSpace *space)`
fn C.cpSpaceGetGravity(const_space &Space) Vect

// space_get_gravity : Gravity to pass to rigid bodies when integrating velocity.
pub fn space_get_gravity(const_space &Space) Vect {
	return C.cpSpaceGetGravity(const_space)
}

// @C: `CP_EXPORT void cpSpaceSetGravity(cpSpace *space, cpVect gravity)`
fn C.cpSpaceSetGravity(space &Space, gravity Vect)

// space_set_gravity is currently undocumented
pub fn space_set_gravity(space &Space, gravity Vect) {
	C.cpSpaceSetGravity(space, gravity)
}

// @C: `CP_EXPORT cpFloat cpSpaceGetDamping(const cpSpace *space)`
fn C.cpSpaceGetDamping(const_space &Space) Float

// space_get_damping : Damping rate expressed as the fraction of velocity bodies retain each second.
// space_get_damping : A value of 0.9 would mean that each body's velocity will drop 10% per second.
// The default value is 1.0, meaning no damping is applied.
// NOTE: This damping value is different than those of cpDampedSpring and cpDampedRotarySpring.
pub fn space_get_damping(const_space &Space) Float {
	return C.cpSpaceGetDamping(const_space)
}

// @C: `CP_EXPORT void cpSpaceSetDamping(cpSpace *space, cpFloat damping)`
fn C.cpSpaceSetDamping(space &Space, damping Float)

// space_set_damping is currently undocumented
pub fn space_set_damping(space &Space, damping Float) {
	C.cpSpaceSetDamping(space, damping)
}

// @C: `CP_EXPORT cpFloat cpSpaceGetIdleSpeedThreshold(const cpSpace *space)`
fn C.cpSpaceGetIdleSpeedThreshold(const_space &Space) Float

// space_get_idle_speed_threshold : Speed threshold for a body to be considered idle.
// space_get_idle_speed_threshold : The default value of 0 means to let the space guess a good threshold based on gravity.
pub fn space_get_idle_speed_threshold(const_space &Space) Float {
	return C.cpSpaceGetIdleSpeedThreshold(const_space)
}

// @C: `CP_EXPORT void cpSpaceSetIdleSpeedThreshold(cpSpace *space, cpFloat idleSpeedThreshold)`
fn C.cpSpaceSetIdleSpeedThreshold(space &Space, idle_speed_threshold Float)

// space_set_idle_speed_threshold is currently undocumented
pub fn space_set_idle_speed_threshold(space &Space, idle_speed_threshold Float) {
	C.cpSpaceSetIdleSpeedThreshold(space, idle_speed_threshold)
}

// @C: `CP_EXPORT cpFloat cpSpaceGetSleepTimeThreshold(const cpSpace *space)`
fn C.cpSpaceGetSleepTimeThreshold(const_space &Space) Float

// space_get_sleep_time_threshold : Time a group of bodies must remain idle in order to fall asleep.
// space_get_sleep_time_threshold : Enabling sleeping also implicitly enables the the contact graph.
// The default value of INFINITY disables the sleeping algorithm.
pub fn space_get_sleep_time_threshold(const_space &Space) Float {
	return C.cpSpaceGetSleepTimeThreshold(const_space)
}

// @C: `CP_EXPORT void cpSpaceSetSleepTimeThreshold(cpSpace *space, cpFloat sleepTimeThreshold)`
fn C.cpSpaceSetSleepTimeThreshold(space &Space, sleep_time_threshold Float)

// space_set_sleep_time_threshold is currently undocumented
pub fn space_set_sleep_time_threshold(space &Space, sleep_time_threshold Float) {
	C.cpSpaceSetSleepTimeThreshold(space, sleep_time_threshold)
}

// @C: `CP_EXPORT cpFloat cpSpaceGetCollisionSlop(const cpSpace *space)`
fn C.cpSpaceGetCollisionSlop(const_space &Space) Float

// space_get_collision_slop : Amount of encouraged penetration between colliding shapes.
// space_get_collision_slop : Used to reduce oscillating contacts and keep the collision cache warm.
// Defaults to 0.1. If you have poor simulation quality,
// increase this number as much as possible without allowing visible amounts of overlap.
pub fn space_get_collision_slop(const_space &Space) Float {
	return C.cpSpaceGetCollisionSlop(const_space)
}

// @C: `CP_EXPORT void cpSpaceSetCollisionSlop(cpSpace *space, cpFloat collisionSlop)`
fn C.cpSpaceSetCollisionSlop(space &Space, collision_slop Float)

// space_set_collision_slop is currently undocumented
pub fn space_set_collision_slop(space &Space, collision_slop Float) {
	C.cpSpaceSetCollisionSlop(space, collision_slop)
}

// @C: `CP_EXPORT cpFloat cpSpaceGetCollisionBias(const cpSpace *space)`
fn C.cpSpaceGetCollisionBias(const_space &Space) Float

// space_get_collision_bias : Determines how fast overlapping shapes are pushed apart.
// space_get_collision_bias : Expressed as a fraction of the error remaining after each second.
// Defaults to pow(1.0 - 0.1, 60.0) meaning that Chipmunk fixes 10% of overlap each frame at 60Hz.
pub fn space_get_collision_bias(const_space &Space) Float {
	return C.cpSpaceGetCollisionBias(const_space)
}

// @C: `CP_EXPORT void cpSpaceSetCollisionBias(cpSpace *space, cpFloat collisionBias)`
fn C.cpSpaceSetCollisionBias(space &Space, collision_bias Float)

// space_set_collision_bias is currently undocumented
pub fn space_set_collision_bias(space &Space, collision_bias Float) {
	C.cpSpaceSetCollisionBias(space, collision_bias)
}

// @C: `CP_EXPORT cpTimestamp cpSpaceGetCollisionPersistence(const cpSpace *space)`
fn C.cpSpaceGetCollisionPersistence(const_space &Space) Timestamp

// space_get_collision_persistence : Number of frames that contact information should persist.
// space_get_collision_persistence : Defaults to 3. There is probably never a reason to change this value.
pub fn space_get_collision_persistence(const_space &Space) Timestamp {
	return C.cpSpaceGetCollisionPersistence(const_space)
}

// @C: `CP_EXPORT void cpSpaceSetCollisionPersistence(cpSpace *space, cpTimestamp collisionPersistence)`
fn C.cpSpaceSetCollisionPersistence(space &Space, collision_persistence Timestamp)

// space_set_collision_persistence is currently undocumented
pub fn space_set_collision_persistence(space &Space, collision_persistence Timestamp) {
	C.cpSpaceSetCollisionPersistence(space, collision_persistence)
}

// @C: `CP_EXPORT cpDataPointer cpSpaceGetUserData(const cpSpace *space)`
fn C.cpSpaceGetUserData(const_space &Space) DataPointer

// space_get_user_data : User definable data pointer.
// space_get_user_data : Generally this points to your game's controller or game state
// class so you can access it when given a cpSpace reference in a callback.
pub fn space_get_user_data(const_space &Space) DataPointer {
	return C.cpSpaceGetUserData(const_space)
}

// @C: `CP_EXPORT void cpSpaceSetUserData(cpSpace *space, cpDataPointer userData)`
fn C.cpSpaceSetUserData(space &Space, user_data DataPointer)

// space_set_user_data is currently undocumented
pub fn space_set_user_data(space &Space, user_data DataPointer) {
	C.cpSpaceSetUserData(space, user_data)
}

// @C: `CP_EXPORT cpBody* cpSpaceGetStaticBody(const cpSpace *space)`
fn C.cpSpaceGetStaticBody(const_space &Space) &Body

// space_get_static_body : The Space provided static body for a given cpSpace.
// space_get_static_body : This is merely provided for convenience and you are not required to use it.
pub fn space_get_static_body(const_space &Space) &Body {
	return C.cpSpaceGetStaticBody(const_space)
}

// @C: `CP_EXPORT cpFloat cpSpaceGetCurrentTimeStep(const cpSpace *space)`
fn C.cpSpaceGetCurrentTimeStep(const_space &Space) Float

// space_get_current_time_step : Returns the current (or most recent) time step used with the given space.
// space_get_current_time_step : Useful from callbacks if your time step is not a compile-time global.
pub fn space_get_current_time_step(const_space &Space) Float {
	return C.cpSpaceGetCurrentTimeStep(const_space)
}

// @C: `CP_EXPORT cpBool cpSpaceIsLocked(cpSpace *space)`
fn C.cpSpaceIsLocked(space &Space) bool // C.cpBool

// space_is_locked : returns true from inside a callback when objects cannot be added/removed.
pub fn space_is_locked(space &Space) bool { // bool // C.cpBool
	return C.cpSpaceIsLocked(space)
}

// @C: `CP_EXPORT cpCollisionHandler *cpSpaceAddDefaultCollisionHandler(cpSpace *space)`
fn C.cpSpaceAddDefaultCollisionHandler(space &Space) &CollisionHandler

// space_add_default_collision_handler : Create or return the existing collision handler that is called for all collisions that are not handled by a more specific collision handler.
pub fn space_add_default_collision_handler(space &Space) &CollisionHandler {
	return C.cpSpaceAddDefaultCollisionHandler(space)
}

// @C: `CP_EXPORT cpCollisionHandler *cpSpaceAddCollisionHandler(cpSpace *space, cpCollisionType a, cpCollisionType b)`
fn C.cpSpaceAddCollisionHandler(space &Space, a CollisionType, b CollisionType) &CollisionHandler

// space_add_collision_handler : Create or return the existing collision handler for the specified pair of collision types.
// space_add_collision_handler : If wildcard handlers are used with either of the collision types, it's the responibility of the custom handler to invoke the wildcard handlers.
pub fn space_add_collision_handler(space &Space, a CollisionType, b CollisionType) &CollisionHandler {
	return C.cpSpaceAddCollisionHandler(space, a, b)
}

// @C: `CP_EXPORT cpCollisionHandler *cpSpaceAddWildcardHandler(cpSpace *space, cpCollisionType type)`
fn C.cpSpaceAddWildcardHandler(space &Space, type, CollisionType) &CollisionHandler

// space_add_wildcard_handler : Create or return the existing wildcard collision handler for the specified type.
pub fn space_add_wildcard_handler(space &Space, type CollisionType) &CollisionHandler {
	return C.cpSpaceAddWildcardHandler(space, type)
}

// @C: `CP_EXPORT cpShape* cpSpaceAddShape(cpSpace *space, cpShape *shape)`
fn C.cpSpaceAddShape(space &Space, shape &Shape) &Shape

// space_add_shape : Add a collision shape to the simulation.
// space_add_shape : If the shape is attached to a static body, it will be added as a static shape.
pub fn space_add_shape(space &Space, shape &Shape) &Shape {
	return C.cpSpaceAddShape(space, shape)
}

// @C: `CP_EXPORT cpBody* cpSpaceAddBody(cpSpace *space, cpBody *body)`
fn C.cpSpaceAddBody(space &Space, body &Body) &Body

// space_add_body : Add a rigid body to the simulation.
pub fn space_add_body(space &Space, body &Body) &Body {
	return C.cpSpaceAddBody(space, body)
}

// @C: `CP_EXPORT cpConstraint* cpSpaceAddConstraint(cpSpace *space, cpConstraint *constraint)`
fn C.cpSpaceAddConstraint(space &Space, constraint &Constraint) &Constraint

// space_add_constraint : Add a constraint to the simulation.
pub fn space_add_constraint(space &Space, constraint &Constraint) &Constraint {
	return C.cpSpaceAddConstraint(space, constraint)
}

// @C: `CP_EXPORT void cpSpaceRemoveShape(cpSpace *space, cpShape *shape)`
fn C.cpSpaceRemoveShape(space &Space, shape &Shape)

// space_remove_shape : Remove a collision shape from the simulation.
pub fn space_remove_shape(space &Space, shape &Shape) {
	C.cpSpaceRemoveShape(space, shape)
}

// @C: `CP_EXPORT void cpSpaceRemoveBody(cpSpace *space, cpBody *body)`
fn C.cpSpaceRemoveBody(space &Space, body &Body)

// space_remove_body : Remove a rigid body from the simulation.
pub fn space_remove_body(space &Space, body &Body) {
	C.cpSpaceRemoveBody(space, body)
}

// @C: `CP_EXPORT void cpSpaceRemoveConstraint(cpSpace *space, cpConstraint *constraint)`
fn C.cpSpaceRemoveConstraint(space &Space, constraint &Constraint)

// space_remove_constraint : Remove a constraint from the simulation.
pub fn space_remove_constraint(space &Space, constraint &Constraint) {
	C.cpSpaceRemoveConstraint(space, constraint)
}

// @C: `CP_EXPORT cpBool cpSpaceContainsShape(cpSpace *space, cpShape *shape)`
fn C.cpSpaceContainsShape(space &Space, shape &Shape) bool // C.cpBool

// space_contains_shape : Test if a collision shape has been added to the space.
pub fn space_contains_shape(space &Space, shape &Shape) bool { // bool // C.cpBool
	return C.cpSpaceContainsShape(space, shape)
}

// @C: `CP_EXPORT cpBool cpSpaceContainsBody(cpSpace *space, cpBody *body)`
fn C.cpSpaceContainsBody(space &Space, body &Body) bool // C.cpBool

// space_contains_body : Test if a rigid body has been added to the space.
pub fn space_contains_body(space &Space, body &Body) bool { // bool // C.cpBool
	return C.cpSpaceContainsBody(space, body)
}

// @C: `CP_EXPORT cpBool cpSpaceContainsConstraint(cpSpace *space, cpConstraint *constraint)`
fn C.cpSpaceContainsConstraint(space &Space, constraint &Constraint) bool // C.cpBool

// space_contains_constraint : Test if a constraint has been added to the space.
pub fn space_contains_constraint(space &Space, constraint &Constraint) bool { // bool // C.cpBool
	return C.cpSpaceContainsConstraint(space, constraint)
}

// PostStepFunc : Post Step callback function type.
// @C: typedef void (*cpPostStepFunc)(cpSpace *space, void *key, void *data);
pub type PostStepFunc = fn (space &Space, key voidptr, data voidptr)

// @C: `CP_EXPORT cpBool cpSpaceAddPostStepCallback(cpSpace *space, cpPostStepFunc func, void *key, void *data)`
fn C.cpSpaceAddPostStepCallback(space &Space, func C.cpPostStepFunc, key voidptr, data voidptr) bool // C.cpBool

// space_add_post_step_callback : Schedule a post-step callback to be called when cpSpaceStep() finishes.
// space_add_post_step_callback : You can only register one callback per unique value for @c key.
// Returns true only if @c key has never been scheduled before.
// It's possible to pass @c NULL for @c func if you only want to mark @c key as being used.
pub fn space_add_post_step_callback(space &Space, func C.cpPostStepFunc, key voidptr, data voidptr) bool { // bool // C.cpBool
	return C.cpSpaceAddPostStepCallback(space, func, key, data)
}

// SpacePointQueryFunc : Nearest point query callback function type.
// @C: typedef void (*cpSpacePointQueryFunc)(cpShape *shape, cpVect point, cpFloat distance, cpVect gradient, void *data);
pub type SpacePointQueryFunc = fn (shape &Shape, point Vect, distance Float, gradient Vect, data voidptr)

// @C: `CP_EXPORT void cpSpacePointQuery(cpSpace *space, cpVect point, cpFloat maxDistance, cpShapeFilter filter, cpSpacePointQueryFunc func, void *data)`
fn C.cpSpacePointQuery(space &Space, point Vect, max_distance Float, filter ShapeFilter, func C.cpSpacePointQueryFunc, data voidptr)

// space_point_query : Query the space at a point and call @c func for each shape found.
pub fn space_point_query(space &Space, point Vect, max_distance Float, filter ShapeFilter, func C.cpSpacePointQueryFunc, data voidptr) {
	C.cpSpacePointQuery(space, point, max_distance, filter, func, data)
}

// @C: `CP_EXPORT cpShape *cpSpacePointQueryNearest(cpSpace *space, cpVect point, cpFloat maxDistance, cpShapeFilter filter, cpPointQueryInfo *out)`
fn C.cpSpacePointQueryNearest(space &Space, point Vect, max_distance Float, filter ShapeFilter, out &PointQueryInfo) &Shape

// space_point_query_nearest : Query the space at a point and return the nearest shape found. Returns NULL if no shapes were found.
pub fn space_point_query_nearest(space &Space, point Vect, max_distance Float, filter ShapeFilter, out &PointQueryInfo) &Shape {
	return C.cpSpacePointQueryNearest(space, point, max_distance, filter, out)
}

// SpaceSegmentQueryFunc : Segment query callback function type.
// @C: typedef void (*cpSpaceSegmentQueryFunc)(cpShape *shape, cpVect point, cpVect normal, cpFloat alpha, void *data);
pub type SpaceSegmentQueryFunc = fn (shape &Shape, point Vect, normal Vect, alpha Float, data voidptr)

// @C: `CP_EXPORT void cpSpaceSegmentQuery(cpSpace *space, cpVect start, cpVect end, cpFloat radius, cpShapeFilter filter, cpSpaceSegmentQueryFunc func, void *data)`
fn C.cpSpaceSegmentQuery(space &Space, start Vect, end Vect, radius Float, filter ShapeFilter, func C.cpSpaceSegmentQueryFunc, data voidptr)

// space_segment_query : Perform a directed line segment query (like a raycast) against the space calling @c func for each shape intersected.
pub fn space_segment_query(space &Space, start Vect, end Vect, radius Float, filter ShapeFilter, func C.cpSpaceSegmentQueryFunc, data voidptr) {
	C.cpSpaceSegmentQuery(space, start, end, radius, filter, func, data)
}

// @C: `CP_EXPORT cpShape *cpSpaceSegmentQueryFirst(cpSpace *space, cpVect start, cpVect end, cpFloat radius, cpShapeFilter filter, cpSegmentQueryInfo *out)`
fn C.cpSpaceSegmentQueryFirst(space &Space, start Vect, end Vect, radius Float, filter ShapeFilter, out &SegmentQueryInfo) &Shape

// space_segment_query_first : Perform a directed line segment query (like a raycast) against the space and return the first shape hit. Returns NULL if no shapes were hit.
pub fn space_segment_query_first(space &Space, start Vect, end Vect, radius Float, filter ShapeFilter, out &SegmentQueryInfo) &Shape {
	return C.cpSpaceSegmentQueryFirst(space, start, end, radius, filter, out)
}

// SpaceBBQueryFunc : Rectangle Query callback function type.
// @C: typedef void (*cpSpaceBBQueryFunc)(cpShape *shape, void *data);
pub type SpaceBBQueryFunc = fn (shape &Shape, data voidptr)

// @C: `CP_EXPORT void cpSpaceBBQuery(cpSpace *space, cpBB bb, cpShapeFilter filter, cpSpaceBBQueryFunc func, void *data)`
fn C.cpSpaceBBQuery(space &Space, bb BB, filter ShapeFilter, func C.cpSpaceBBQueryFunc, data voidptr)

// space_bb_query : Perform a fast rectangle query on the space calling @c func for each shape found.
// space_bb_query : Only the shape's bounding boxes are checked for overlap, not their full shape.
pub fn space_bb_query(space &Space, bb BB, filter ShapeFilter, func C.cpSpaceBBQueryFunc, data voidptr) {
	C.cpSpaceBBQuery(space, bb, filter, func, data)
}

// SpaceShapeQueryFunc : Shape query callback function type.
// @C: typedef void (*cpSpaceShapeQueryFunc)(cpShape *shape, cpContactPointSet *points, void *data);
pub type SpaceShapeQueryFunc = fn (shape &Shape, points &ContactPointSet, data voidptr)

// @C: `CP_EXPORT cpBool cpSpaceShapeQuery(cpSpace *space, cpShape *shape, cpSpaceShapeQueryFunc func, void *data)`
fn C.cpSpaceShapeQuery(space &Space, shape &Shape, func C.cpSpaceShapeQueryFunc, data voidptr) bool // C.cpBool

// space_shape_query : Query a space for any shapes overlapping the given shape and call @c func for each shape found.
pub fn space_shape_query(space &Space, shape &Shape, func C.cpSpaceShapeQueryFunc, data voidptr) bool { // bool // C.cpBool
	return C.cpSpaceShapeQuery(space, shape, func, data)
}

// SpaceBodyIteratorFunc : Space/body iterator callback function type.
// @C: typedef void (*cpSpaceBodyIteratorFunc)(cpBody *body, void *data);
pub type SpaceBodyIteratorFunc = fn (body &Body, data voidptr)

// @C: `CP_EXPORT void cpSpaceEachBody(cpSpace *space, cpSpaceBodyIteratorFunc func, void *data)`
fn C.cpSpaceEachBody(space &Space, func C.cpSpaceBodyIteratorFunc, data voidptr)

// space_each_body : Call @c func for each body in the space.
pub fn space_each_body(space &Space, func C.cpSpaceBodyIteratorFunc, data voidptr) {
	C.cpSpaceEachBody(space, func, data)
}

// SpaceShapeIteratorFunc : Space/body iterator callback function type.
// @C: typedef void (*cpSpaceShapeIteratorFunc)(cpShape *shape, void *data);
pub type SpaceShapeIteratorFunc = fn (shape &Shape, data voidptr)

// @C: `CP_EXPORT void cpSpaceEachShape(cpSpace *space, cpSpaceShapeIteratorFunc func, void *data)`
fn C.cpSpaceEachShape(space &Space, func C.cpSpaceShapeIteratorFunc, data voidptr)

// space_each_shape : Call @c func for each shape in the space.
pub fn space_each_shape(space &Space, func C.cpSpaceShapeIteratorFunc, data voidptr) {
	C.cpSpaceEachShape(space, func, data)
}

// SpaceConstraintIteratorFunc : Space/constraint iterator callback function type.
// @C: typedef void (*cpSpaceConstraintIteratorFunc)(cpConstraint *constraint, void *data);
pub type SpaceConstraintIteratorFunc = fn (constraint &Constraint, data voidptr)

// @C: `CP_EXPORT void cpSpaceEachConstraint(cpSpace *space, cpSpaceConstraintIteratorFunc func, void *data)`
fn C.cpSpaceEachConstraint(space &Space, func C.cpSpaceConstraintIteratorFunc, data voidptr)

// space_each_constraint : Call @c func for each shape in the space.
pub fn space_each_constraint(space &Space, func C.cpSpaceConstraintIteratorFunc, data voidptr) {
	C.cpSpaceEachConstraint(space, func, data)
}

// @C: `CP_EXPORT void cpSpaceReindexStatic(cpSpace *space)`
fn C.cpSpaceReindexStatic(space &Space)

// space_reindex_static : Update the collision detection info for the static shapes in the space.
pub fn space_reindex_static(space &Space) {
	C.cpSpaceReindexStatic(space)
}

// @C: `CP_EXPORT void cpSpaceReindexShape(cpSpace *space, cpShape *shape)`
fn C.cpSpaceReindexShape(space &Space, shape &Shape)

// space_reindex_shape : Update the collision detection data for a specific shape in the space.
pub fn space_reindex_shape(space &Space, shape &Shape) {
	C.cpSpaceReindexShape(space, shape)
}

// @C: `CP_EXPORT void cpSpaceReindexShapesForBody(cpSpace *space, cpBody *body)`
fn C.cpSpaceReindexShapesForBody(space &Space, body &Body)

// space_reindex_shapes_for_body : Update the collision detection data for all shapes attached to a body.
pub fn space_reindex_shapes_for_body(space &Space, body &Body) {
	C.cpSpaceReindexShapesForBody(space, body)
}

// @C: `CP_EXPORT void cpSpaceUseSpatialHash(cpSpace *space, cpFloat dim, int count)`
fn C.cpSpaceUseSpatialHash(space &Space, dim Float, count int)

// space_use_spatial_hash : Switch the space to use a spatial has as it's spatial index.
pub fn space_use_spatial_hash(space &Space, dim Float, count int) {
	C.cpSpaceUseSpatialHash(space, dim, count)
}

// @C: `CP_EXPORT void cpSpaceStep(cpSpace *space, cpFloat dt)`
fn C.cpSpaceStep(space &Space, dt Float)

// space_step : Step the space forward in time by @c dt.
pub fn space_step(space &Space, dt Float) {
	C.cpSpaceStep(space, dt)
}

// Color type to use with the space debug drawing API.
//
@[typedef]
pub struct C.cpSpaceDebugColor {
pub mut:
	r f32
	g f32
	b f32
	a f32
}

pub type SpaceDebugColor = C.cpSpaceDebugColor

// SpaceDebugDrawCircleImpl : Callback type for a function that draws a filled, stroked circle.
// @C: typedef void (*cpSpaceDebugDrawCircleImpl)(cpVect pos, cpFloat angle, cpFloat radius, cpSpaceDebugColor outlineColor, cpSpaceDebugColor fillColor, cpDataPointer data);
pub type SpaceDebugDrawCircleImpl = fn (pos Vect, angle Float, radius Float, outline_color SpaceDebugColor, fill_color SpaceDebugColor, data DataPointer)

// SpaceDebugDrawSegmentImpl : Callback type for a function that draws a line segment.
// @C: typedef void (*cpSpaceDebugDrawSegmentImpl)(cpVect a, cpVect b, cpSpaceDebugColor color, cpDataPointer data);
pub type SpaceDebugDrawSegmentImpl = fn (a Vect, b Vect, color SpaceDebugColor, data DataPointer)

// SpaceDebugDrawFatSegmentImpl : Callback type for a function that draws a thick line segment.
// @C: typedef void (*cpSpaceDebugDrawFatSegmentImpl)(cpVect a, cpVect b, cpFloat radius, cpSpaceDebugColor outlineColor, cpSpaceDebugColor fillColor, cpDataPointer data);
pub type SpaceDebugDrawFatSegmentImpl = fn (a Vect, b Vect, radius Float, outline_color SpaceDebugColor, fill_color SpaceDebugColor, data DataPointer)

// SpaceDebugDrawPolygonImpl : Callback type for a function that draws a convex polygon.
// @C: typedef void (*cpSpaceDebugDrawPolygonImpl)(int count, const cpVect *verts, cpFloat radius, cpSpaceDebugColor outlineColor, cpSpaceDebugColor fillColor, cpDataPointer data);
pub type SpaceDebugDrawPolygonImpl = fn (count int, const_verts &Vect, radius Float, outline_color SpaceDebugColor, fill_color SpaceDebugColor, data DataPointer)

// SpaceDebugDrawDotImpl : Callback type for a function that draws a dot.
// @C: typedef void (*cpSpaceDebugDrawDotImpl)(cpFloat size, cpVect pos, cpSpaceDebugColor color, cpDataPointer data);
pub type SpaceDebugDrawDotImpl = fn (size Float, pos Vect, color SpaceDebugColor, data DataPointer)

// SpaceDebugDrawColorForShapeImpl : Callback type for a function that returns a color for a given shape. This gives you an opportunity to color shapes based on how they are used in your engine.
// @C: typedef cpSpaceDebugColor (*cpSpaceDebugDrawColorForShapeImpl)(cpShape *shape, cpDataPointer data);
pub type SpaceDebugDrawColorForShapeImpl = fn (shape &Shape, data DataPointer) SpaceDebugColor

// SpaceDebugDrawFlags is C.cpSpaceDebugDrawFlags
pub enum SpaceDebugDrawFlags {
	shapes           = C.CP_SPACE_DEBUG_DRAW_SHAPES           // 1<<0,
	constraints      = C.CP_SPACE_DEBUG_DRAW_CONSTRAINTS      // 1<<1,
	collision_points = C.CP_SPACE_DEBUG_DRAW_COLLISION_POINTS // 1<<2,
}

// Struct used with cpSpaceDebugDraw() containing drawing callbacks and other drawing settings.
//
@[typedef]
pub struct C.cpSpaceDebugDrawOptions {
pub mut:
	// Function that will be invoked to draw circles.
	//
	drawCircle C.cpSpaceDebugDrawCircleImpl
	// Function that will be invoked to draw line segments.
	//
	drawSegment C.cpSpaceDebugDrawSegmentImpl
	// Function that will be invoked to draw thick line segments.
	//
	drawFatSegment C.cpSpaceDebugDrawFatSegmentImpl
	// Function that will be invoked to draw convex polygons.
	//
	drawPolygon C.cpSpaceDebugDrawPolygonImpl
	// Function that will be invoked to draw dots.
	//
	drawDot C.cpSpaceDebugDrawDotImpl
	// Flags that request which things to draw (collision shapes, constraints, contact points).
	//
	flags SpaceDebugDrawFlags
	// Outline color passed to the drawing function.
	//
	shapeOutlineColor SpaceDebugColor
	// Function that decides what fill color to draw shapes using.
	//
	colorForShape C.cpSpaceDebugDrawColorForShapeImpl
	// Color passed to drawing functions for constraints.
	//
	constraintColor SpaceDebugColor
	// Color passed to drawing functions for collision points.
	//
	collisionPointColor SpaceDebugColor
	// User defined context pointer passed to all of the callback functions as the 'data' argument.
	//
	data DataPointer
}

pub type SpaceDebugDrawOptions = C.cpSpaceDebugDrawOptions

// @C: `CP_EXPORT void cpSpaceDebugDraw(cpSpace *space, cpSpaceDebugDrawOptions *options)`
fn C.cpSpaceDebugDraw(space &Space, options &SpaceDebugDrawOptions)

// space_debug_draw : Debug draw the current state of the space using the supplied drawing options.
pub fn space_debug_draw(space &Space, options &SpaceDebugDrawOptions) {
	C.cpSpaceDebugDraw(space, options)
}
