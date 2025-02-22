// Copyright(C) 2021 Lars Pontoppidan. All rights reserved.
// Use of this source code is governed by an MIT license
// that can be found in the LICENSE file.
module c

pub const infinity = C.INFINITY

#flag -I @VMODROOT/c/Chipmunk2D/include
// #flag -L @VMODROOT/Chipmunk2D/src // libchipmunk.a / libchipmunk*.so
#flag -lm
// #flag -lpthread

// Link static:
// #flag -l:libchipmunk.a // gcc + clang
// Link dynamic:
// #flag -Wl,-R@VMODROOT/Chipmunk2D/src
// #flag -lchipmunk

#define CP_USE_CGTYPES 0

$if prod {
	#define NDEBUG 1
}

#include "@VMODROOT/c/Chipmunk2D/include/chipmunk/chipmunk.h"
#include "@VMODROOT/c/Chipmunk2D/include/chipmunk/chipmunk_ffi.h"
#include "@VMODROOT/c/Chipmunk2D/include/chipmunk/chipmunk_private.h"
#include "@VMODROOT/c/Chipmunk2D/include/chipmunk/chipmunk_structs.h"
#include "@VMODROOT/c/Chipmunk2D/include/chipmunk/chipmunk_types.h"
#include "@VMODROOT/c/Chipmunk2D/include/chipmunk/chipmunk_unsafe.h"
//
// #include "@VMODROOT/c/Chipmunk2D/include/chipmunk/cpArbiter.h"
#include "@VMODROOT/c/Chipmunk2D/include/chipmunk/cpBB.h"
// #include "@VMODROOT/c/Chipmunk2D/include/chipmunk/cpBody.h"
#include "@VMODROOT/c/Chipmunk2D/include/chipmunk/cpConstraint.h"
#include "@VMODROOT/c/Chipmunk2D/include/chipmunk/cpDampedRotarySpring.h"
#include "@VMODROOT/c/Chipmunk2D/include/chipmunk/cpDampedSpring.h"
#include "@VMODROOT/c/Chipmunk2D/include/chipmunk/cpGearJoint.h"
#include "@VMODROOT/c/Chipmunk2D/include/chipmunk/cpGrooveJoint.h"
#include "@VMODROOT/c/Chipmunk2D/include/chipmunk/cpHastySpace.h"
#include "@VMODROOT/c/Chipmunk2D/include/chipmunk/cpMarch.h"
#include "@VMODROOT/c/Chipmunk2D/include/chipmunk/cpPinJoint.h"
#include "@VMODROOT/c/Chipmunk2D/include/chipmunk/cpPivotJoint.h"
#include "@VMODROOT/c/Chipmunk2D/include/chipmunk/cpPolyline.h"
#include "@VMODROOT/c/Chipmunk2D/include/chipmunk/cpPolyShape.h"
#include "@VMODROOT/c/Chipmunk2D/include/chipmunk/cpRatchetJoint.h"
#include "@VMODROOT/c/Chipmunk2D/include/chipmunk/cpRobust.h"
#include "@VMODROOT/c/Chipmunk2D/include/chipmunk/cpRotaryLimitJoint.h"
// #include "@VMODROOT/c/Chipmunk2D/include/chipmunk/cpShape.h"
#include "@VMODROOT/c/Chipmunk2D/include/chipmunk/cpSimpleMotor.h"
#include "@VMODROOT/c/Chipmunk2D/include/chipmunk/cpSlideJoint.h"
// #include "@VMODROOT/c/Chipmunk2D/include/chipmunk/cpSpace.h"
// #include "@VMODROOT/c/Chipmunk2D/include/chipmunk/cpSpatialIndex.h"
#include "@VMODROOT/c/Chipmunk2D/include/chipmunk/cpTransform.h"
#include "@VMODROOT/c/Chipmunk2D/include/chipmunk/cpVect.h"

#flag @VMODROOT/c/Chipmunk2D/src/chipmunk.o
#flag @VMODROOT/c/Chipmunk2D/src/cpArbiter.o
#flag @VMODROOT/c/Chipmunk2D/src/cpArray.o
#flag @VMODROOT/c/Chipmunk2D/src/cpBBTree.o
#flag @VMODROOT/c/Chipmunk2D/src/cpBody.o
#flag @VMODROOT/c/Chipmunk2D/src/cpCollision.o
#flag @VMODROOT/c/Chipmunk2D/src/cpConstraint.o
#flag @VMODROOT/c/Chipmunk2D/src/cpDampedRotarySpring.o
#flag @VMODROOT/c/Chipmunk2D/src/cpDampedSpring.o
#flag @VMODROOT/c/Chipmunk2D/src/cpGearJoint.o
#flag @VMODROOT/c/Chipmunk2D/src/cpGrooveJoint.o
#flag @VMODROOT/c/Chipmunk2D/src/cpHashSet.o
#flag @VMODROOT/c/Chipmunk2D/src/cpHastySpace.o
#flag @VMODROOT/c/Chipmunk2D/src/cpMarch.o
#flag @VMODROOT/c/Chipmunk2D/src/cpPinJoint.o
#flag @VMODROOT/c/Chipmunk2D/src/cpPivotJoint.o
#flag @VMODROOT/c/Chipmunk2D/src/cpPolyShape.o
#flag @VMODROOT/c/Chipmunk2D/src/cpPolyline.o
#flag @VMODROOT/c/Chipmunk2D/src/cpRatchetJoint.o
#flag @VMODROOT/c/Chipmunk2D/src/cpRobust.o
#flag @VMODROOT/c/Chipmunk2D/src/cpRotaryLimitJoint.o
#flag @VMODROOT/c/Chipmunk2D/src/cpShape.o
#flag @VMODROOT/c/Chipmunk2D/src/cpSimpleMotor.o
#flag @VMODROOT/c/Chipmunk2D/src/cpSlideJoint.o
#flag @VMODROOT/c/Chipmunk2D/src/cpSpace.o
#flag @VMODROOT/c/Chipmunk2D/src/cpSpaceComponent.o
#flag @VMODROOT/c/Chipmunk2D/src/cpSpaceDebug.o
#flag @VMODROOT/c/Chipmunk2D/src/cpSpaceHash.o
#flag @VMODROOT/c/Chipmunk2D/src/cpSpaceQuery.o
#flag @VMODROOT/c/Chipmunk2D/src/cpSpaceStep.o
#flag @VMODROOT/c/Chipmunk2D/src/cpSpatialIndex.o
#flag @VMODROOT/c/Chipmunk2D/src/cpSweep1D.o
