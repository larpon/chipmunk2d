// Copyright(C) 2025 Lars Pontoppidan. All rights reserved.
// Use of this source code is governed by an MIT license
// that can be found in the LICENSE file.
module chipmunk2d

//
// cpGearJoint.h
//

// @C: `CP_EXPORT cpBool cpConstraintIsGearJoint(const cpConstraint *constraint)`
fn C.cpConstraintIsGearJoint(const_constraint &Constraint) bool // C.cpBool

// constraint_is_gear_joint : Check if a constraint is a damped rotary springs.
pub fn constraint_is_gear_joint(const_constraint &Constraint) bool { // bool // C.cpBool
	return C.cpConstraintIsGearJoint(const_constraint)
}

// @C: `CP_EXPORT cpGearJoint* cpGearJointAlloc(void)`
fn C.cpGearJointAlloc() &GearJoint

// gear_joint_alloc : Allocate a gear joint.
pub fn gear_joint_alloc() &GearJoint {
	return C.cpGearJointAlloc()
}

// @C: `CP_EXPORT cpGearJoint* cpGearJointInit(cpGearJoint *joint, cpBody *a, cpBody *b, cpFloat phase, cpFloat ratio)`
fn C.cpGearJointInit(joint &GearJoint, a &Body, b &Body, phase Float, ratio Float) &GearJoint

// gear_joint_init : Initialize a gear joint.
pub fn gear_joint_init(joint &GearJoint, a &Body, b &Body, phase Float, ratio Float) &GearJoint {
	return C.cpGearJointInit(joint, a, b, phase, ratio)
}

// @C: `CP_EXPORT cpConstraint* cpGearJointNew(cpBody *a, cpBody *b, cpFloat phase, cpFloat ratio)`
fn C.cpGearJointNew(a &Body, b &Body, phase Float, ratio Float) &Constraint

// gear_joint_new : Allocate and initialize a gear joint.
pub fn gear_joint_new(a &Body, b &Body, phase Float, ratio Float) &Constraint {
	return C.cpGearJointNew(a, b, phase, ratio)
}

// @C: `CP_EXPORT cpFloat cpGearJointGetPhase(const cpConstraint *constraint)`
fn C.cpGearJointGetPhase(const_constraint &Constraint) Float

// gear_joint_get_phase : Get the phase offset of the gears.
pub fn gear_joint_get_phase(const_constraint &Constraint) Float {
	return C.cpGearJointGetPhase(const_constraint)
}

// @C: `CP_EXPORT void cpGearJointSetPhase(cpConstraint *constraint, cpFloat phase)`
fn C.cpGearJointSetPhase(constraint &Constraint, phase Float)

// gear_joint_set_phase : Set the phase offset of the gears.
pub fn gear_joint_set_phase(constraint &Constraint, phase Float) {
	C.cpGearJointSetPhase(constraint, phase)
}

// @C: `CP_EXPORT cpFloat cpGearJointGetRatio(const cpConstraint *constraint)`
fn C.cpGearJointGetRatio(const_constraint &Constraint) Float

// gear_joint_get_ratio : Get the angular distance of each ratchet.
pub fn gear_joint_get_ratio(const_constraint &Constraint) Float {
	return C.cpGearJointGetRatio(const_constraint)
}

// @C: `CP_EXPORT void cpGearJointSetRatio(cpConstraint *constraint, cpFloat ratio)`
fn C.cpGearJointSetRatio(constraint &Constraint, ratio Float)

// gear_joint_set_ratio : Set the ratio of a gear joint.
pub fn gear_joint_set_ratio(constraint &Constraint, ratio Float) {
	C.cpGearJointSetRatio(constraint, ratio)
}
