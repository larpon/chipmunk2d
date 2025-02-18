// Copyright(C) 2025 Lars Pontoppidan. All rights reserved.
// Use of this source code is governed by an MIT license
// that can be found in the LICENSE file.
module chipmunk2d

//
// cpGrooveJoint.h
//

// @C: `CP_EXPORT cpBool cpConstraintIsGrooveJoint(const cpConstraint *constraint)`
fn C.cpConstraintIsGrooveJoint(const_constraint &Constraint) bool // C.cpBool

// constraint_is_groove_joint : Check if a constraint is a slide joint.
pub fn constraint_is_groove_joint(const_constraint &Constraint) bool { // bool // C.cpBool
	return C.cpConstraintIsGrooveJoint(const_constraint)
}

// @C: `CP_EXPORT cpGrooveJoint* cpGrooveJointAlloc(void)`
fn C.cpGrooveJointAlloc() &GrooveJoint

// groove_joint_alloc : Allocate a groove joint.
pub fn groove_joint_alloc() &GrooveJoint {
	return C.cpGrooveJointAlloc()
}

// @C: `CP_EXPORT cpGrooveJoint* cpGrooveJointInit(cpGrooveJoint *joint, cpBody *a, cpBody *b, cpVect groove_a, cpVect groove_b, cpVect anchorB)`
fn C.cpGrooveJointInit(joint &GrooveJoint, a &Body, b &Body, groove_a Vect, groove_b Vect, anchor_b Vect) &GrooveJoint

// groove_joint_init : Initialize a groove joint.
pub fn groove_joint_init(joint &GrooveJoint, a &Body, b &Body, groove_a Vect, groove_b Vect, anchor_b Vect) &GrooveJoint {
	return C.cpGrooveJointInit(joint, a, b, groove_a, groove_b, anchor_b)
}

// @C: `CP_EXPORT cpConstraint* cpGrooveJointNew(cpBody *a, cpBody *b, cpVect groove_a, cpVect groove_b, cpVect anchorB)`
fn C.cpGrooveJointNew(a &Body, b &Body, groove_a Vect, groove_b Vect, anchor_b Vect) &Constraint

// groove_joint_new : Allocate and initialize a groove joint.
pub fn groove_joint_new(a &Body, b &Body, groove_a Vect, groove_b Vect, anchor_b Vect) &Constraint {
	return C.cpGrooveJointNew(a, b, groove_a, groove_b, anchor_b)
}

// @C: `CP_EXPORT cpVect cpGrooveJointGetGrooveA(const cpConstraint *constraint)`
fn C.cpGrooveJointGetGrooveA(const_constraint &Constraint) Vect

// groove_joint_get_groove_a : Get the first endpoint of the groove relative to the first body.
pub fn groove_joint_get_groove_a(const_constraint &Constraint) Vect {
	return C.cpGrooveJointGetGrooveA(const_constraint)
}

// @C: `CP_EXPORT void cpGrooveJointSetGrooveA(cpConstraint *constraint, cpVect grooveA)`
fn C.cpGrooveJointSetGrooveA(constraint &Constraint, groove_a Vect)

// groove_joint_set_groove_a : Set the first endpoint of the groove relative to the first body.
pub fn groove_joint_set_groove_a(constraint &Constraint, groove_a Vect) {
	C.cpGrooveJointSetGrooveA(constraint, groove_a)
}

// @C: `CP_EXPORT cpVect cpGrooveJointGetGrooveB(const cpConstraint *constraint)`
fn C.cpGrooveJointGetGrooveB(const_constraint &Constraint) Vect

// groove_joint_get_groove_b : Get the first endpoint of the groove relative to the first body.
pub fn groove_joint_get_groove_b(const_constraint &Constraint) Vect {
	return C.cpGrooveJointGetGrooveB(const_constraint)
}

// @C: `CP_EXPORT void cpGrooveJointSetGrooveB(cpConstraint *constraint, cpVect grooveB)`
fn C.cpGrooveJointSetGrooveB(constraint &Constraint, groove_b Vect)

// groove_joint_set_groove_b : Set the first endpoint of the groove relative to the first body.
pub fn groove_joint_set_groove_b(constraint &Constraint, groove_b Vect) {
	C.cpGrooveJointSetGrooveB(constraint, groove_b)
}

// @C: `CP_EXPORT cpVect cpGrooveJointGetAnchorB(const cpConstraint *constraint)`
fn C.cpGrooveJointGetAnchorB(const_constraint &Constraint) Vect

// groove_joint_get_anchor_b : Get the location of the second anchor relative to the second body.
pub fn groove_joint_get_anchor_b(const_constraint &Constraint) Vect {
	return C.cpGrooveJointGetAnchorB(const_constraint)
}

// @C: `CP_EXPORT void cpGrooveJointSetAnchorB(cpConstraint *constraint, cpVect anchorB)`
fn C.cpGrooveJointSetAnchorB(constraint &Constraint, anchor_b Vect)

// groove_joint_set_anchor_b : Set the location of the second anchor relative to the second body.
pub fn groove_joint_set_anchor_b(constraint &Constraint, anchor_b Vect) {
	C.cpGrooveJointSetAnchorB(constraint, anchor_b)
}
