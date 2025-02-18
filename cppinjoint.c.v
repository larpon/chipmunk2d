// Copyright(C) 2025 Lars Pontoppidan. All rights reserved.
// Use of this source code is governed by an MIT license
// that can be found in the LICENSE file.
module chipmunk2d

//
// cpPinJoint.h
//

// @C: `CP_EXPORT cpBool cpConstraintIsPinJoint(const cpConstraint *constraint)`
fn C.cpConstraintIsPinJoint(const_constraint &Constraint) bool // C.cpBool

// constraint_is_pin_joint : Check if a constraint is a pin joint.
pub fn constraint_is_pin_joint(const_constraint &Constraint) bool { // bool // C.cpBool
	return C.cpConstraintIsPinJoint(const_constraint)
}

// @C: `CP_EXPORT cpPinJoint* cpPinJointAlloc(void)`
fn C.cpPinJointAlloc() &PinJoint

// pin_joint_alloc : Allocate a pin joint.
pub fn pin_joint_alloc() &PinJoint {
	return C.cpPinJointAlloc()
}

// @C: `CP_EXPORT cpPinJoint* cpPinJointInit(cpPinJoint *joint, cpBody *a, cpBody *b, cpVect anchorA, cpVect anchorB)`
fn C.cpPinJointInit(joint &PinJoint, a &Body, b &Body, anchor_a Vect, anchor_b Vect) &PinJoint

// pin_joint_init : Initialize a pin joint.
pub fn pin_joint_init(joint &PinJoint, a &Body, b &Body, anchor_a Vect, anchor_b Vect) &PinJoint {
	return C.cpPinJointInit(joint, a, b, anchor_a, anchor_b)
}

// @C: `CP_EXPORT cpConstraint* cpPinJointNew(cpBody *a, cpBody *b, cpVect anchorA, cpVect anchorB)`
fn C.cpPinJointNew(a &Body, b &Body, anchor_a Vect, anchor_b Vect) &Constraint

// pin_joint_new : Allocate and initialize a pin joint.
pub fn pin_joint_new(a &Body, b &Body, anchor_a Vect, anchor_b Vect) &Constraint {
	return C.cpPinJointNew(a, b, anchor_a, anchor_b)
}

// @C: `CP_EXPORT cpVect cpPinJointGetAnchorA(const cpConstraint *constraint)`
fn C.cpPinJointGetAnchorA(const_constraint &Constraint) Vect

// pin_joint_get_anchor_a : Get the location of the first anchor relative to the first body.
pub fn pin_joint_get_anchor_a(const_constraint &Constraint) Vect {
	return C.cpPinJointGetAnchorA(const_constraint)
}

// @C: `CP_EXPORT void cpPinJointSetAnchorA(cpConstraint *constraint, cpVect anchorA)`
fn C.cpPinJointSetAnchorA(constraint &Constraint, anchor_a Vect)

// pin_joint_set_anchor_a : Set the location of the first anchor relative to the first body.
pub fn pin_joint_set_anchor_a(constraint &Constraint, anchor_a Vect) {
	C.cpPinJointSetAnchorA(constraint, anchor_a)
}

// @C: `CP_EXPORT cpVect cpPinJointGetAnchorB(const cpConstraint *constraint)`
fn C.cpPinJointGetAnchorB(const_constraint &Constraint) Vect

// pin_joint_get_anchor_b : Get the location of the second anchor relative to the second body.
pub fn pin_joint_get_anchor_b(const_constraint &Constraint) Vect {
	return C.cpPinJointGetAnchorB(const_constraint)
}

// @C: `CP_EXPORT void cpPinJointSetAnchorB(cpConstraint *constraint, cpVect anchorB)`
fn C.cpPinJointSetAnchorB(constraint &Constraint, anchor_b Vect)

// pin_joint_set_anchor_b : Set the location of the second anchor relative to the second body.
pub fn pin_joint_set_anchor_b(constraint &Constraint, anchor_b Vect) {
	C.cpPinJointSetAnchorB(constraint, anchor_b)
}

// @C: `CP_EXPORT cpFloat cpPinJointGetDist(const cpConstraint *constraint)`
fn C.cpPinJointGetDist(const_constraint &Constraint) Float

// pin_joint_get_dist : Get the distance the joint will maintain between the two anchors.
pub fn pin_joint_get_dist(const_constraint &Constraint) Float {
	return C.cpPinJointGetDist(const_constraint)
}

// @C: `CP_EXPORT void cpPinJointSetDist(cpConstraint *constraint, cpFloat dist)`
fn C.cpPinJointSetDist(constraint &Constraint, dist Float)

// pin_joint_set_dist : Set the distance the joint will maintain between the two anchors.
pub fn pin_joint_set_dist(constraint &Constraint, dist Float) {
	C.cpPinJointSetDist(constraint, dist)
}
