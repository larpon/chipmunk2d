// Copyright(C) 2025 Lars Pontoppidan. All rights reserved.
// Use of this source code is governed by an MIT license
// that can be found in the LICENSE file.
module chipmunk2d

//
// cpArbiter.h
//

pub const max_contacts_per_arbiter = C.CP_MAX_CONTACTS_PER_ARBITER // 2

// @C: `CP_EXPORT cpFloat cpArbiterGetRestitution(const cpArbiter *arb)`
fn C.cpArbiterGetRestitution(const_arb &Arbiter) Float

// arbiter_get_restitution : Get the restitution (elasticity) that will be applied to the pair of colliding objects.
pub fn arbiter_get_restitution(const_arb &Arbiter) Float {
	return C.cpArbiterGetRestitution(const_arb)
}

// @C: `CP_EXPORT void cpArbiterSetRestitution(cpArbiter *arb, cpFloat restitution)`
fn C.cpArbiterSetRestitution(arb &Arbiter, restitution Float)

// arbiter_set_restitution : Override the restitution (elasticity) that will be applied to the pair of colliding objects.
pub fn arbiter_set_restitution(arb &Arbiter, restitution Float) {
	C.cpArbiterSetRestitution(arb, restitution)
}

// @C: `CP_EXPORT cpFloat cpArbiterGetFriction(const cpArbiter *arb)`
fn C.cpArbiterGetFriction(const_arb &Arbiter) Float

// arbiter_get_friction : Get the friction coefficient that will be applied to the pair of colliding objects.
pub fn arbiter_get_friction(const_arb &Arbiter) Float {
	return C.cpArbiterGetFriction(const_arb)
}

// @C: `CP_EXPORT void cpArbiterSetFriction(cpArbiter *arb, cpFloat friction)`
fn C.cpArbiterSetFriction(arb &Arbiter, friction Float)

// arbiter_set_friction : Override the friction coefficient that will be applied to the pair of colliding objects.
pub fn arbiter_set_friction(arb &Arbiter, friction Float) {
	C.cpArbiterSetFriction(arb, friction)
}

// @C: `CP_EXPORT cpVect cpArbiterGetSurfaceVelocity(cpArbiter *arb)`
fn C.cpArbiterGetSurfaceVelocity(arb &Arbiter) Vect

// arbiter_get_surface_velocity : Get the relative surface velocity of the two shapes in contact.
pub fn arbiter_get_surface_velocity(arb &Arbiter) Vect {
	return C.cpArbiterGetSurfaceVelocity(arb)
}

// @C: `CP_EXPORT void cpArbiterSetSurfaceVelocity(cpArbiter *arb, cpVect vr)`
fn C.cpArbiterSetSurfaceVelocity(arb &Arbiter, vr Vect)

// arbiter_set_surface_velocity : Override the relative surface velocity of the two shapes in contact.
// arbiter_set_surface_velocity : By default this is calculated to be the difference of the two surface velocities clamped to the tangent plane.
pub fn arbiter_set_surface_velocity(arb &Arbiter, vr Vect) {
	C.cpArbiterSetSurfaceVelocity(arb, vr)
}

// @C: `CP_EXPORT cpDataPointer cpArbiterGetUserData(const cpArbiter *arb)`
fn C.cpArbiterGetUserData(const_arb &Arbiter) DataPointer

// arbiter_get_user_data : Get the user data pointer associated with this pair of colliding objects.
pub fn arbiter_get_user_data(const_arb &Arbiter) DataPointer {
	return C.cpArbiterGetUserData(const_arb)
}

// @C: `CP_EXPORT void cpArbiterSetUserData(cpArbiter *arb, cpDataPointer userData)`
fn C.cpArbiterSetUserData(arb &Arbiter, user_data DataPointer)

// arbiter_set_user_data : Set a user data point associated with this pair of colliding objects.
// arbiter_set_user_data : If you need to perform any cleanup for this pointer, you must do it yourself, in the separate callback for instance.
pub fn arbiter_set_user_data(arb &Arbiter, user_data DataPointer) {
	C.cpArbiterSetUserData(arb, user_data)
}

// @C: `CP_EXPORT cpVect cpArbiterTotalImpulse(const cpArbiter *arb)`
fn C.cpArbiterTotalImpulse(const_arb &Arbiter) Vect

// arbiter_total_impulse : Calculate the total impulse including the friction that was applied by this arbiter.
// arbiter_total_impulse : This function should only be called from a post-solve, post-step or cpBodyEachArbiter callback.
pub fn arbiter_total_impulse(const_arb &Arbiter) Vect {
	return C.cpArbiterTotalImpulse(const_arb)
}

// @C: `CP_EXPORT cpFloat cpArbiterTotalKE(const cpArbiter *arb)`
fn C.cpArbiterTotalKE(const_arb &Arbiter) Float

// arbiter_total_ke : Calculate the amount of energy lost in a collision including static, but not dynamic friction.
// arbiter_total_ke : This function should only be called from a post-solve, post-step or cpBodyEachArbiter callback.
pub fn arbiter_total_ke(const_arb &Arbiter) Float {
	return C.cpArbiterTotalKE(const_arb)
}

// @C: `CP_EXPORT cpBool cpArbiterIgnore(cpArbiter *arb)`
fn C.cpArbiterIgnore(arb &Arbiter) bool // C.cpBool

// arbiter_ignore : Mark a collision pair to be ignored until the two objects separate.
// arbiter_ignore : Pre-solve and post-solve callbacks will not be called, but the separate callback will be called.
pub fn arbiter_ignore(arb &Arbiter) bool { // bool // C.cpBool
	return C.cpArbiterIgnore(arb)
}

// @C: `CP_EXPORT void cpArbiterGetShapes(const cpArbiter *arb, cpShape **a, cpShape **b)`
fn C.cpArbiterGetShapes(const_arb &Arbiter, a &&Shape, b &&Shape)

// arbiter_get_shapes : Return the colliding shapes involved for this arbiter.
// arbiter_get_shapes : The order of their cpSpace.collision_type values will match
// the order set when the collision handler was registered.
pub fn arbiter_get_shapes(const_arb &Arbiter, a &&Shape, b &&Shape) {
	C.cpArbiterGetShapes(const_arb, a, b)
}

// TODO Function: #define CP_ARBITER_GET_SHAPES(__arb__, __a__, __b__) cpShape *__a__, *__b__; cpArbiterGetShapes(__arb__, &__a__, &__b__);

// @C: `CP_EXPORT void cpArbiterGetBodies(const cpArbiter *arb, cpBody **a, cpBody **b)`
fn C.cpArbiterGetBodies(const_arb &Arbiter, a &&Body, b &&Body)

// arbiter_get_bodies : Return the colliding bodies involved for this arbiter.
// arbiter_get_bodies : The order of the cpSpace.collision_type the bodies are associated with values will match
// the order set when the collision handler was registered.
pub fn arbiter_get_bodies(const_arb &Arbiter, a &&Body, b &&Body) {
	C.cpArbiterGetBodies(const_arb, a, b)
}

// TODO Function: #define CP_ARBITER_GET_BODIES(__arb__, __a__, __b__) cpBody *__a__, *__b__; cpArbiterGetBodies(__arb__, &__a__, &__b__);

// A struct that wraps up the important collision data for an arbiter.
//
@[typedef]
pub struct C.cpContactPointSet {
pub mut:
	// The number of contact points in the set.
	//
	count int
	// The normal of the collision.
	//
	normal Vect

	// TODO// struct {
	//  	;	/// The; position of; the contact; on the; surface of; each shape.
	pointA Vect
	pointB Vect
	// Penetration distance of the two shapes. Overlapping means it will be negative.
	// This value is calculated as cpvdot(cpvsub(point2, point1), normal) and is ignored by cpArbiterSetContactPointSet().
	//
	distance Float
	// TODO 	points [CP_MAX_CONTACTS_PER_ARBITER]C.}
}

pub type ContactPointSet = C.cpContactPointSet

// @C: `CP_EXPORT cpContactPointSet cpArbiterGetContactPointSet(const cpArbiter *arb)`
fn C.cpArbiterGetContactPointSet(const_arb &Arbiter) ContactPointSet

// arbiter_get_contact_point_set : Return a contact set from an arbiter.
pub fn arbiter_get_contact_point_set(const_arb &Arbiter) ContactPointSet {
	return C.cpArbiterGetContactPointSet(const_arb)
}

// @C: `CP_EXPORT void cpArbiterSetContactPointSet(cpArbiter *arb, cpContactPointSet *set)`
fn C.cpArbiterSetContactPointSet(arb &Arbiter, set &ContactPointSet)

// arbiter_set_contact_point_set : Replace the contact point set for an arbiter.
// arbiter_set_contact_point_set : This can be a very powerful feature, but use it with caution!
pub fn arbiter_set_contact_point_set(arb &Arbiter, set &ContactPointSet) {
	C.cpArbiterSetContactPointSet(arb, set)
}

// @C: `CP_EXPORT cpBool cpArbiterIsFirstContact(const cpArbiter *arb)`
fn C.cpArbiterIsFirstContact(const_arb &Arbiter) bool // C.cpBool

// arbiter_is_first_contact : Returns true if this is the first step a pair of objects started colliding.
pub fn arbiter_is_first_contact(const_arb &Arbiter) bool { // bool // C.cpBool
	return C.cpArbiterIsFirstContact(const_arb)
}

// @C: `CP_EXPORT cpBool cpArbiterIsRemoval(const cpArbiter *arb)`
fn C.cpArbiterIsRemoval(const_arb &Arbiter) bool // C.cpBool

// arbiter_is_removal : Returns true if the separate callback is due to a shape being removed from the space.
pub fn arbiter_is_removal(const_arb &Arbiter) bool { // bool // C.cpBool
	return C.cpArbiterIsRemoval(const_arb)
}

// @C: `CP_EXPORT int cpArbiterGetCount(const cpArbiter *arb)`
fn C.cpArbiterGetCount(const_arb &Arbiter) int

// arbiter_get_count : Get the number of contact points for this arbiter.
pub fn arbiter_get_count(const_arb &Arbiter) int {
	return C.cpArbiterGetCount(const_arb)
}

// @C: `CP_EXPORT cpVect cpArbiterGetNormal(const cpArbiter *arb)`
fn C.cpArbiterGetNormal(const_arb &Arbiter) Vect

// arbiter_get_normal : Get the normal of the collision.
pub fn arbiter_get_normal(const_arb &Arbiter) Vect {
	return C.cpArbiterGetNormal(const_arb)
}

// @C: `CP_EXPORT cpVect cpArbiterGetPointA(const cpArbiter *arb, int i)`
fn C.cpArbiterGetPointA(const_arb &Arbiter, i int) Vect

// arbiter_get_point_a : Get the position of the @c ith contact point on the surface of the first shape.
pub fn arbiter_get_point_a(const_arb &Arbiter, i int) Vect {
	return C.cpArbiterGetPointA(const_arb, i)
}

// @C: `CP_EXPORT cpVect cpArbiterGetPointB(const cpArbiter *arb, int i)`
fn C.cpArbiterGetPointB(const_arb &Arbiter, i int) Vect

// arbiter_get_point_b : Get the position of the @c ith contact point on the surface of the second shape.
pub fn arbiter_get_point_b(const_arb &Arbiter, i int) Vect {
	return C.cpArbiterGetPointB(const_arb, i)
}

// @C: `CP_EXPORT cpFloat cpArbiterGetDepth(const cpArbiter *arb, int i)`
fn C.cpArbiterGetDepth(const_arb &Arbiter, i int) Float

// arbiter_get_depth : Get the depth of the @c ith contact point.
pub fn arbiter_get_depth(const_arb &Arbiter, i int) Float {
	return C.cpArbiterGetDepth(const_arb, i)
}

// @C: `CP_EXPORT cpBool cpArbiterCallWildcardBeginA(cpArbiter *arb, cpSpace *space)`
fn C.cpArbiterCallWildcardBeginA(arb &Arbiter, space &Space) bool // C.cpBool

// arbiter_call_wildcard_begin_a : If you want a custom callback to invoke the wildcard callback for the first collision type, you must call this function explicitly.
// arbiter_call_wildcard_begin_a : You must decide how to handle the wildcard's return value since it may disagree with the other wildcard handler's return value or your own.
pub fn arbiter_call_wildcard_begin_a(arb &Arbiter, space &Space) bool { // bool // C.cpBool
	return C.cpArbiterCallWildcardBeginA(arb, space)
}

// @C: `CP_EXPORT cpBool cpArbiterCallWildcardBeginB(cpArbiter *arb, cpSpace *space)`
fn C.cpArbiterCallWildcardBeginB(arb &Arbiter, space &Space) bool // C.cpBool

// arbiter_call_wildcard_begin_b : If you want a custom callback to invoke the wildcard callback for the second collision type, you must call this function explicitly.
// arbiter_call_wildcard_begin_b : You must decide how to handle the wildcard's return value since it may disagree with the other wildcard handler's return value or your own.
pub fn arbiter_call_wildcard_begin_b(arb &Arbiter, space &Space) bool { // bool // C.cpBool
	return C.cpArbiterCallWildcardBeginB(arb, space)
}

// @C: `CP_EXPORT cpBool cpArbiterCallWildcardPreSolveA(cpArbiter *arb, cpSpace *space)`
fn C.cpArbiterCallWildcardPreSolveA(arb &Arbiter, space &Space) bool // C.cpBool

// arbiter_call_wildcard_pre_solve_a : If you want a custom callback to invoke the wildcard callback for the first collision type, you must call this function explicitly.
// arbiter_call_wildcard_pre_solve_a : You must decide how to handle the wildcard's return value since it may disagree with the other wildcard handler's return value or your own.
pub fn arbiter_call_wildcard_pre_solve_a(arb &Arbiter, space &Space) bool { // bool // C.cpBool
	return C.cpArbiterCallWildcardPreSolveA(arb, space)
}

// @C: `CP_EXPORT cpBool cpArbiterCallWildcardPreSolveB(cpArbiter *arb, cpSpace *space)`
fn C.cpArbiterCallWildcardPreSolveB(arb &Arbiter, space &Space) bool // C.cpBool

// arbiter_call_wildcard_pre_solve_b : If you want a custom callback to invoke the wildcard callback for the second collision type, you must call this function explicitly.
// arbiter_call_wildcard_pre_solve_b : You must decide how to handle the wildcard's return value since it may disagree with the other wildcard handler's return value or your own.
pub fn arbiter_call_wildcard_pre_solve_b(arb &Arbiter, space &Space) bool { // bool // C.cpBool
	return C.cpArbiterCallWildcardPreSolveB(arb, space)
}

// @C: `CP_EXPORT void cpArbiterCallWildcardPostSolveA(cpArbiter *arb, cpSpace *space)`
fn C.cpArbiterCallWildcardPostSolveA(arb &Arbiter, space &Space)

// arbiter_call_wildcard_post_solve_a : If you want a custom callback to invoke the wildcard callback for the first collision type, you must call this function explicitly.
pub fn arbiter_call_wildcard_post_solve_a(arb &Arbiter, space &Space) {
	C.cpArbiterCallWildcardPostSolveA(arb, space)
}

// @C: `CP_EXPORT void cpArbiterCallWildcardPostSolveB(cpArbiter *arb, cpSpace *space)`
fn C.cpArbiterCallWildcardPostSolveB(arb &Arbiter, space &Space)

// arbiter_call_wildcard_post_solve_b : If you want a custom callback to invoke the wildcard callback for the second collision type, you must call this function explicitly.
pub fn arbiter_call_wildcard_post_solve_b(arb &Arbiter, space &Space) {
	C.cpArbiterCallWildcardPostSolveB(arb, space)
}

// @C: `CP_EXPORT void cpArbiterCallWildcardSeparateA(cpArbiter *arb, cpSpace *space)`
fn C.cpArbiterCallWildcardSeparateA(arb &Arbiter, space &Space)

// arbiter_call_wildcard_separate_a : If you want a custom callback to invoke the wildcard callback for the first collision type, you must call this function explicitly.
pub fn arbiter_call_wildcard_separate_a(arb &Arbiter, space &Space) {
	C.cpArbiterCallWildcardSeparateA(arb, space)
}

// @C: `CP_EXPORT void cpArbiterCallWildcardSeparateB(cpArbiter *arb, cpSpace *space)`
fn C.cpArbiterCallWildcardSeparateB(arb &Arbiter, space &Space)

// arbiter_call_wildcard_separate_b : If you want a custom callback to invoke the wildcard callback for the second collision type, you must call this function explicitly.
pub fn arbiter_call_wildcard_separate_b(arb &Arbiter, space &Space) {
	C.cpArbiterCallWildcardSeparateB(arb, space)
}
