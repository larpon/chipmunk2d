// Copyright(C) 2025 Lars Pontoppidan. All rights reserved.
// Use of this source code is governed by an MIT license
// that can be found in the LICENSE file.
module chipmunk2d

//
// cpConstraint.h
//

// ConstraintPreSolveFunc : Callback function type that gets called before solving a joint.
// @C: typedef void (*cpConstraintPreSolveFunc)(cpConstraint *constraint, cpSpace *space);
pub type ConstraintPreSolveFunc = fn (constraint &Constraint, space &Space)

// ConstraintPostSolveFunc : Callback function type that gets called after solving a joint.
// @C: typedef void (*cpConstraintPostSolveFunc)(cpConstraint *constraint, cpSpace *space);
pub type ConstraintPostSolveFunc = fn (constraint &Constraint, space &Space)

// @C: `CP_EXPORT void cpConstraintDestroy(cpConstraint *constraint)`
fn C.cpConstraintDestroy(constraint &Constraint)

// constraint_destroy : Destroy a constraint.
pub fn constraint_destroy(constraint &Constraint) {
	C.cpConstraintDestroy(constraint)
}

// @C: `CP_EXPORT void cpConstraintFree(cpConstraint *constraint)`
fn C.cpConstraintFree(constraint &Constraint)

// constraint_free : Destroy and free a constraint.
pub fn constraint_free(constraint &Constraint) {
	C.cpConstraintFree(constraint)
}

// @C: `CP_EXPORT cpSpace* cpConstraintGetSpace(const cpConstraint *constraint)`
fn C.cpConstraintGetSpace(const_constraint &Constraint) &Space

// constraint_get_space : Get the cpSpace this constraint is added to.
pub fn constraint_get_space(const_constraint &Constraint) &Space {
	return C.cpConstraintGetSpace(const_constraint)
}

// @C: `CP_EXPORT cpBody* cpConstraintGetBodyA(const cpConstraint *constraint)`
fn C.cpConstraintGetBodyA(const_constraint &Constraint) &Body

// constraint_get_body_a : Get the first body the constraint is attached to.
pub fn constraint_get_body_a(const_constraint &Constraint) &Body {
	return C.cpConstraintGetBodyA(const_constraint)
}

// @C: `CP_EXPORT cpBody* cpConstraintGetBodyB(const cpConstraint *constraint)`
fn C.cpConstraintGetBodyB(const_constraint &Constraint) &Body

// constraint_get_body_b : Get the second body the constraint is attached to.
pub fn constraint_get_body_b(const_constraint &Constraint) &Body {
	return C.cpConstraintGetBodyB(const_constraint)
}

// @C: `CP_EXPORT cpFloat cpConstraintGetMaxForce(const cpConstraint *constraint)`
fn C.cpConstraintGetMaxForce(const_constraint &Constraint) Float

// constraint_get_max_force : Get the maximum force that this constraint is allowed to use.
pub fn constraint_get_max_force(const_constraint &Constraint) Float {
	return C.cpConstraintGetMaxForce(const_constraint)
}

// @C: `CP_EXPORT void cpConstraintSetMaxForce(cpConstraint *constraint, cpFloat maxForce)`
fn C.cpConstraintSetMaxForce(constraint &Constraint, max_force Float)

// constraint_set_max_force : Set the maximum force that this constraint is allowed to use. (defaults to INFINITY)
pub fn constraint_set_max_force(constraint &Constraint, max_force Float) {
	C.cpConstraintSetMaxForce(constraint, max_force)
}

// @C: `CP_EXPORT cpFloat cpConstraintGetErrorBias(const cpConstraint *constraint)`
fn C.cpConstraintGetErrorBias(const_constraint &Constraint) Float

// constraint_get_error_bias : Get rate at which joint error is corrected.
pub fn constraint_get_error_bias(const_constraint &Constraint) Float {
	return C.cpConstraintGetErrorBias(const_constraint)
}

// @C: `CP_EXPORT void cpConstraintSetErrorBias(cpConstraint *constraint, cpFloat errorBias)`
fn C.cpConstraintSetErrorBias(constraint &Constraint, error_bias Float)

// constraint_set_error_bias : Set rate at which joint error is corrected.
// constraint_set_error_bias : Defaults to pow(1.0 - 0.1, 60.0) meaning that it will
// correct 10% of the error every 1/60th of a second.
pub fn constraint_set_error_bias(constraint &Constraint, error_bias Float) {
	C.cpConstraintSetErrorBias(constraint, error_bias)
}

// @C: `CP_EXPORT cpFloat cpConstraintGetMaxBias(const cpConstraint *constraint)`
fn C.cpConstraintGetMaxBias(const_constraint &Constraint) Float

// constraint_get_max_bias : Get the maximum rate at which joint error is corrected.
pub fn constraint_get_max_bias(const_constraint &Constraint) Float {
	return C.cpConstraintGetMaxBias(const_constraint)
}

// @C: `CP_EXPORT void cpConstraintSetMaxBias(cpConstraint *constraint, cpFloat maxBias)`
fn C.cpConstraintSetMaxBias(constraint &Constraint, max_bias Float)

// constraint_set_max_bias : Set the maximum rate at which joint error is corrected. (defaults to INFINITY)
pub fn constraint_set_max_bias(constraint &Constraint, max_bias Float) {
	C.cpConstraintSetMaxBias(constraint, max_bias)
}

// @C: `CP_EXPORT cpBool cpConstraintGetCollideBodies(const cpConstraint *constraint)`
fn C.cpConstraintGetCollideBodies(const_constraint &Constraint) bool // C.cpBool

// constraint_get_collide_bodies : Get if the two bodies connected by the constraint are allowed to collide or not.
pub fn constraint_get_collide_bodies(const_constraint &Constraint) bool { // bool // C.cpBool
	return C.cpConstraintGetCollideBodies(const_constraint)
}

// @C: `CP_EXPORT void cpConstraintSetCollideBodies(cpConstraint *constraint, cpBool collideBodies)`
fn C.cpConstraintSetCollideBodies(constraint &Constraint, collide_bodies bool) // C.cpBool

// constraint_set_collide_bodies : Set if the two bodies connected by the constraint are allowed to collide or not. (defaults to cpFalse)
pub fn constraint_set_collide_bodies(constraint &Constraint, collide_bodies bool) { // C.cpBool
	C.cpConstraintSetCollideBodies(constraint, collide_bodies)
}

// @C: `CP_EXPORT cpConstraintPreSolveFunc cpConstraintGetPreSolveFunc(const cpConstraint *constraint)`
fn C.cpConstraintGetPreSolveFunc(const_constraint &Constraint) ConstraintPreSolveFunc

// constraint_get_pre_solve_func : Get the pre-solve function that is called before the solver runs.
pub fn constraint_get_pre_solve_func(const_constraint &Constraint) ConstraintPreSolveFunc {
	return C.cpConstraintGetPreSolveFunc(const_constraint)
}

// @C: `CP_EXPORT void cpConstraintSetPreSolveFunc(cpConstraint *constraint, cpConstraintPreSolveFunc preSolveFunc)`
fn C.cpConstraintSetPreSolveFunc(constraint &Constraint, pre_solve_func ConstraintPreSolveFunc)

// constraint_set_pre_solve_func : Set the pre-solve function that is called before the solver runs.
pub fn constraint_set_pre_solve_func(constraint &Constraint, pre_solve_func ConstraintPreSolveFunc) {
	C.cpConstraintSetPreSolveFunc(constraint, pre_solve_func)
}

// @C: `CP_EXPORT cpConstraintPostSolveFunc cpConstraintGetPostSolveFunc(const cpConstraint *constraint)`
fn C.cpConstraintGetPostSolveFunc(const_constraint &Constraint) ConstraintPostSolveFunc

// constraint_get_post_solve_func : Get the post-solve function that is called before the solver runs.
pub fn constraint_get_post_solve_func(const_constraint &Constraint) ConstraintPostSolveFunc {
	return C.cpConstraintGetPostSolveFunc(const_constraint)
}

// @C: `CP_EXPORT void cpConstraintSetPostSolveFunc(cpConstraint *constraint, cpConstraintPostSolveFunc postSolveFunc)`
fn C.cpConstraintSetPostSolveFunc(constraint &Constraint, post_solve_func ConstraintPostSolveFunc)

// constraint_set_post_solve_func : Set the post-solve function that is called before the solver runs.
pub fn constraint_set_post_solve_func(constraint &Constraint, post_solve_func ConstraintPostSolveFunc) {
	C.cpConstraintSetPostSolveFunc(constraint, post_solve_func)
}

// @C: `CP_EXPORT cpDataPointer cpConstraintGetUserData(const cpConstraint *constraint)`
fn C.cpConstraintGetUserData(const_constraint &Constraint) DataPointer

// constraint_get_user_data : Get the user definable data pointer for this constraint
pub fn constraint_get_user_data(const_constraint &Constraint) DataPointer {
	return C.cpConstraintGetUserData(const_constraint)
}

// @C: `CP_EXPORT void cpConstraintSetUserData(cpConstraint *constraint, cpDataPointer userData)`
fn C.cpConstraintSetUserData(constraint &Constraint, user_data DataPointer)

// constraint_set_user_data : Set the user definable data pointer for this constraint
pub fn constraint_set_user_data(constraint &Constraint, user_data DataPointer) {
	C.cpConstraintSetUserData(constraint, user_data)
}

// @C: `CP_EXPORT cpFloat cpConstraintGetImpulse(cpConstraint *constraint)`
fn C.cpConstraintGetImpulse(constraint &Constraint) Float

// constraint_get_impulse : Get the last impulse applied by this constraint.
pub fn constraint_get_impulse(constraint &Constraint) Float {
	return C.cpConstraintGetImpulse(constraint)
}
