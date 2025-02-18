// Copyright(C) 2025 Lars Pontoppidan. All rights reserved.
// Use of this source code is governed by an MIT license
// that can be found in the LICENSE file.
module chipmunk2d

//
// chipmunk_structs.h
//

// TODO Non-numerical: #define CHIPMUNK_STRUCTS_H

@[typedef]
pub struct C.cpArray {
pub mut:
	num int
	max int
	// TODO 	*arr voidptr
}

pub type Array = C.cpArray

@[typedef]
pub struct C.cpBody {
pub mut:
	// Integration functions
	//
	velocity_func C.cpBodyVelocityFunc
	position_func C.cpBodyPositionFunc
	// mass and it's inverse
	//
	m     Float
	m_inv Float
	// moment of inertia and it's inverse
	//
	i     Float
	i_inv Float
	// center of gravity
	//
	cog Vect
	// position, velocity, force
	//
	p Vect
	v Vect
	f Vect
	// Angle, angular velocity, torque (radians)
	//
	a         Float
	w         Float
	t         Float
	transform C.cpTransform
	userData  DataPointer
	// "pseudo-velocities" used for eliminating overlap.
	// Erin Catto has some papers that talk about what these are.
	//
	v_bias         Vect
	w_bias         Float
	space          &Space      = unsafe { nil }
	shapeList      &Shape      = unsafe { nil }
	arbiterList    &Arbiter    = unsafe { nil }
	constraintList &Constraint = unsafe { nil }
}

// TODO// struct {
//  	;	cpBody* root; cpBody* next; cpFloat idleTime; } sleeping
pub type Body = C.cpBody

@[typedef]
pub struct C.cpArbiter {
pub mut:
	e          Float
	u          Float
	surface_vr Vect
	data       DataPointer
	// TODO 	cpShape* C.
	// TODO 	a,* C.b C.
	// TODO 	body_a,* &Body = unsafe { nil }
	body_b &Body = unsafe { nil }

	// TODO//
	// TODO//
	// TODO//
	count int

	// TODO// struct cpContact*; contacts
	n Vect
	// TODO 	// Regular, wildcard A and wildcard B collision handlers.
	//
	// handler,* &CollisionHandler = unsafe { nil }
	// TODO 	handlerA,* &CollisionHandler = unsafe { nil }
	// handlerB &CollisionHandler = unsafe { nil }
	swapped bool // C.cpBool
	stamp   Timestamp
	// cpArbiterState C.enum // state
}

pub type Arbiter = C.cpArbiter

// ShapeType is C.cpShapeType
pub enum ShapeType {
	circle_shape  = C.CP_CIRCLE_SHAPE
	segment_shape = C.CP_SEGMENT_SHAPE
	poly_shape    = C.CP_POLY_SHAPE
	num_shapes    = C.CP_NUM_SHAPES
}

// ShapeCacheDataImpl is currently undocumented
// @C: typedef cpBB (*cpShapeCacheDataImpl)(cpShape *shape, cpTransform transform);
pub type ShapeCacheDataImpl = fn (shape &Shape, transform C.cpTransform) BB

// ShapeDestroyImpl is currently undocumented
// @C: typedef void (*cpShapeDestroyImpl)(cpShape *shape);
pub type ShapeDestroyImpl = fn (shape &Shape)

// ShapePointQueryImpl is currently undocumented
// @C: typedef void (*cpShapePointQueryImpl)(const cpShape *shape, cpVect p, cpPointQueryInfo *info);
pub type ShapePointQueryImpl = fn (const_shape &Shape, p Vect, info &PointQueryInfo)

// ShapeSegmentQueryImpl is currently undocumented
// @C: typedef void (*cpShapeSegmentQueryImpl)(const cpShape *shape, cpVect a, cpVect b, cpFloat radius, cpSegmentQueryInfo *info);
pub type ShapeSegmentQueryImpl = fn (const_shape &Shape, a Vect, b Vect, radius Float, info &SegmentQueryInfo)

@[noinit; typedef]
pub struct C.cpShapeClass {
	// NOTE: Opaque type
}

pub type ShapeClass = C.cpShapeClass

@[typedef]
pub struct C.cpShapeClass {
pub mut:
	type         ShapeType
	cacheData    C.cpShapeCacheDataImpl
	destroy      C.cpShapeDestroyImpl
	pointQuery   C.cpShapePointQueryImpl
	segmentQuery C.cpShapeSegmentQueryImpl
}

pub type ShapeClass = C.cpShapeClass

@[typedef]
pub struct C.cpShape {
pub mut:
	klass &ShapeClass = unsafe { nil }
	space &Space      = unsafe { nil }
	body  &Body       = unsafe { nil }

	// TODO// struct cpShapeMassInfo; massInfo
	bb       BB
	sensor   bool // C.cpBool
	e        Float
	u        Float
	surfaceV Vect
	userData DataPointer
	type     CollisionType
	filter   ShapeFilter
	next     &Shape = unsafe { nil }
	prev     &Shape = unsafe { nil }
	hashid   C.cpHashValue
}

pub type Shape = C.cpShape

@[typedef]
pub struct C.cpCircleShape {
pub mut:
	shape Shape
	c     Vect
	tc    Vect
	r     Float
}

pub type CircleShape = C.cpCircleShape

@[typedef]
pub struct C.cpSegmentShape {
pub mut:
	shape     Shape
	a         Vect
	b         Vect
	n         Vect
	ta        Vect
	tb        Vect
	tn        Vect
	r         Float
	a_tangent Vect
	b_tangent Vect
}

pub type SegmentShape = C.cpSegmentShape

pub const poly_shape_inline_alloc = C.CP_POLY_SHAPE_INLINE_ALLOC // 6

@[typedef]
pub struct C.cpPolyShape {
pub mut:
	shape Shape
	r     Float
	count int
}

// TODO// struct cpSplittingPlane*; planes
// TODO// struct cpSplittingPlane; _planes[2*CP_POLY_SHAPE_INLINE_ALLOC]
pub type PolyShape = C.cpPolyShape

// ConstraintPreStepImpl is currently undocumented
// @C: typedef void (*cpConstraintPreStepImpl)(cpConstraint *constraint, cpFloat dt);
pub type ConstraintPreStepImpl = fn (constraint &Constraint, dt Float)

// ConstraintApplyCachedImpulseImpl is currently undocumented
// @C: typedef void (*cpConstraintApplyCachedImpulseImpl)(cpConstraint *constraint, cpFloat dt_coef);
pub type ConstraintApplyCachedImpulseImpl = fn (constraint &Constraint, dt_coef Float)

// ConstraintApplyImpulseImpl is currently undocumented
// @C: typedef void (*cpConstraintApplyImpulseImpl)(cpConstraint *constraint, cpFloat dt);
pub type ConstraintApplyImpulseImpl = fn (constraint &Constraint, dt Float)

// ConstraintGetImpulseImpl is currently undocumented
// @C: typedef cpFloat (*cpConstraintGetImpulseImpl)(cpConstraint *constraint);
pub type ConstraintGetImpulseImpl = fn (constraint &Constraint) Float

@[typedef]
pub struct C.cpConstraintClass {
pub mut:
	preStep            C.cpConstraintPreStepImpl
	applyCachedImpulse C.cpConstraintApplyCachedImpulseImpl
	applyImpulse       C.cpConstraintApplyImpulseImpl
	getImpulse         C.cpConstraintGetImpulseImpl
}

pub type ConstraintClass = C.cpConstraintClass

@[typedef]
pub struct C.cpConstraint {
pub mut:
	klass &ConstraintClass = unsafe { nil }
	space &Space           = unsafe { nil }
	// TODO 	a,* &Body = unsafe { nil }
	b &Body = unsafe { nil }
	// TODO 	next_a,* &Constraint = unsafe { nil }
	next_b        &Constraint = unsafe { nil }
	maxForce      Float
	errorBias     Float
	maxBias       Float
	collideBodies bool // C.cpBool
	preSolve      C.cpConstraintPreSolveFunc
	postSolve     C.cpConstraintPostSolveFunc
	userData      DataPointer
}

pub type Constraint = C.cpConstraint

@[typedef]
pub struct C.cpPinJoint {
pub mut:
	constraint Constraint
	anchorA    Vect
	anchorB    Vect
	dist       Float
	r1         Vect
	r2         Vect
	n          Vect
	nMass      Float
	jnAcc      Float
	bias       Float
}

pub type PinJoint = C.cpPinJoint

@[typedef]
pub struct C.cpSlideJoint {
pub mut:
	constraint Constraint
	anchorA    Vect
	anchorB    Vect
	min        Float
	max        Float
	r1         Vect
	r2         Vect
	n          Vect
	nMass      Float
	jnAcc      Float
	bias       Float
}

pub type SlideJoint = C.cpSlideJoint

@[typedef]
pub struct C.cpPivotJoint {
pub mut:
	constraint Constraint
	anchorA    Vect
	anchorB    Vect
	r1         Vect
	r2         Vect
	k          Mat2x2
	jAcc       Vect
	bias       Vect
}

pub type PivotJoint = C.cpPivotJoint

@[typedef]
pub struct C.cpGrooveJoint {
pub mut:
	constraint Constraint
	grv_n      Vect
	grv_a      Vect
	grv_b      Vect
	anchorB    Vect
	grv_tn     Vect
	clamp      Float
	r1         Vect
	r2         Vect
	k          Mat2x2
	jAcc       Vect
	bias       Vect
}

pub type GrooveJoint = C.cpGrooveJoint

@[typedef]
pub struct C.cpDampedSpring {
pub mut:
	constraint      Constraint
	anchorA         Vect
	anchorB         Vect
	restLength      Float
	stiffness       Float
	damping         Float
	springForceFunc C.cpDampedSpringForceFunc
	target_vrn      Float
	v_coef          Float
	r1              Vect
	r2              Vect
	nMass           Float
	n               Vect
	jAcc            Float
}

pub type DampedSpring = C.cpDampedSpring

@[typedef]
pub struct C.cpDampedRotarySpring {
pub mut:
	constraint       Constraint
	restAngle        Float
	stiffness        Float
	damping          Float
	springTorqueFunc C.cpDampedRotarySpringTorqueFunc
	target_wrn       Float
	w_coef           Float
	iSum             Float
	jAcc             Float
}

pub type DampedRotarySpring = C.cpDampedRotarySpring

@[typedef]
pub struct C.cpRotaryLimitJoint {
pub mut:
	constraint Constraint
	min        Float
	max        Float
	iSum       Float
	bias       Float
	jAcc       Float
}

pub type RotaryLimitJoint = C.cpRotaryLimitJoint

@[typedef]
pub struct C.cpRatchetJoint {
pub mut:
	constraint Constraint
	angle      Float
	phase      Float
	ratchet    Float
	iSum       Float
	bias       Float
	jAcc       Float
}

pub type RatchetJoint = C.cpRatchetJoint

@[typedef]
pub struct C.cpGearJoint {
pub mut:
	constraint Constraint
	phase      Float
	ratio      Float
	ratio_inv  Float
	iSum       Float
	bias       Float
	jAcc       Float
}

pub type GearJoint = C.cpGearJoint

@[noinit; typedef]
pub struct C.cpContactBufferHeader {
	// NOTE: Opaque type
}

pub type ContactBufferHeader = C.cpContactBufferHeader

// SpaceArbiterApplyImpulseFunc is currently undocumented
// @C: typedef void (*cpSpaceArbiterApplyImpulseFunc)(cpArbiter *arb);
pub type SpaceArbiterApplyImpulseFunc = fn (arb &Arbiter)

@[typedef]
pub struct C.cpSpace {
pub mut:
	iterations           int
	gravity              Vect
	damping              Float
	idleSpeedThreshold   Float
	sleepTimeThreshold   Float
	collisionSlop        Float
	collisionBias        Float
	collisionPersistence Timestamp
	userData             DataPointer
	stamp                Timestamp
	curr_dt              Float
	dynamicBodies        &Array = unsafe { nil }
	staticBodies         &Array = unsafe { nil }
	rousedBodies         &Array = unsafe { nil }
	sleepingComponents   &Array = unsafe { nil }
	shapeIDCounter       C.cpHashValue
	staticShapes         &SpatialIndex        = unsafe { nil }
	dynamicShapes        &SpatialIndex        = unsafe { nil }
	constraints          &Array               = unsafe { nil }
	arbiters             &Array               = unsafe { nil }
	contactBuffersHead   &ContactBufferHeader = unsafe { nil }
	cachedArbiters       &HashSet             = unsafe { nil }
	pooledArbiters       &Array               = unsafe { nil }
	allocatedBuffers     &Array               = unsafe { nil }
	int                  u32  // locked
	usesWildcards        bool // C.cpBool
	collisionHandlers    &HashSet = unsafe { nil }
	defaultHandler       CollisionHandler
	skipPostStep         bool // C.cpBool
	postStepCallbacks    &Array = unsafe { nil }
	staticBody           &Body  = unsafe { nil }
	_staticBody          Body
}

pub type Space = C.cpSpace

@[typedef]
pub struct C.cpPostStepCallback {
pub mut:
	func C.cpPostStepFunc
	key  voidptr
	data voidptr
}

pub type PostStepCallback = C.cpPostStepCallback
