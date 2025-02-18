// Copyright(C) 2025 Lars Pontoppidan. All rights reserved.
// Use of this source code is governed by an MIT license
// that can be found in the LICENSE file.
module chipmunk2d

//
// cpDampedSpring.h
//

// @C: `CP_EXPORT cpBool cpConstraintIsDampedSpring(const cpConstraint *constraint)`
fn C.cpConstraintIsDampedSpring(const_constraint &Constraint) bool // C.cpBool

// constraint_is_damped_spring : Check if a constraint is a slide joint.
pub fn constraint_is_damped_spring(const_constraint &Constraint) bool { // bool // C.cpBool
	return C.cpConstraintIsDampedSpring(const_constraint)
}

// DampedSpringForceFunc : Function type used for damped spring force callbacks.
// @C: typedef cpFloat (*cpDampedSpringForceFunc)(cpConstraint *spring, cpFloat dist);
pub type DampedSpringForceFunc = fn (spring &Constraint, dist Float) Float

// @C: `CP_EXPORT cpDampedSpring* cpDampedSpringAlloc(void)`
fn C.cpDampedSpringAlloc() &DampedSpring

// damped_spring_alloc : Allocate a damped spring.
pub fn damped_spring_alloc() &DampedSpring {
	return C.cpDampedSpringAlloc()
}

// @C: `CP_EXPORT cpDampedSpring* cpDampedSpringInit(cpDampedSpring *joint, cpBody *a, cpBody *b, cpVect anchorA, cpVect anchorB, cpFloat restLength, cpFloat stiffness, cpFloat damping)`
fn C.cpDampedSpringInit(joint &DampedSpring, a &Body, b &Body, anchor_a Vect, anchor_b Vect, rest_length Float, stiffness Float, damping Float) &DampedSpring

// damped_spring_init : Initialize a damped spring.
pub fn damped_spring_init(joint &DampedSpring, a &Body, b &Body, anchor_a Vect, anchor_b Vect, rest_length Float, stiffness Float, damping Float) &DampedSpring {
	return C.cpDampedSpringInit(joint, a, b, anchor_a, anchor_b, rest_length, stiffness,
		damping)
}

// @C: `CP_EXPORT cpConstraint* cpDampedSpringNew(cpBody *a, cpBody *b, cpVect anchorA, cpVect anchorB, cpFloat restLength, cpFloat stiffness, cpFloat damping)`
fn C.cpDampedSpringNew(a &Body, b &Body, anchor_a Vect, anchor_b Vect, rest_length Float, stiffness Float, damping Float) &Constraint

// damped_spring_new : Allocate and initialize a damped spring.
pub fn damped_spring_new(a &Body, b &Body, anchor_a Vect, anchor_b Vect, rest_length Float, stiffness Float, damping Float) &Constraint {
	return C.cpDampedSpringNew(a, b, anchor_a, anchor_b, rest_length, stiffness, damping)
}

// @C: `CP_EXPORT cpVect cpDampedSpringGetAnchorA(const cpConstraint *constraint)`
fn C.cpDampedSpringGetAnchorA(const_constraint &Constraint) Vect

// damped_spring_get_anchor_a : Get the location of the first anchor relative to the first body.
pub fn damped_spring_get_anchor_a(const_constraint &Constraint) Vect {
	return C.cpDampedSpringGetAnchorA(const_constraint)
}

// @C: `CP_EXPORT void cpDampedSpringSetAnchorA(cpConstraint *constraint, cpVect anchorA)`
fn C.cpDampedSpringSetAnchorA(constraint &Constraint, anchor_a Vect)

// damped_spring_set_anchor_a : Set the location of the first anchor relative to the first body.
pub fn damped_spring_set_anchor_a(constraint &Constraint, anchor_a Vect) {
	C.cpDampedSpringSetAnchorA(constraint, anchor_a)
}

// @C: `CP_EXPORT cpVect cpDampedSpringGetAnchorB(const cpConstraint *constraint)`
fn C.cpDampedSpringGetAnchorB(const_constraint &Constraint) Vect

// damped_spring_get_anchor_b : Get the location of the second anchor relative to the second body.
pub fn damped_spring_get_anchor_b(const_constraint &Constraint) Vect {
	return C.cpDampedSpringGetAnchorB(const_constraint)
}

// @C: `CP_EXPORT void cpDampedSpringSetAnchorB(cpConstraint *constraint, cpVect anchorB)`
fn C.cpDampedSpringSetAnchorB(constraint &Constraint, anchor_b Vect)

// damped_spring_set_anchor_b : Set the location of the second anchor relative to the second body.
pub fn damped_spring_set_anchor_b(constraint &Constraint, anchor_b Vect) {
	C.cpDampedSpringSetAnchorB(constraint, anchor_b)
}

// @C: `CP_EXPORT cpFloat cpDampedSpringGetRestLength(const cpConstraint *constraint)`
fn C.cpDampedSpringGetRestLength(const_constraint &Constraint) Float

// damped_spring_get_rest_length : Get the rest length of the spring.
pub fn damped_spring_get_rest_length(const_constraint &Constraint) Float {
	return C.cpDampedSpringGetRestLength(const_constraint)
}

// @C: `CP_EXPORT void cpDampedSpringSetRestLength(cpConstraint *constraint, cpFloat restLength)`
fn C.cpDampedSpringSetRestLength(constraint &Constraint, rest_length Float)

// damped_spring_set_rest_length : Set the rest length of the spring.
pub fn damped_spring_set_rest_length(constraint &Constraint, rest_length Float) {
	C.cpDampedSpringSetRestLength(constraint, rest_length)
}

// @C: `CP_EXPORT cpFloat cpDampedSpringGetStiffness(const cpConstraint *constraint)`
fn C.cpDampedSpringGetStiffness(const_constraint &Constraint) Float

// damped_spring_get_stiffness : Get the stiffness of the spring in force/distance.
pub fn damped_spring_get_stiffness(const_constraint &Constraint) Float {
	return C.cpDampedSpringGetStiffness(const_constraint)
}

// @C: `CP_EXPORT void cpDampedSpringSetStiffness(cpConstraint *constraint, cpFloat stiffness)`
fn C.cpDampedSpringSetStiffness(constraint &Constraint, stiffness Float)

// damped_spring_set_stiffness : Set the stiffness of the spring in force/distance.
pub fn damped_spring_set_stiffness(constraint &Constraint, stiffness Float) {
	C.cpDampedSpringSetStiffness(constraint, stiffness)
}

// @C: `CP_EXPORT cpFloat cpDampedSpringGetDamping(const cpConstraint *constraint)`
fn C.cpDampedSpringGetDamping(const_constraint &Constraint) Float

// damped_spring_get_damping : Get the damping of the spring.
pub fn damped_spring_get_damping(const_constraint &Constraint) Float {
	return C.cpDampedSpringGetDamping(const_constraint)
}

// @C: `CP_EXPORT void cpDampedSpringSetDamping(cpConstraint *constraint, cpFloat damping)`
fn C.cpDampedSpringSetDamping(constraint &Constraint, damping Float)

// damped_spring_set_damping : Set the damping of the spring.
pub fn damped_spring_set_damping(constraint &Constraint, damping Float) {
	C.cpDampedSpringSetDamping(constraint, damping)
}

// @C: `CP_EXPORT cpDampedSpringForceFunc cpDampedSpringGetSpringForceFunc(const cpConstraint *constraint)`
fn C.cpDampedSpringGetSpringForceFunc(const_constraint &Constraint) C.cpDampedSpringForceFunc

// damped_spring_get_spring_force_func : Get the damping of the spring.
pub fn damped_spring_get_spring_force_func(const_constraint &Constraint) C.cpDampedSpringForceFunc {
	return C.cpDampedSpringGetSpringForceFunc(const_constraint)
}

// @C: `CP_EXPORT void cpDampedSpringSetSpringForceFunc(cpConstraint *constraint, cpDampedSpringForceFunc springForceFunc)`
fn C.cpDampedSpringSetSpringForceFunc(constraint &Constraint, spring_force_func C.cpDampedSpringForceFunc)

// damped_spring_set_spring_force_func : Set the damping of the spring.
pub fn damped_spring_set_spring_force_func(constraint &Constraint, spring_force_func C.cpDampedSpringForceFunc) {
	C.cpDampedSpringSetSpringForceFunc(constraint, spring_force_func)
}
