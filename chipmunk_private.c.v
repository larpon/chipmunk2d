// Copyright(C) 2025 Lars Pontoppidan. All rights reserved.
// Use of this source code is governed by an MIT license
// that can be found in the LICENSE file.
module chipmunk2d

//
// chipmunk_private.h
//

// TODO Non-numerical: #define CHIPMUNK_PRIVATE_H

// TODO Function: #define CP_HASH_COEF (3344921057ul)

// TODO Function: #define CP_HASH_PAIR(A, B) ((cpHashValue)(A)*CP_HASH_COEF ^ (cpHashValue)(B)*CP_HASH_COEF)

// TODO Non-numerical: #define MAGIC_EPSILON 1e-5

// HashSetEqlFunc is currently undocumented
// @C: typedef cpBool (*cpHashSetEqlFunc)(const void *ptr, const void *elt);
pub type HashSetEqlFunc = fn (const_ptr voidptr, const_elt voidptr) bool // C.cpBool

// HashSetTransFunc is currently undocumented
// @C: typedef void *(*cpHashSetTransFunc)(const void *ptr, void *data);
pub type HashSetTransFunc = fn (const_ptr voidptr, data voidptr) voidptr

// HashSetIteratorFunc is currently undocumented
// @C: typedef void (*cpHashSetIteratorFunc)(void *elt, void *data);
pub type HashSetIteratorFunc = fn (elt voidptr, data voidptr)

// HashSetFilterFunc is currently undocumented
// @C: typedef cpBool (*cpHashSetFilterFunc)(void *elt, void *data);
pub type HashSetFilterFunc = fn (elt voidptr, data voidptr) bool // C.cpBool

// TODO Non-numerical: #define cpAssertSpaceUnlocked(space) \

// TODO Non-numerical: #define CP_BODY_FOREACH_CONSTRAINT(bdy, var)\

// TODO Non-numerical: #define CP_BODY_FOREACH_ARBITER(bdy, var)\

// TODO Non-numerical: #define CP_BODY_FOREACH_SHAPE(body, var)\

// TODO Non-numerical: #define CP_BODY_FOREACH_COMPONENT(root, var)\
