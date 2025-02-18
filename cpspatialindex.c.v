// Copyright(C) 2025 Lars Pontoppidan. All rights reserved.
// Use of this source code is governed by an MIT license
// that can be found in the LICENSE file.
module chipmunk2d

//
// cpSpatialIndex.h
//

// SpatialIndexBBFunc : Spatial index bounding box callback function type.
// SpatialIndexBBFunc : The spatial index calls this function and passes you a pointer to an object you added
// when it needs to get the bounding box associated with that object.
// @C: typedef cpBB (*cpSpatialIndexBBFunc)(void *obj);
pub type SpatialIndexBBFunc = fn (obj voidptr) BB

// SpatialIndexIteratorFunc : Spatial index/object iterator callback function type.
// @C: typedef void (*cpSpatialIndexIteratorFunc)(void *obj, void *data);
pub type SpatialIndexIteratorFunc = fn (obj voidptr, data voidptr)

// SpatialIndexQueryFunc : Spatial query callback function type.
// @C: typedef cpCollisionID (*cpSpatialIndexQueryFunc)(void *obj1, void *obj2, cpCollisionID id, void *data);
pub type SpatialIndexQueryFunc = fn (obj1 voidptr, obj2 voidptr, id CollisionID, data voidptr) CollisionID

// SpatialIndexSegmentQueryFunc : Spatial segment query callback function type.
// @C: typedef cpFloat (*cpSpatialIndexSegmentQueryFunc)(void *obj1, void *obj2, void *data);
pub type SpatialIndexSegmentQueryFunc = fn (obj1 voidptr, obj2 voidptr, data voidptr) Float

@[noinit; typedef]
pub struct C.cpSpatialIndexClass {
	// NOTE: Opaque type
}

pub type SpatialIndexClass = C.cpSpatialIndexClass

@[noinit; typedef]
pub struct C.cpSpatialIndex {
	// NOTE: Opaque type
}

pub type SpatialIndex = C.cpSpatialIndex

// @private
//
@[typedef]
pub struct C.cpSpatialIndex {
pub mut:
	klass  &SpatialIndexClass = unsafe { nil }
	bbfunc C.cpSpatialIndexBBFunc
	// TODO 	staticIndex,* &SpatialIndex = unsafe { nil }
	dynamicIndex &SpatialIndex = unsafe { nil }
}

pub type SpatialIndex = C.cpSpatialIndex

@[noinit; typedef]
pub struct C.cpSpaceHash {
	// NOTE: Opaque type
}

pub type SpaceHash = C.cpSpaceHash

// @C: `CP_EXPORT cpSpaceHash* cpSpaceHashAlloc(void)`
fn C.cpSpaceHashAlloc() &SpaceHash

// space_hash_alloc : Allocate a spatial hash.
pub fn space_hash_alloc() &SpaceHash {
	return C.cpSpaceHashAlloc()
}

// @C: `CP_EXPORT cpSpatialIndex* cpSpaceHashInit(cpSpaceHash *hash, cpFloat celldim, int numcells, cpSpatialIndexBBFunc bbfunc, cpSpatialIndex *staticIndex)`
fn C.cpSpaceHashInit(hash &SpaceHash, celldim Float, numcells int, bbfunc C.cpSpatialIndexBBFunc, static_index &SpatialIndex) &SpatialIndex

// space_hash_init : Initialize a spatial hash.
pub fn space_hash_init(hash &SpaceHash, celldim Float, numcells int, bbfunc C.cpSpatialIndexBBFunc, static_index &SpatialIndex) &SpatialIndex {
	return C.cpSpaceHashInit(hash, celldim, numcells, bbfunc, static_index)
}

// @C: `CP_EXPORT cpSpatialIndex* cpSpaceHashNew(cpFloat celldim, int cells, cpSpatialIndexBBFunc bbfunc, cpSpatialIndex *staticIndex)`
fn C.cpSpaceHashNew(celldim Float, cells int, bbfunc C.cpSpatialIndexBBFunc, static_index &SpatialIndex) &SpatialIndex

// space_hash_new : Allocate and initialize a spatial hash.
pub fn space_hash_new(celldim Float, cells int, bbfunc C.cpSpatialIndexBBFunc, static_index &SpatialIndex) &SpatialIndex {
	return C.cpSpaceHashNew(celldim, cells, bbfunc, static_index)
}

// @C: `CP_EXPORT void cpSpaceHashResize(cpSpaceHash *hash, cpFloat celldim, int numcells)`
fn C.cpSpaceHashResize(hash &SpaceHash, celldim Float, numcells int)

// space_hash_resize : Change the cell dimensions and table size of the spatial hash to tune it.
// space_hash_resize : The cell dimensions should roughly match the average size of your objects
// and the table size should be ~10 larger than the number of objects inserted.
// Some trial and error is required to find the optimum numbers for efficiency.
pub fn space_hash_resize(hash &SpaceHash, celldim Float, numcells int) {
	C.cpSpaceHashResize(hash, celldim, numcells)
}

@[noinit; typedef]
pub struct C.cpBBTree {
	// NOTE: Opaque type
}

pub type BBTree = C.cpBBTree

// @C: `CP_EXPORT cpBBTree* cpBBTreeAlloc(void)`
fn C.cpBBTreeAlloc() &BBTree

// bb_tree_alloc : Allocate a bounding box tree.
pub fn bb_tree_alloc() &BBTree {
	return C.cpBBTreeAlloc()
}

// @C: `CP_EXPORT cpSpatialIndex* cpBBTreeInit(cpBBTree *tree, cpSpatialIndexBBFunc bbfunc, cpSpatialIndex *staticIndex)`
fn C.cpBBTreeInit(tree &BBTree, bbfunc C.cpSpatialIndexBBFunc, static_index &SpatialIndex) &SpatialIndex

// bb_tree_init : Initialize a bounding box tree.
pub fn bb_tree_init(tree &BBTree, bbfunc C.cpSpatialIndexBBFunc, static_index &SpatialIndex) &SpatialIndex {
	return C.cpBBTreeInit(tree, bbfunc, static_index)
}

// @C: `CP_EXPORT cpSpatialIndex* cpBBTreeNew(cpSpatialIndexBBFunc bbfunc, cpSpatialIndex *staticIndex)`
fn C.cpBBTreeNew(bbfunc C.cpSpatialIndexBBFunc, static_index &SpatialIndex) &SpatialIndex

// bb_tree_new : Allocate and initialize a bounding box tree.
pub fn bb_tree_new(bbfunc C.cpSpatialIndexBBFunc, static_index &SpatialIndex) &SpatialIndex {
	return C.cpBBTreeNew(bbfunc, static_index)
}

// @C: `CP_EXPORT void cpBBTreeOptimize(cpSpatialIndex *index)`
fn C.cpBBTreeOptimize(index &SpatialIndex)

// bb_tree_optimize : Perform a static top down optimization of the tree.
pub fn bb_tree_optimize(index &SpatialIndex) {
	C.cpBBTreeOptimize(index)
}

// BBTreeVelocityFunc : Bounding box tree velocity callback function.
// BBTreeVelocityFunc : This function should return an estimate for the object's velocity.
// @C: typedef cpVect (*cpBBTreeVelocityFunc)(void *obj);
pub type BBTreeVelocityFunc = fn (obj voidptr) Vect

// @C: `CP_EXPORT void cpBBTreeSetVelocityFunc(cpSpatialIndex *index, cpBBTreeVelocityFunc func)`
fn C.cpBBTreeSetVelocityFunc(index &SpatialIndex, func C.cpBBTreeVelocityFunc)

// bb_tree_set_velocity_func : Set the velocity function for the bounding box tree to enable temporal coherence.
pub fn bb_tree_set_velocity_func(index &SpatialIndex, func C.cpBBTreeVelocityFunc) {
	C.cpBBTreeSetVelocityFunc(index, func)
}

@[noinit; typedef]
pub struct C.cpSweep1D {
	// NOTE: Opaque type
}

pub type Sweep1D = C.cpSweep1D

// @C: `CP_EXPORT cpSweep1D* cpSweep1DAlloc(void)`
fn C.cpSweep1DAlloc() &Sweep1D

// sweep1_d_alloc : Allocate a 1D sort and sweep broadphase.
pub fn sweep1_d_alloc() &Sweep1D {
	return C.cpSweep1DAlloc()
}

// @C: `CP_EXPORT cpSpatialIndex* cpSweep1DInit(cpSweep1D *sweep, cpSpatialIndexBBFunc bbfunc, cpSpatialIndex *staticIndex)`
fn C.cpSweep1DInit(sweep &Sweep1D, bbfunc C.cpSpatialIndexBBFunc, static_index &SpatialIndex) &SpatialIndex

// sweep1_d_init : Initialize a 1D sort and sweep broadphase.
pub fn sweep1_d_init(sweep &Sweep1D, bbfunc C.cpSpatialIndexBBFunc, static_index &SpatialIndex) &SpatialIndex {
	return C.cpSweep1DInit(sweep, bbfunc, static_index)
}

// @C: `CP_EXPORT cpSpatialIndex* cpSweep1DNew(cpSpatialIndexBBFunc bbfunc, cpSpatialIndex *staticIndex)`
fn C.cpSweep1DNew(bbfunc C.cpSpatialIndexBBFunc, static_index &SpatialIndex) &SpatialIndex

// sweep1_d_new : Allocate and initialize a 1D sort and sweep broadphase.
pub fn sweep1_d_new(bbfunc C.cpSpatialIndexBBFunc, static_index &SpatialIndex) &SpatialIndex {
	return C.cpSweep1DNew(bbfunc, static_index)
}

// SpatialIndexDestroyImpl is currently undocumented
// @C: typedef void (*cpSpatialIndexDestroyImpl)(cpSpatialIndex *index);
pub type SpatialIndexDestroyImpl = fn (index &SpatialIndex)

// SpatialIndexCountImpl is currently undocumented
// @C: typedef int (*cpSpatialIndexCountImpl)(cpSpatialIndex *index);
pub type SpatialIndexCountImpl = fn (index &SpatialIndex) int

// SpatialIndexEachImpl is currently undocumented
// @C: typedef void (*cpSpatialIndexEachImpl)(cpSpatialIndex *index, cpSpatialIndexIteratorFunc func, void *data);
pub type SpatialIndexEachImpl = fn (index &SpatialIndex, func C.cpSpatialIndexIteratorFunc, data voidptr)

// SpatialIndexContainsImpl is currently undocumented
// @C: typedef cpBool (*cpSpatialIndexContainsImpl)(cpSpatialIndex *index, void *obj, cpHashValue hashid);
pub type SpatialIndexContainsImpl = fn (index &SpatialIndex, obj voidptr, hashid C.cpHashValue) bool // C.cpBool

// SpatialIndexInsertImpl is currently undocumented
// @C: typedef void (*cpSpatialIndexInsertImpl)(cpSpatialIndex *index, void *obj, cpHashValue hashid);
pub type SpatialIndexInsertImpl = fn (index &SpatialIndex, obj voidptr, hashid C.cpHashValue)

// SpatialIndexRemoveImpl is currently undocumented
// @C: typedef void (*cpSpatialIndexRemoveImpl)(cpSpatialIndex *index, void *obj, cpHashValue hashid);
pub type SpatialIndexRemoveImpl = fn (index &SpatialIndex, obj voidptr, hashid C.cpHashValue)

// SpatialIndexReindexImpl is currently undocumented
// @C: typedef void (*cpSpatialIndexReindexImpl)(cpSpatialIndex *index);
pub type SpatialIndexReindexImpl = fn (index &SpatialIndex)

// SpatialIndexReindexObjectImpl is currently undocumented
// @C: typedef void (*cpSpatialIndexReindexObjectImpl)(cpSpatialIndex *index, void *obj, cpHashValue hashid);
pub type SpatialIndexReindexObjectImpl = fn (index &SpatialIndex, obj voidptr, hashid C.cpHashValue)

// SpatialIndexReindexQueryImpl is currently undocumented
// @C: typedef void (*cpSpatialIndexReindexQueryImpl)(cpSpatialIndex *index, cpSpatialIndexQueryFunc func, void *data);
pub type SpatialIndexReindexQueryImpl = fn (index &SpatialIndex, func C.cpSpatialIndexQueryFunc, data voidptr)

// SpatialIndexQueryImpl is currently undocumented
// @C: typedef void (*cpSpatialIndexQueryImpl)(cpSpatialIndex *index, void *obj, cpBB bb, cpSpatialIndexQueryFunc func, void *data);
pub type SpatialIndexQueryImpl = fn (index &SpatialIndex, obj voidptr, bb BB, func C.cpSpatialIndexQueryFunc, data voidptr)

// SpatialIndexSegmentQueryImpl is currently undocumented
// @C: typedef void (*cpSpatialIndexSegmentQueryImpl)(cpSpatialIndex *index, void *obj, cpVect a, cpVect b, cpFloat t_exit, cpSpatialIndexSegmentQueryFunc func, void *data);
pub type SpatialIndexSegmentQueryImpl = fn (index &SpatialIndex, obj voidptr, a Vect, b Vect, t_exit Float, func C.cpSpatialIndexSegmentQueryFunc, data voidptr)

@[typedef]
pub struct C.cpSpatialIndexClass {
pub mut:
	destroy       C.cpSpatialIndexDestroyImpl
	count         C.cpSpatialIndexCountImpl
	each          C.cpSpatialIndexEachImpl
	contains      C.cpSpatialIndexContainsImpl
	insert        C.cpSpatialIndexInsertImpl
	remove        C.cpSpatialIndexRemoveImpl
	reindex       C.cpSpatialIndexReindexImpl
	reindexObject C.cpSpatialIndexReindexObjectImpl
	reindexQuery  C.cpSpatialIndexReindexQueryImpl
	query         C.cpSpatialIndexQueryImpl
	segmentQuery  C.cpSpatialIndexSegmentQueryImpl
}

pub type SpatialIndexClass = C.cpSpatialIndexClass

// @C: `CP_EXPORT void cpSpatialIndexFree(cpSpatialIndex *index)`
fn C.cpSpatialIndexFree(index &SpatialIndex)

// spatial_index_free : Destroy and free a spatial index.
pub fn spatial_index_free(index &SpatialIndex) {
	C.cpSpatialIndexFree(index)
}

// @C: `CP_EXPORT void cpSpatialIndexCollideStatic(cpSpatialIndex *dynamicIndex, cpSpatialIndex *staticIndex, cpSpatialIndexQueryFunc func, void *data)`
fn C.cpSpatialIndexCollideStatic(dynamic_index &SpatialIndex, static_index &SpatialIndex, func C.cpSpatialIndexQueryFunc, data voidptr)

// spatial_index_collide_static : Collide the objects in @c dynamicIndex against the objects in @c staticIndex using the query callback function.
pub fn spatial_index_collide_static(dynamic_index &SpatialIndex, static_index &SpatialIndex, func C.cpSpatialIndexQueryFunc, data voidptr) {
	C.cpSpatialIndexCollideStatic(dynamic_index, static_index, func, data)
}
