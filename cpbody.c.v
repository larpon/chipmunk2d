// Copyright(C) 2025 Lars Pontoppidan. All rights reserved.
// Use of this source code is governed by an MIT license
// that can be found in the LICENSE file.
module chipmunk2d

//
// cpBody.h
//

// BodyType is C.cpBodyType
pub enum BodyType {
	// = C.	 // A dynamic body is one that is affected by gravity, forces, and collisions.
	// = C.	 // This is the default body type.
	body_type_dynamic = C.CP_BODY_TYPE_DYNAMIC
	// = C.	 // A kinematic body is an infinite mass, user controlled body that is not affected by gravity, forces or collisions.
	// = C.	 // Instead the body only moves based on it's velocity.
	// = C.	 // Dynamic bodies collide normally with kinematic bodies, though the kinematic body will be unaffected.
	// = C.	 // Collisions between two kinematic bodies, or a kinematic body and a static body produce collision callbacks, but no collision response.
	body_type_kinematic = C.CP_BODY_TYPE_KINEMATIC
	// = C.	 // A static body is a body that never (or rarely) moves. If you move a static body, you must call one of the cpSpaceReindex*() functions.
	// = C.	 // Chipmunk uses this information to optimize the collision detection.
	// = C.	 // Static bodies do not produce collision callbacks when colliding with other static bodies.
	body_type_static = C.CP_BODY_TYPE_STATIC
}

// BodyVelocityFunc : Rigid body velocity update function type.
// @C: typedef void (*cpBodyVelocityFunc)(cpBody *body, cpVect gravity, cpFloat damping, cpFloat dt);
pub type BodyVelocityFunc = fn (body &Body, gravity Vect, damping Float, dt Float)

// BodyPositionFunc : Rigid body position update function type.
// @C: typedef void (*cpBodyPositionFunc)(cpBody *body, cpFloat dt);
pub type BodyPositionFunc = fn (body &Body, dt Float)

// @C: `CP_EXPORT cpBody* cpBodyAlloc(void)`
fn C.cpBodyAlloc() &Body

// body_alloc : Allocate a cpBody.
pub fn body_alloc() &Body {
	return C.cpBodyAlloc()
}

// @C: `CP_EXPORT cpBody* cpBodyInit(cpBody *body, cpFloat mass, cpFloat moment)`
fn C.cpBodyInit(body &Body, mass Float, moment Float) &Body

// body_init : Initialize a cpBody.
pub fn body_init(body &Body, mass Float, moment Float) &Body {
	return C.cpBodyInit(body, mass, moment)
}

// @C: `CP_EXPORT cpBody* cpBodyNew(cpFloat mass, cpFloat moment)`
fn C.cpBodyNew(mass Float, moment Float) &Body

// body_new : Allocate and initialize a cpBody.
pub fn body_new(mass Float, moment Float) &Body {
	return C.cpBodyNew(mass, moment)
}

// @C: `CP_EXPORT cpBody* cpBodyNewKinematic(void)`
fn C.cpBodyNewKinematic() &Body

// body_new_kinematic : Allocate and initialize a cpBody, and set it as a kinematic body.
pub fn body_new_kinematic() &Body {
	return C.cpBodyNewKinematic()
}

// @C: `CP_EXPORT cpBody* cpBodyNewStatic(void)`
fn C.cpBodyNewStatic() &Body

// body_new_static : Allocate and initialize a cpBody, and set it as a static body.
pub fn body_new_static() &Body {
	return C.cpBodyNewStatic()
}

// @C: `CP_EXPORT void cpBodyDestroy(cpBody *body)`
fn C.cpBodyDestroy(body &Body)

// body_destroy : Destroy a cpBody.
pub fn body_destroy(body &Body) {
	C.cpBodyDestroy(body)
}

// @C: `CP_EXPORT void cpBodyFree(cpBody *body)`
fn C.cpBodyFree(body &Body)

// body_free : Destroy and free a cpBody.
pub fn body_free(body &Body) {
	C.cpBodyFree(body)
}

// @C: `CP_EXPORT void cpBodyActivate(cpBody *body)`
fn C.cpBodyActivate(body &Body)

// body_activate : Defined in cpSpace.c
// body_activate : Wake up a sleeping or idle body.
pub fn body_activate(body &Body) {
	C.cpBodyActivate(body)
}

// @C: `CP_EXPORT void cpBodyActivateStatic(cpBody *body, cpShape *filter)`
fn C.cpBodyActivateStatic(body &Body, filter &Shape)

// body_activate_static : Wake up any sleeping or idle bodies touching a static body.
pub fn body_activate_static(body &Body, filter &Shape) {
	C.cpBodyActivateStatic(body, filter)
}

// @C: `CP_EXPORT void cpBodySleep(cpBody *body)`
fn C.cpBodySleep(body &Body)

// body_sleep : Force a body to fall asleep immediately.
pub fn body_sleep(body &Body) {
	C.cpBodySleep(body)
}

// @C: `CP_EXPORT void cpBodySleepWithGroup(cpBody *body, cpBody *group)`
fn C.cpBodySleepWithGroup(body &Body, group &Body)

// body_sleep_with_group : Force a body to fall asleep immediately along with other bodies in a group.
pub fn body_sleep_with_group(body &Body, group &Body) {
	C.cpBodySleepWithGroup(body, group)
}

// @C: `CP_EXPORT cpBool cpBodyIsSleeping(const cpBody *body)`
fn C.cpBodyIsSleeping(const_body &Body) bool // C.cpBool

// body_is_sleeping : Returns true if the body is sleeping.
pub fn body_is_sleeping(const_body &Body) bool { // bool // C.cpBool
	return C.cpBodyIsSleeping(const_body)
}

// @C: `CP_EXPORT cpBodyType cpBodyGetType(cpBody *body)`
fn C.cpBodyGetType(body &Body) BodyType

// body_get_type : Get the type of the body.
pub fn body_get_type(body &Body) BodyType {
	return C.cpBodyGetType(body)
}

// @C: `CP_EXPORT void cpBodySetType(cpBody *body, cpBodyType type)`
fn C.cpBodySetType(body &Body, type, BodyType)

// body_set_type : Set the type of the body.
pub fn body_set_type(body &Body, type BodyType) {
	C.cpBodySetType(body, type)
}

// @C: `CP_EXPORT cpSpace* cpBodyGetSpace(const cpBody *body)`
fn C.cpBodyGetSpace(const_body &Body) &Space

// body_get_space : Get the space this body is added to.
pub fn body_get_space(const_body &Body) &Space {
	return C.cpBodyGetSpace(const_body)
}

// @C: `CP_EXPORT cpFloat cpBodyGetMass(const cpBody *body)`
fn C.cpBodyGetMass(const_body &Body) Float

// body_get_mass : Get the mass of the body.
pub fn body_get_mass(const_body &Body) Float {
	return C.cpBodyGetMass(const_body)
}

// @C: `CP_EXPORT void cpBodySetMass(cpBody *body, cpFloat m)`
fn C.cpBodySetMass(body &Body, m Float)

// body_set_mass : Set the mass of the body.
pub fn body_set_mass(body &Body, m Float) {
	C.cpBodySetMass(body, m)
}

// @C: `CP_EXPORT cpFloat cpBodyGetMoment(const cpBody *body)`
fn C.cpBodyGetMoment(const_body &Body) Float

// body_get_moment : Get the moment of inertia of the body.
pub fn body_get_moment(const_body &Body) Float {
	return C.cpBodyGetMoment(const_body)
}

// @C: `CP_EXPORT void cpBodySetMoment(cpBody *body, cpFloat i)`
fn C.cpBodySetMoment(body &Body, i Float)

// body_set_moment : Set the moment of inertia of the body.
pub fn body_set_moment(body &Body, i Float) {
	C.cpBodySetMoment(body, i)
}

// @C: `CP_EXPORT cpVect cpBodyGetPosition(const cpBody *body)`
fn C.cpBodyGetPosition(const_body &Body) Vect

// body_get_position : Set the position of a body.
pub fn body_get_position(const_body &Body) Vect {
	return C.cpBodyGetPosition(const_body)
}

// @C: `CP_EXPORT void cpBodySetPosition(cpBody *body, cpVect pos)`
fn C.cpBodySetPosition(body &Body, pos Vect)

// body_set_position : Set the position of the body.
pub fn body_set_position(body &Body, pos Vect) {
	C.cpBodySetPosition(body, pos)
}

// @C: `CP_EXPORT cpVect cpBodyGetCenterOfGravity(const cpBody *body)`
fn C.cpBodyGetCenterOfGravity(const_body &Body) Vect

// body_get_center_of_gravity : Get the offset of the center of gravity in body local coordinates.
pub fn body_get_center_of_gravity(const_body &Body) Vect {
	return C.cpBodyGetCenterOfGravity(const_body)
}

// @C: `CP_EXPORT void cpBodySetCenterOfGravity(cpBody *body, cpVect cog)`
fn C.cpBodySetCenterOfGravity(body &Body, cog Vect)

// body_set_center_of_gravity : Set the offset of the center of gravity in body local coordinates.
pub fn body_set_center_of_gravity(body &Body, cog Vect) {
	C.cpBodySetCenterOfGravity(body, cog)
}

// @C: `CP_EXPORT cpVect cpBodyGetVelocity(const cpBody *body)`
fn C.cpBodyGetVelocity(const_body &Body) Vect

// body_get_velocity : Get the velocity of the body.
pub fn body_get_velocity(const_body &Body) Vect {
	return C.cpBodyGetVelocity(const_body)
}

// @C: `CP_EXPORT void cpBodySetVelocity(cpBody *body, cpVect velocity)`
fn C.cpBodySetVelocity(body &Body, velocity Vect)

// body_set_velocity : Set the velocity of the body.
pub fn body_set_velocity(body &Body, velocity Vect) {
	C.cpBodySetVelocity(body, velocity)
}

// @C: `CP_EXPORT cpVect cpBodyGetForce(const cpBody *body)`
fn C.cpBodyGetForce(const_body &Body) Vect

// body_get_force : Get the force applied to the body for the next time step.
pub fn body_get_force(const_body &Body) Vect {
	return C.cpBodyGetForce(const_body)
}

// @C: `CP_EXPORT void cpBodySetForce(cpBody *body, cpVect force)`
fn C.cpBodySetForce(body &Body, force Vect)

// body_set_force : Set the force applied to the body for the next time step.
pub fn body_set_force(body &Body, force Vect) {
	C.cpBodySetForce(body, force)
}

// @C: `CP_EXPORT cpFloat cpBodyGetAngle(const cpBody *body)`
fn C.cpBodyGetAngle(const_body &Body) Float

// body_get_angle : Get the angle of the body.
pub fn body_get_angle(const_body &Body) Float {
	return C.cpBodyGetAngle(const_body)
}

// @C: `CP_EXPORT void cpBodySetAngle(cpBody *body, cpFloat a)`
fn C.cpBodySetAngle(body &Body, a Float)

// body_set_angle : Set the angle of a body.
pub fn body_set_angle(body &Body, a Float) {
	C.cpBodySetAngle(body, a)
}

// @C: `CP_EXPORT cpFloat cpBodyGetAngularVelocity(const cpBody *body)`
fn C.cpBodyGetAngularVelocity(const_body &Body) Float

// body_get_angular_velocity : Get the angular velocity of the body.
pub fn body_get_angular_velocity(const_body &Body) Float {
	return C.cpBodyGetAngularVelocity(const_body)
}

// @C: `CP_EXPORT void cpBodySetAngularVelocity(cpBody *body, cpFloat angularVelocity)`
fn C.cpBodySetAngularVelocity(body &Body, angular_velocity Float)

// body_set_angular_velocity : Set the angular velocity of the body.
pub fn body_set_angular_velocity(body &Body, angular_velocity Float) {
	C.cpBodySetAngularVelocity(body, angular_velocity)
}

// @C: `CP_EXPORT cpFloat cpBodyGetTorque(const cpBody *body)`
fn C.cpBodyGetTorque(const_body &Body) Float

// body_get_torque : Get the torque applied to the body for the next time step.
pub fn body_get_torque(const_body &Body) Float {
	return C.cpBodyGetTorque(const_body)
}

// @C: `CP_EXPORT void cpBodySetTorque(cpBody *body, cpFloat torque)`
fn C.cpBodySetTorque(body &Body, torque Float)

// body_set_torque : Set the torque applied to the body for the next time step.
pub fn body_set_torque(body &Body, torque Float) {
	C.cpBodySetTorque(body, torque)
}

// @C: `CP_EXPORT cpVect cpBodyGetRotation(const cpBody *body)`
fn C.cpBodyGetRotation(const_body &Body) Vect

// body_get_rotation : Get the rotation vector of the body. (The x basis vector of it's transform.)
pub fn body_get_rotation(const_body &Body) Vect {
	return C.cpBodyGetRotation(const_body)
}

// @C: `CP_EXPORT cpDataPointer cpBodyGetUserData(const cpBody *body)`
fn C.cpBodyGetUserData(const_body &Body) DataPointer

// body_get_user_data : Get the user data pointer assigned to the body.
pub fn body_get_user_data(const_body &Body) DataPointer {
	return C.cpBodyGetUserData(const_body)
}

// @C: `CP_EXPORT void cpBodySetUserData(cpBody *body, cpDataPointer userData)`
fn C.cpBodySetUserData(body &Body, user_data DataPointer)

// body_set_user_data : Set the user data pointer assigned to the body.
pub fn body_set_user_data(body &Body, user_data DataPointer) {
	C.cpBodySetUserData(body, user_data)
}

// @C: `CP_EXPORT void cpBodySetVelocityUpdateFunc(cpBody *body, cpBodyVelocityFunc velocityFunc)`
fn C.cpBodySetVelocityUpdateFunc(body &Body, velocity_func C.cpBodyVelocityFunc)

// body_set_velocity_update_func : Set the callback used to update a body's velocity.
pub fn body_set_velocity_update_func(body &Body, velocity_func C.cpBodyVelocityFunc) {
	C.cpBodySetVelocityUpdateFunc(body, velocity_func)
}

// @C: `CP_EXPORT void cpBodySetPositionUpdateFunc(cpBody *body, cpBodyPositionFunc positionFunc)`
fn C.cpBodySetPositionUpdateFunc(body &Body, position_func C.cpBodyPositionFunc)

// body_set_position_update_func : Set the callback used to update a body's position.
// body_set_position_update_func : NOTE: It's not generally recommended to override this unless you call the default position update function.
pub fn body_set_position_update_func(body &Body, position_func C.cpBodyPositionFunc) {
	C.cpBodySetPositionUpdateFunc(body, position_func)
}

// @C: `CP_EXPORT void cpBodyUpdateVelocity(cpBody *body, cpVect gravity, cpFloat damping, cpFloat dt)`
fn C.cpBodyUpdateVelocity(body &Body, gravity Vect, damping Float, dt Float)

// body_update_velocity : Default velocity integration function..
pub fn body_update_velocity(body &Body, gravity Vect, damping Float, dt Float) {
	C.cpBodyUpdateVelocity(body, gravity, damping, dt)
}

// @C: `CP_EXPORT void cpBodyUpdatePosition(cpBody *body, cpFloat dt)`
fn C.cpBodyUpdatePosition(body &Body, dt Float)

// body_update_position : Default position integration function.
pub fn body_update_position(body &Body, dt Float) {
	C.cpBodyUpdatePosition(body, dt)
}

// @C: `CP_EXPORT cpVect cpBodyLocalToWorld(const cpBody *body, const cpVect point)`
fn C.cpBodyLocalToWorld(const_body &Body, const_point Vect) Vect

// body_local_to_world : Convert body relative/local coordinates to absolute/world coordinates.
pub fn body_local_to_world(const_body &Body, const_point Vect) Vect {
	return C.cpBodyLocalToWorld(const_body, const_point)
}

// @C: `CP_EXPORT cpVect cpBodyWorldToLocal(const cpBody *body, const cpVect point)`
fn C.cpBodyWorldToLocal(const_body &Body, const_point Vect) Vect

// body_world_to_local : Convert body absolute/world coordinates to  relative/local coordinates.
pub fn body_world_to_local(const_body &Body, const_point Vect) Vect {
	return C.cpBodyWorldToLocal(const_body, const_point)
}

// @C: `CP_EXPORT void cpBodyApplyForceAtWorldPoint(cpBody *body, cpVect force, cpVect point)`
fn C.cpBodyApplyForceAtWorldPoint(body &Body, force Vect, point Vect)

// body_apply_force_at_world_point : Apply a force to a body. Both the force and point are expressed in world coordinates.
pub fn body_apply_force_at_world_point(body &Body, force Vect, point Vect) {
	C.cpBodyApplyForceAtWorldPoint(body, force, point)
}

// @C: `CP_EXPORT void cpBodyApplyForceAtLocalPoint(cpBody *body, cpVect force, cpVect point)`
fn C.cpBodyApplyForceAtLocalPoint(body &Body, force Vect, point Vect)

// body_apply_force_at_local_point : Apply a force to a body. Both the force and point are expressed in body local coordinates.
pub fn body_apply_force_at_local_point(body &Body, force Vect, point Vect) {
	C.cpBodyApplyForceAtLocalPoint(body, force, point)
}

// @C: `CP_EXPORT void cpBodyApplyImpulseAtWorldPoint(cpBody *body, cpVect impulse, cpVect point)`
fn C.cpBodyApplyImpulseAtWorldPoint(body &Body, impulse Vect, point Vect)

// body_apply_impulse_at_world_point : Apply an impulse to a body. Both the impulse and point are expressed in world coordinates.
pub fn body_apply_impulse_at_world_point(body &Body, impulse Vect, point Vect) {
	C.cpBodyApplyImpulseAtWorldPoint(body, impulse, point)
}

// @C: `CP_EXPORT void cpBodyApplyImpulseAtLocalPoint(cpBody *body, cpVect impulse, cpVect point)`
fn C.cpBodyApplyImpulseAtLocalPoint(body &Body, impulse Vect, point Vect)

// body_apply_impulse_at_local_point : Apply an impulse to a body. Both the impulse and point are expressed in body local coordinates.
pub fn body_apply_impulse_at_local_point(body &Body, impulse Vect, point Vect) {
	C.cpBodyApplyImpulseAtLocalPoint(body, impulse, point)
}

// @C: `CP_EXPORT cpVect cpBodyGetVelocityAtWorldPoint(const cpBody *body, cpVect point)`
fn C.cpBodyGetVelocityAtWorldPoint(const_body &Body, point Vect) Vect

// body_get_velocity_at_world_point : Get the velocity on a body (in world units) at a point on the body in world coordinates.
pub fn body_get_velocity_at_world_point(const_body &Body, point Vect) Vect {
	return C.cpBodyGetVelocityAtWorldPoint(const_body, point)
}

// @C: `CP_EXPORT cpVect cpBodyGetVelocityAtLocalPoint(const cpBody *body, cpVect point)`
fn C.cpBodyGetVelocityAtLocalPoint(const_body &Body, point Vect) Vect

// body_get_velocity_at_local_point : Get the velocity on a body (in world units) at a point on the body in local coordinates.
pub fn body_get_velocity_at_local_point(const_body &Body, point Vect) Vect {
	return C.cpBodyGetVelocityAtLocalPoint(const_body, point)
}

// @C: `CP_EXPORT cpFloat cpBodyKineticEnergy(const cpBody *body)`
fn C.cpBodyKineticEnergy(const_body &Body) Float

// body_kinetic_energy : Get the amount of kinetic energy contained by the body.
pub fn body_kinetic_energy(const_body &Body) Float {
	return C.cpBodyKineticEnergy(const_body)
}

// BodyShapeIteratorFunc : Body/shape iterator callback function type.
// @C: typedef void (*cpBodyShapeIteratorFunc)(cpBody *body, cpShape *shape, void *data);
pub type BodyShapeIteratorFunc = fn (body &Body, shape &Shape, data voidptr)

// @C: `CP_EXPORT void cpBodyEachShape(cpBody *body, cpBodyShapeIteratorFunc func, void *data)`
fn C.cpBodyEachShape(body &Body, func C.cpBodyShapeIteratorFunc, data voidptr)

// body_each_shape : Call @c func once for each shape attached to @c body and added to the space.
pub fn body_each_shape(body &Body, func C.cpBodyShapeIteratorFunc, data voidptr) {
	C.cpBodyEachShape(body, func, data)
}

// BodyConstraintIteratorFunc : Body/constraint iterator callback function type.
// @C: typedef void (*cpBodyConstraintIteratorFunc)(cpBody *body, cpConstraint *constraint, void *data);
pub type BodyConstraintIteratorFunc = fn (body &Body, constraint &Constraint, data voidptr)

// @C: `CP_EXPORT void cpBodyEachConstraint(cpBody *body, cpBodyConstraintIteratorFunc func, void *data)`
fn C.cpBodyEachConstraint(body &Body, func C.cpBodyConstraintIteratorFunc, data voidptr)

// body_each_constraint : Call @c func once for each constraint attached to @c body and added to the space.
pub fn body_each_constraint(body &Body, func C.cpBodyConstraintIteratorFunc, data voidptr) {
	C.cpBodyEachConstraint(body, func, data)
}

// BodyArbiterIteratorFunc : Body/arbiter iterator callback function type.
// @C: typedef void (*cpBodyArbiterIteratorFunc)(cpBody *body, cpArbiter *arbiter, void *data);
pub type BodyArbiterIteratorFunc = fn (body &Body, arbiter &Arbiter, data voidptr)

// @C: `CP_EXPORT void cpBodyEachArbiter(cpBody *body, cpBodyArbiterIteratorFunc func, void *data)`
fn C.cpBodyEachArbiter(body &Body, func C.cpBodyArbiterIteratorFunc, data voidptr)

// body_each_arbiter : Call @c func once for each arbiter that is currently active on the body.
pub fn body_each_arbiter(body &Body, func C.cpBodyArbiterIteratorFunc, data voidptr) {
	C.cpBodyEachArbiter(body, func, data)
}
