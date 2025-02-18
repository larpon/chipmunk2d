// Copyright(C) 2021 Lars Pontoppidan. All rights reserved.
module c

// Chipmunk2D v7.0.3 https://github.com/slembcke/Chipmunk2D @ 68d1f31

pub const used_import = 1 // TODO

pub const infinity = C.INFINITY

#flag -I @VMODROOT/Chipmunk2D/include
//#flag -L @VMODROOT/Chipmunk2D/src // libchipmunk.a / libchipmunk*.so
#flag -lm
//#flag -lpthread

// Link static:
//#flag -l:libchipmunk.a // gcc + clang
// Link dynamic:
//#flag -Wl,-R@VMODROOT/Chipmunk2D/src
//#flag -lchipmunk

#define CP_USE_CGTYPES 0

$if prod {
	#define NDEBUG 1
}

#include "chipmunk/chipmunk.h"
#include "chipmunk/chipmunk_structs.h"
#include "chipmunk/cpHastySpace.h"
#include "chipmunk/cpPolyline.h"
#include "chipmunk/cpMarch.h"
#include "chipmunk/chipmunk_unsafe.h"
#include "chipmunk/cpBB.h"

#flag @VMODROOT/Chipmunk2D/src/chipmunk.o
#flag @VMODROOT/Chipmunk2D/src/cpArbiter.o
#flag @VMODROOT/Chipmunk2D/src/cpArray.o
#flag @VMODROOT/Chipmunk2D/src/cpBBTree.o
#flag @VMODROOT/Chipmunk2D/src/cpBody.o
#flag @VMODROOT/Chipmunk2D/src/cpCollision.o
#flag @VMODROOT/Chipmunk2D/src/cpConstraint.o
#flag @VMODROOT/Chipmunk2D/src/cpDampedRotarySpring.o
#flag @VMODROOT/Chipmunk2D/src/cpDampedSpring.o
#flag @VMODROOT/Chipmunk2D/src/cpGearJoint.o
#flag @VMODROOT/Chipmunk2D/src/cpGrooveJoint.o
#flag @VMODROOT/Chipmunk2D/src/cpHashSet.o
#flag @VMODROOT/Chipmunk2D/src/cpHastySpace.o
#flag @VMODROOT/Chipmunk2D/src/cpMarch.o
#flag @VMODROOT/Chipmunk2D/src/cpPinJoint.o
#flag @VMODROOT/Chipmunk2D/src/cpPivotJoint.o
#flag @VMODROOT/Chipmunk2D/src/cpPolyShape.o
#flag @VMODROOT/Chipmunk2D/src/cpPolyline.o
#flag @VMODROOT/Chipmunk2D/src/cpRatchetJoint.o
#flag @VMODROOT/Chipmunk2D/src/cpRobust.o
#flag @VMODROOT/Chipmunk2D/src/cpRotaryLimitJoint.o
#flag @VMODROOT/Chipmunk2D/src/cpShape.o
#flag @VMODROOT/Chipmunk2D/src/cpSimpleMotor.o
#flag @VMODROOT/Chipmunk2D/src/cpSlideJoint.o
#flag @VMODROOT/Chipmunk2D/src/cpSpace.o
#flag @VMODROOT/Chipmunk2D/src/cpSpaceComponent.o
#flag @VMODROOT/Chipmunk2D/src/cpSpaceDebug.o
#flag @VMODROOT/Chipmunk2D/src/cpSpaceHash.o
#flag @VMODROOT/Chipmunk2D/src/cpSpaceQuery.o
#flag @VMODROOT/Chipmunk2D/src/cpSpaceStep.o
#flag @VMODROOT/Chipmunk2D/src/cpSpatialIndex.o
#flag @VMODROOT/Chipmunk2D/src/cpSweep1D.o
