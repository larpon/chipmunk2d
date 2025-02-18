// Copyright(C) 2025 Lars Pontoppidan. All rights reserved.
// Use of this source code is governed by an MIT license
// that can be found in the LICENSE file.
module chipmunk2d

//
// cpPivotJoint.h
//

// @C: `CP_EXPORT cpBool cpConstraintIsPivotJoint(const cpConstraint *constraint)`
fn C.cpConstraintIsPivotJoint(const_constraint &Constraint) bool // C.cpBool

// constraint_is_pivot_joint : Check if a constraint is a slide joint.
pub fn constraint_is_pivot_joint(const_constraint &Constraint) bool { // bool // C.cpBool
	return C.cpConstraintIsPivotJoint(const_constraint)
}

// @C: `CP_EXPORT cpPivotJoint* cpPivotJointAlloc(void)`
fn C.cpPivotJointAlloc() &PivotJoint

// pivot_joint_alloc : Allocate a pivot joint
pub fn pivot_joint_alloc() &PivotJoint {
	return C.cpPivotJointAlloc()
}

// @C: `CP_EXPORT cpPivotJoint* cpPivotJointInit(cpPivotJoint *joint, cpBody *a, cpBody *b, cpVect anchorA, cpVect anchorB)`
fn C.cpPivotJointInit(joint &PivotJoint, a &Body, b &Body, anchor_a Vect, anchor_b Vect) &PivotJoint

// pivot_joint_init : Initialize a pivot joint.
pub fn pivot_joint_init(joint &PivotJoint, a &Body, b &Body, anchor_a Vect, anchor_b Vect) &PivotJoint {
	return C.cpPivotJointInit(joint, a, b, anchor_a, anchor_b)
}

// @C: `CP_EXPORT cpConstraint* cpPivotJointNew(cpBody *a, cpBody *b, cpVect pivot)`
fn C.cpPivotJointNew(a &Body, b &Body, pivot Vect) &Constraint

// pivot_joint_new : Allocate and initialize a pivot joint.
pub fn pivot_joint_new(a &Body, b &Body, pivot Vect) &Constraint {
	return C.cpPivotJointNew(a, b, pivot)
}

// @C: `CP_EXPORT cpConstraint* cpPivotJointNew2(cpBody *a, cpBody *b, cpVect anchorA, cpVect anchorB)`
fn C.cpPivotJointNew2(a &Body, b &Body, anchor_a Vect, anchor_b Vect) &Constraint

// pivot_joint_new2 : Allocate and initialize a pivot joint with specific anchors.
pub fn pivot_joint_new2(a &Body, b &Body, anchor_a Vect, anchor_b Vect) &Constraint {
	return C.cpPivotJointNew2(a, b, anchor_a, anchor_b)
}

// @C: `CP_EXPORT cpVect cpPivotJointGetAnchorA(const cpConstraint *constraint)`
fn C.cpPivotJointGetAnchorA(const_constraint &Constraint) Vect

// pivot_joint_get_anchor_a : Get the location of the first anchor relative to the first body.
pub fn pivot_joint_get_anchor_a(const_constraint &Constraint) Vect {
	return C.cpPivotJointGetAnchorA(const_constraint)
}

// @C: `CP_EXPORT void cpPivotJointSetAnchorA(cpConstraint *constraint, cpVect anchorA)`
fn C.cpPivotJointSetAnchorA(constraint &Constraint, anchor_a Vect)

// pivot_joint_set_anchor_a : Set the location of the first anchor relative to the first body.
pub fn pivot_joint_set_anchor_a(constraint &Constraint, anchor_a Vect) {
	C.cpPivotJointSetAnchorA(constraint, anchor_a)
}

// @C: `CP_EXPORT cpVect cpPivotJointGetAnchorB(const cpConstraint *constraint)`
fn C.cpPivotJointGetAnchorB(const_constraint &Constraint) Vect

// pivot_joint_get_anchor_b : Get the location of the second anchor relative to the second body.
pub fn pivot_joint_get_anchor_b(const_constraint &Constraint) Vect {
	return C.cpPivotJointGetAnchorB(const_constraint)
}

// @C: `CP_EXPORT void cpPivotJointSetAnchorB(cpConstraint *constraint, cpVect anchorB)`
fn C.cpPivotJointSetAnchorB(constraint &Constraint, anchor_b Vect)

// pivot_joint_set_anchor_b : Set the location of the second anchor relative to the second body.
pub fn pivot_joint_set_anchor_b(constraint &Constraint, anchor_b Vect) {
	C.cpPivotJointSetAnchorB(constraint, anchor_b)
}
