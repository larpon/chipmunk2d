// Copyright(C) 2025 Lars Pontoppidan. All rights reserved.
// Use of this source code is governed by an MIT license
// that can be found in the LICENSE file.
module chipmunk2d

//
// cpRotaryLimitJoint.h
//

// @C: `CP_EXPORT cpBool cpConstraintIsRotaryLimitJoint(const cpConstraint *constraint)`
fn C.cpConstraintIsRotaryLimitJoint(const_constraint &Constraint) bool // C.cpBool

// constraint_is_rotary_limit_joint : Check if a constraint is a damped rotary springs.
pub fn constraint_is_rotary_limit_joint(const_constraint &Constraint) bool { // bool // C.cpBool
	return C.cpConstraintIsRotaryLimitJoint(const_constraint)
}

// @C: `CP_EXPORT cpRotaryLimitJoint* cpRotaryLimitJointAlloc(void)`
fn C.cpRotaryLimitJointAlloc() &RotaryLimitJoint

// rotary_limit_joint_alloc : Allocate a damped rotary limit joint.
pub fn rotary_limit_joint_alloc() &RotaryLimitJoint {
	return C.cpRotaryLimitJointAlloc()
}

// @C: `CP_EXPORT cpRotaryLimitJoint* cpRotaryLimitJointInit(cpRotaryLimitJoint *joint, cpBody *a, cpBody *b, cpFloat min, cpFloat max)`
fn C.cpRotaryLimitJointInit(joint &RotaryLimitJoint, a &Body, b &Body, min Float, max Float) &RotaryLimitJoint

// rotary_limit_joint_init : Initialize a damped rotary limit joint.
pub fn rotary_limit_joint_init(joint &RotaryLimitJoint, a &Body, b &Body, min Float, max Float) &RotaryLimitJoint {
	return C.cpRotaryLimitJointInit(joint, a, b, min, max)
}

// @C: `CP_EXPORT cpConstraint* cpRotaryLimitJointNew(cpBody *a, cpBody *b, cpFloat min, cpFloat max)`
fn C.cpRotaryLimitJointNew(a &Body, b &Body, min Float, max Float) &Constraint

// rotary_limit_joint_new : Allocate and initialize a damped rotary limit joint.
pub fn rotary_limit_joint_new(a &Body, b &Body, min Float, max Float) &Constraint {
	return C.cpRotaryLimitJointNew(a, b, min, max)
}

// @C: `CP_EXPORT cpFloat cpRotaryLimitJointGetMin(const cpConstraint *constraint)`
fn C.cpRotaryLimitJointGetMin(const_constraint &Constraint) Float

// rotary_limit_joint_get_min : Get the minimum distance the joint will maintain between the two anchors.
pub fn rotary_limit_joint_get_min(const_constraint &Constraint) Float {
	return C.cpRotaryLimitJointGetMin(const_constraint)
}

// @C: `CP_EXPORT void cpRotaryLimitJointSetMin(cpConstraint *constraint, cpFloat min)`
fn C.cpRotaryLimitJointSetMin(constraint &Constraint, min Float)

// rotary_limit_joint_set_min : Set the minimum distance the joint will maintain between the two anchors.
pub fn rotary_limit_joint_set_min(constraint &Constraint, min Float) {
	C.cpRotaryLimitJointSetMin(constraint, min)
}

// @C: `CP_EXPORT cpFloat cpRotaryLimitJointGetMax(const cpConstraint *constraint)`
fn C.cpRotaryLimitJointGetMax(const_constraint &Constraint) Float

// rotary_limit_joint_get_max : Get the maximum distance the joint will maintain between the two anchors.
pub fn rotary_limit_joint_get_max(const_constraint &Constraint) Float {
	return C.cpRotaryLimitJointGetMax(const_constraint)
}

// @C: `CP_EXPORT void cpRotaryLimitJointSetMax(cpConstraint *constraint, cpFloat max)`
fn C.cpRotaryLimitJointSetMax(constraint &Constraint, max Float)

// rotary_limit_joint_set_max : Set the maximum distance the joint will maintain between the two anchors.
pub fn rotary_limit_joint_set_max(constraint &Constraint, max Float) {
	C.cpRotaryLimitJointSetMax(constraint, max)
}
