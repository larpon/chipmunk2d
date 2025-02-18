// Copyright(C) 2025 Lars Pontoppidan. All rights reserved.
// Use of this source code is governed by an MIT license
// that can be found in the LICENSE file.
module chipmunk2d

//
// cpBB.h
//

// TODO Non-numerical: #define CHIPMUNK_BB_H

// Chipmunk's axis-aligned 2D bounding box type. (left, bottom, right, top)
//
@[typedef]
pub struct C.cpBB {
pub mut:
	l Float
	b Float
	r Float
	t Float
}

pub type BB = C.cpBB
