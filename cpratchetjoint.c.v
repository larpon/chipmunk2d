// Copyright(C) 2025 Lars Pontoppidan. All rights reserved.
// Use of this source code is governed by an MIT license
// that can be found in the LICENSE file.
module chipmunk2d

//
// cpRatchetJoint.h
//

// @C: `CP_EXPORT cpBool cpConstraintIsRatchetJoint(const cpConstraint *constraint)`
fn C.cpConstraintIsRatchetJoint(const_constraint &Constraint) bool // C.cpBool

// constraint_is_ratchet_joint : Check if a constraint is a damped rotary springs.
pub fn constraint_is_ratchet_joint(const_constraint &Constraint) bool { // bool // C.cpBool
	return C.cpConstraintIsRatchetJoint(const_constraint)
}

// @C: `CP_EXPORT cpRatchetJoint* cpRatchetJointAlloc(void)`
fn C.cpRatchetJointAlloc() &RatchetJoint

// ratchet_joint_alloc : Allocate a ratchet joint.
pub fn ratchet_joint_alloc() &RatchetJoint {
	return C.cpRatchetJointAlloc()
}

// @C: `CP_EXPORT cpRatchetJoint* cpRatchetJointInit(cpRatchetJoint *joint, cpBody *a, cpBody *b, cpFloat phase, cpFloat ratchet)`
fn C.cpRatchetJointInit(joint &RatchetJoint, a &Body, b &Body, phase Float, ratchet Float) &RatchetJoint

// ratchet_joint_init : Initialize a ratched joint.
pub fn ratchet_joint_init(joint &RatchetJoint, a &Body, b &Body, phase Float, ratchet Float) &RatchetJoint {
	return C.cpRatchetJointInit(joint, a, b, phase, ratchet)
}

// @C: `CP_EXPORT cpConstraint* cpRatchetJointNew(cpBody *a, cpBody *b, cpFloat phase, cpFloat ratchet)`
fn C.cpRatchetJointNew(a &Body, b &Body, phase Float, ratchet Float) &Constraint

// ratchet_joint_new : Allocate and initialize a ratchet joint.
pub fn ratchet_joint_new(a &Body, b &Body, phase Float, ratchet Float) &Constraint {
	return C.cpRatchetJointNew(a, b, phase, ratchet)
}

// @C: `CP_EXPORT cpFloat cpRatchetJointGetAngle(const cpConstraint *constraint)`
fn C.cpRatchetJointGetAngle(const_constraint &Constraint) Float

// ratchet_joint_get_angle : Get the angle of the current ratchet tooth.
pub fn ratchet_joint_get_angle(const_constraint &Constraint) Float {
	return C.cpRatchetJointGetAngle(const_constraint)
}

// @C: `CP_EXPORT void cpRatchetJointSetAngle(cpConstraint *constraint, cpFloat angle)`
fn C.cpRatchetJointSetAngle(constraint &Constraint, angle Float)

// ratchet_joint_set_angle : Set the angle of the current ratchet tooth.
pub fn ratchet_joint_set_angle(constraint &Constraint, angle Float) {
	C.cpRatchetJointSetAngle(constraint, angle)
}

// @C: `CP_EXPORT cpFloat cpRatchetJointGetPhase(const cpConstraint *constraint)`
fn C.cpRatchetJointGetPhase(const_constraint &Constraint) Float

// ratchet_joint_get_phase : Get the phase offset of the ratchet.
pub fn ratchet_joint_get_phase(const_constraint &Constraint) Float {
	return C.cpRatchetJointGetPhase(const_constraint)
}

// @C: `CP_EXPORT void cpRatchetJointSetPhase(cpConstraint *constraint, cpFloat phase)`
fn C.cpRatchetJointSetPhase(constraint &Constraint, phase Float)

// ratchet_joint_set_phase : Get the phase offset of the ratchet.
pub fn ratchet_joint_set_phase(constraint &Constraint, phase Float) {
	C.cpRatchetJointSetPhase(constraint, phase)
}

// @C: `CP_EXPORT cpFloat cpRatchetJointGetRatchet(const cpConstraint *constraint)`
fn C.cpRatchetJointGetRatchet(const_constraint &Constraint) Float

// ratchet_joint_get_ratchet : Get the angular distance of each ratchet.
pub fn ratchet_joint_get_ratchet(const_constraint &Constraint) Float {
	return C.cpRatchetJointGetRatchet(const_constraint)
}

// @C: `CP_EXPORT void cpRatchetJointSetRatchet(cpConstraint *constraint, cpFloat ratchet)`
fn C.cpRatchetJointSetRatchet(constraint &Constraint, ratchet Float)

// ratchet_joint_set_ratchet : Set the angular distance of each ratchet.
pub fn ratchet_joint_set_ratchet(constraint &Constraint, ratchet Float) {
	C.cpRatchetJointSetRatchet(constraint, ratchet)
}
