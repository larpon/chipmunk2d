// Copyright(C) 2025 Lars Pontoppidan. All rights reserved.
// Use of this source code is governed by an MIT license
// that can be found in the LICENSE file.
module chipmunk2d

//
// cpHastySpace.h
//

@[noinit; typedef]
pub struct C.cpHastySpace {
	// NOTE: Opaque type
}

pub type HastySpace = C.cpHastySpace

// @C: `CP_EXPORT cpSpace *cpHastySpaceNew(void)`
fn C.cpHastySpaceNew() &Space

// hasty_space_new : Create a new hasty space.
// hasty_space_new : On ARM platforms that support NEON, this will enable the vectorized solver.
// cpHastySpace also supports multiple threads, but runs single threaded by default for determinism.
pub fn hasty_space_new() &Space {
	return C.cpHastySpaceNew()
}

// @C: `CP_EXPORT void cpHastySpaceFree(cpSpace *space)`
fn C.cpHastySpaceFree(space &Space)

// hasty_space_free is currently undocumented
pub fn hasty_space_free(space &Space) {
	C.cpHastySpaceFree(space)
}

// @C: `CP_EXPORT void cpHastySpaceSetThreads(cpSpace *space, unsigned long threads)`
fn C.cpHastySpaceSetThreads(space &Space, threads u32)

// hasty_space_set_threads : Set the number of threads to use for the solver.
// hasty_space_set_threads : Currently Chipmunk is limited to 2 threads as using more generally provides very minimal performance gains.
// Passing 0 as the thread count on iOS or OS X will cause Chipmunk to automatically detect the number of threads it should use.
// On other platforms passing 0 for the thread count will set 1 thread.
pub fn hasty_space_set_threads(space &Space, threads u32) {
	C.cpHastySpaceSetThreads(space, threads)
}

// @C: `CP_EXPORT unsigned long cpHastySpaceGetThreads(cpSpace *space)`
fn C.cpHastySpaceGetThreads(space &Space) u32

// hasty_space_get_threads : Returns the number of threads the solver is using to run.
pub fn hasty_space_get_threads(space &Space) u32 {
	return C.cpHastySpaceGetThreads(space)
}

// @C: `CP_EXPORT void cpHastySpaceStep(cpSpace *space, cpFloat dt)`
fn C.cpHastySpaceStep(space &Space, dt Float)

// hasty_space_step : When stepping a hasty space, you must use this function.
pub fn hasty_space_step(space &Space, dt Float) {
	C.cpHastySpaceStep(space, dt)
}
