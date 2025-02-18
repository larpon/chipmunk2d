// Copyright(C) 2025 Lars Pontoppidan. All rights reserved.
// Use of this source code is governed by an MIT license
// that can be found in the LICENSE file.
module chipmunk2d

//
// cpSimpleMotor.h
//

@[noinit; typedef]
pub struct C.cpSimpleMotor {
	// NOTE: Opaque type
}

pub type SimpleMotor = C.cpSimpleMotor

// @C: `CP_EXPORT cpBool cpConstraintIsSimpleMotor(const cpConstraint *constraint)`
fn C.cpConstraintIsSimpleMotor(const_constraint &Constraint) bool // C.cpBool

// constraint_is_simple_motor : Check if a constraint is a damped rotary springs.
pub fn constraint_is_simple_motor(const_constraint &Constraint) bool { // bool // C.cpBool
	return C.cpConstraintIsSimpleMotor(const_constraint)
}

// @C: `CP_EXPORT cpSimpleMotor* cpSimpleMotorAlloc(void)`
fn C.cpSimpleMotorAlloc() &SimpleMotor

// simple_motor_alloc : Allocate a simple motor.
pub fn simple_motor_alloc() &SimpleMotor {
	return C.cpSimpleMotorAlloc()
}

// @C: `CP_EXPORT cpSimpleMotor* cpSimpleMotorInit(cpSimpleMotor *joint, cpBody *a, cpBody *b, cpFloat rate)`
fn C.cpSimpleMotorInit(joint &SimpleMotor, a &Body, b &Body, rate Float) &SimpleMotor

// simple_motor_init : initialize a simple motor.
pub fn simple_motor_init(joint &SimpleMotor, a &Body, b &Body, rate Float) &SimpleMotor {
	return C.cpSimpleMotorInit(joint, a, b, rate)
}

// @C: `CP_EXPORT cpConstraint* cpSimpleMotorNew(cpBody *a, cpBody *b, cpFloat rate)`
fn C.cpSimpleMotorNew(a &Body, b &Body, rate Float) &Constraint

// simple_motor_new : Allocate and initialize a simple motor.
pub fn simple_motor_new(a &Body, b &Body, rate Float) &Constraint {
	return C.cpSimpleMotorNew(a, b, rate)
}

// @C: `CP_EXPORT cpFloat cpSimpleMotorGetRate(const cpConstraint *constraint)`
fn C.cpSimpleMotorGetRate(const_constraint &Constraint) Float

// simple_motor_get_rate : Get the rate of the motor.
pub fn simple_motor_get_rate(const_constraint &Constraint) Float {
	return C.cpSimpleMotorGetRate(const_constraint)
}

// @C: `CP_EXPORT void cpSimpleMotorSetRate(cpConstraint *constraint, cpFloat rate)`
fn C.cpSimpleMotorSetRate(constraint &Constraint, rate Float)

// simple_motor_set_rate : Set the rate of the motor.
pub fn simple_motor_set_rate(constraint &Constraint, rate Float) {
	C.cpSimpleMotorSetRate(constraint, rate)
}
