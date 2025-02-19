// Copyright(C) 2025 Lars Pontoppidan. All rights reserved.
// Use of this source code is governed by an MIT license
// that can be found in the LICENSE file.
module chipmunk2d

//
// cpDampedRotarySpring.h
//

// @C: `CP_EXPORT cpBool cpConstraintIsDampedRotarySpring(const cpConstraint *constraint)`
fn C.cpConstraintIsDampedRotarySpring(const_constraint &Constraint) bool // C.cpBool

// constraint_is_damped_rotary_spring : Check if a constraint is a damped rotary springs.
pub fn constraint_is_damped_rotary_spring(const_constraint &Constraint) bool { // bool // C.cpBool
	return C.cpConstraintIsDampedRotarySpring(const_constraint)
}

// DampedRotarySpringTorqueFunc : Function type used for damped rotary spring force callbacks.
// @C: typedef cpFloat (*cpDampedRotarySpringTorqueFunc)(struct cpConstraint *spring, cpFloat relativeAngle);
pub type DampedRotarySpringTorqueFunc = fn (spring &Constraint, relative_angle Float) Float

// @C: `CP_EXPORT cpDampedRotarySpring* cpDampedRotarySpringAlloc(void)`
fn C.cpDampedRotarySpringAlloc() &DampedRotarySpring

// damped_rotary_spring_alloc : Allocate a damped rotary spring.
pub fn damped_rotary_spring_alloc() &DampedRotarySpring {
	return C.cpDampedRotarySpringAlloc()
}

// @C: `CP_EXPORT cpDampedRotarySpring* cpDampedRotarySpringInit(cpDampedRotarySpring *joint, cpBody *a, cpBody *b, cpFloat restAngle, cpFloat stiffness, cpFloat damping)`
fn C.cpDampedRotarySpringInit(joint &DampedRotarySpring, a &Body, b &Body, rest_angle Float, stiffness Float, damping Float) &DampedRotarySpring

// damped_rotary_spring_init : Initialize a damped rotary spring.
pub fn damped_rotary_spring_init(joint &DampedRotarySpring, a &Body, b &Body, rest_angle Float, stiffness Float, damping Float) &DampedRotarySpring {
	return C.cpDampedRotarySpringInit(joint, a, b, rest_angle, stiffness, damping)
}

// @C: `CP_EXPORT cpConstraint* cpDampedRotarySpringNew(cpBody *a, cpBody *b, cpFloat restAngle, cpFloat stiffness, cpFloat damping)`
fn C.cpDampedRotarySpringNew(a &Body, b &Body, rest_angle Float, stiffness Float, damping Float) &Constraint

// damped_rotary_spring_new : Allocate and initialize a damped rotary spring.
pub fn damped_rotary_spring_new(a &Body, b &Body, rest_angle Float, stiffness Float, damping Float) &Constraint {
	return C.cpDampedRotarySpringNew(a, b, rest_angle, stiffness, damping)
}

// @C: `CP_EXPORT cpFloat cpDampedRotarySpringGetRestAngle(const cpConstraint *constraint)`
fn C.cpDampedRotarySpringGetRestAngle(const_constraint &Constraint) Float

// damped_rotary_spring_get_rest_angle : Get the rest length of the spring.
pub fn damped_rotary_spring_get_rest_angle(const_constraint &Constraint) Float {
	return C.cpDampedRotarySpringGetRestAngle(const_constraint)
}

// @C: `CP_EXPORT void cpDampedRotarySpringSetRestAngle(cpConstraint *constraint, cpFloat restAngle)`
fn C.cpDampedRotarySpringSetRestAngle(constraint &Constraint, rest_angle Float)

// damped_rotary_spring_set_rest_angle : Set the rest length of the spring.
pub fn damped_rotary_spring_set_rest_angle(constraint &Constraint, rest_angle Float) {
	C.cpDampedRotarySpringSetRestAngle(constraint, rest_angle)
}

// @C: `CP_EXPORT cpFloat cpDampedRotarySpringGetStiffness(const cpConstraint *constraint)`
fn C.cpDampedRotarySpringGetStiffness(const_constraint &Constraint) Float

// damped_rotary_spring_get_stiffness : Get the stiffness of the spring in force/distance.
pub fn damped_rotary_spring_get_stiffness(const_constraint &Constraint) Float {
	return C.cpDampedRotarySpringGetStiffness(const_constraint)
}

// @C: `CP_EXPORT void cpDampedRotarySpringSetStiffness(cpConstraint *constraint, cpFloat stiffness)`
fn C.cpDampedRotarySpringSetStiffness(constraint &Constraint, stiffness Float)

// damped_rotary_spring_set_stiffness : Set the stiffness of the spring in force/distance.
pub fn damped_rotary_spring_set_stiffness(constraint &Constraint, stiffness Float) {
	C.cpDampedRotarySpringSetStiffness(constraint, stiffness)
}

// @C: `CP_EXPORT cpFloat cpDampedRotarySpringGetDamping(const cpConstraint *constraint)`
fn C.cpDampedRotarySpringGetDamping(const_constraint &Constraint) Float

// damped_rotary_spring_get_damping : Get the damping of the spring.
pub fn damped_rotary_spring_get_damping(const_constraint &Constraint) Float {
	return C.cpDampedRotarySpringGetDamping(const_constraint)
}

// @C: `CP_EXPORT void cpDampedRotarySpringSetDamping(cpConstraint *constraint, cpFloat damping)`
fn C.cpDampedRotarySpringSetDamping(constraint &Constraint, damping Float)

// damped_rotary_spring_set_damping : Set the damping of the spring.
pub fn damped_rotary_spring_set_damping(constraint &Constraint, damping Float) {
	C.cpDampedRotarySpringSetDamping(constraint, damping)
}

// @C: `CP_EXPORT cpDampedRotarySpringTorqueFunc cpDampedRotarySpringGetSpringTorqueFunc(const cpConstraint *constraint)`
fn C.cpDampedRotarySpringGetSpringTorqueFunc(const_constraint &Constraint) DampedRotarySpringTorqueFunc

// damped_rotary_spring_get_spring_torque_func : Get the damping of the spring.
pub fn damped_rotary_spring_get_spring_torque_func(const_constraint &Constraint) DampedRotarySpringTorqueFunc {
	return C.cpDampedRotarySpringGetSpringTorqueFunc(const_constraint)
}

// @C: `CP_EXPORT void cpDampedRotarySpringSetSpringTorqueFunc(cpConstraint *constraint, cpDampedRotarySpringTorqueFunc springTorqueFunc)`
fn C.cpDampedRotarySpringSetSpringTorqueFunc(constraint &Constraint, spring_torque_func DampedRotarySpringTorqueFunc)

// damped_rotary_spring_set_spring_torque_func : Set the damping of the spring.
pub fn damped_rotary_spring_set_spring_torque_func(constraint &Constraint, spring_torque_func DampedRotarySpringTorqueFunc) {
	C.cpDampedRotarySpringSetSpringTorqueFunc(constraint, spring_torque_func)
}
