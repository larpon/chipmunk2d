// Copyright(C) 2025 Lars Pontoppidan. All rights reserved.
// Use of this source code is governed by an MIT license
// that can be found in the LICENSE file.
module chipmunk2d

//
// cpSlideJoint.h
//

// @C: `CP_EXPORT cpBool cpConstraintIsSlideJoint(const cpConstraint *constraint)`
fn C.cpConstraintIsSlideJoint(const_constraint &Constraint) bool // C.cpBool

// constraint_is_slide_joint : Check if a constraint is a slide joint.
pub fn constraint_is_slide_joint(const_constraint &Constraint) bool { // bool // C.cpBool
	return C.cpConstraintIsSlideJoint(const_constraint)
}

// @C: `CP_EXPORT cpSlideJoint* cpSlideJointAlloc(void)`
fn C.cpSlideJointAlloc() &SlideJoint

// slide_joint_alloc : Allocate a slide joint.
pub fn slide_joint_alloc() &SlideJoint {
	return C.cpSlideJointAlloc()
}

// @C: `CP_EXPORT cpSlideJoint* cpSlideJointInit(cpSlideJoint *joint, cpBody *a, cpBody *b, cpVect anchorA, cpVect anchorB, cpFloat min, cpFloat max)`
fn C.cpSlideJointInit(joint &SlideJoint, a &Body, b &Body, anchor_a Vect, anchor_b Vect, min Float, max Float) &SlideJoint

// slide_joint_init : Initialize a slide joint.
pub fn slide_joint_init(joint &SlideJoint, a &Body, b &Body, anchor_a Vect, anchor_b Vect, min Float, max Float) &SlideJoint {
	return C.cpSlideJointInit(joint, a, b, anchor_a, anchor_b, min, max)
}

// @C: `CP_EXPORT cpConstraint* cpSlideJointNew(cpBody *a, cpBody *b, cpVect anchorA, cpVect anchorB, cpFloat min, cpFloat max)`
fn C.cpSlideJointNew(a &Body, b &Body, anchor_a Vect, anchor_b Vect, min Float, max Float) &Constraint

// slide_joint_new : Allocate and initialize a slide joint.
pub fn slide_joint_new(a &Body, b &Body, anchor_a Vect, anchor_b Vect, min Float, max Float) &Constraint {
	return C.cpSlideJointNew(a, b, anchor_a, anchor_b, min, max)
}

// @C: `CP_EXPORT cpVect cpSlideJointGetAnchorA(const cpConstraint *constraint)`
fn C.cpSlideJointGetAnchorA(const_constraint &Constraint) Vect

// slide_joint_get_anchor_a : Get the location of the first anchor relative to the first body.
pub fn slide_joint_get_anchor_a(const_constraint &Constraint) Vect {
	return C.cpSlideJointGetAnchorA(const_constraint)
}

// @C: `CP_EXPORT void cpSlideJointSetAnchorA(cpConstraint *constraint, cpVect anchorA)`
fn C.cpSlideJointSetAnchorA(constraint &Constraint, anchor_a Vect)

// slide_joint_set_anchor_a : Set the location of the first anchor relative to the first body.
pub fn slide_joint_set_anchor_a(constraint &Constraint, anchor_a Vect) {
	C.cpSlideJointSetAnchorA(constraint, anchor_a)
}

// @C: `CP_EXPORT cpVect cpSlideJointGetAnchorB(const cpConstraint *constraint)`
fn C.cpSlideJointGetAnchorB(const_constraint &Constraint) Vect

// slide_joint_get_anchor_b : Get the location of the second anchor relative to the second body.
pub fn slide_joint_get_anchor_b(const_constraint &Constraint) Vect {
	return C.cpSlideJointGetAnchorB(const_constraint)
}

// @C: `CP_EXPORT void cpSlideJointSetAnchorB(cpConstraint *constraint, cpVect anchorB)`
fn C.cpSlideJointSetAnchorB(constraint &Constraint, anchor_b Vect)

// slide_joint_set_anchor_b : Set the location of the second anchor relative to the second body.
pub fn slide_joint_set_anchor_b(constraint &Constraint, anchor_b Vect) {
	C.cpSlideJointSetAnchorB(constraint, anchor_b)
}

// @C: `CP_EXPORT cpFloat cpSlideJointGetMin(const cpConstraint *constraint)`
fn C.cpSlideJointGetMin(const_constraint &Constraint) Float

// slide_joint_get_min : Get the minimum distance the joint will maintain between the two anchors.
pub fn slide_joint_get_min(const_constraint &Constraint) Float {
	return C.cpSlideJointGetMin(const_constraint)
}

// @C: `CP_EXPORT void cpSlideJointSetMin(cpConstraint *constraint, cpFloat min)`
fn C.cpSlideJointSetMin(constraint &Constraint, min Float)

// slide_joint_set_min : Set the minimum distance the joint will maintain between the two anchors.
pub fn slide_joint_set_min(constraint &Constraint, min Float) {
	C.cpSlideJointSetMin(constraint, min)
}

// @C: `CP_EXPORT cpFloat cpSlideJointGetMax(const cpConstraint *constraint)`
fn C.cpSlideJointGetMax(const_constraint &Constraint) Float

// slide_joint_get_max : Get the maximum distance the joint will maintain between the two anchors.
pub fn slide_joint_get_max(const_constraint &Constraint) Float {
	return C.cpSlideJointGetMax(const_constraint)
}

// @C: `CP_EXPORT void cpSlideJointSetMax(cpConstraint *constraint, cpFloat max)`
fn C.cpSlideJointSetMax(constraint &Constraint, max Float)

// slide_joint_set_max : Set the maximum distance the joint will maintain between the two anchors.
pub fn slide_joint_set_max(constraint &Constraint, max Float) {
	C.cpSlideJointSetMax(constraint, max)
}
