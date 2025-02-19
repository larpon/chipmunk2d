// Copyright(C) 2025 Lars Pontoppidan. All rights reserved.
// Use of this source code is governed by an MIT license
// that can be found in the LICENSE file.
module chipmunk2d

//
// cpMarch.h
//

// MarchSampleFunc : Function type used as a callback from the marching squares algorithm to sample an image function.
// MarchSampleFunc : It passes you the point to sample and your context pointer, and you return the density.
// @C: typedef cpFloat (*cpMarchSampleFunc)(cpVect point, void *data);
pub type MarchSampleFunc = fn (point Vect, data voidptr) Float

// MarchSegmentFunc : Function type used as a callback from the marching squares algorithm to output a line segment.
// MarchSegmentFunc : It passes you the two endpoints and your context pointer.
// @C: typedef void (*cpMarchSegmentFunc)(cpVect v0, cpVect v1, void *data);
pub type MarchSegmentFunc = fn (v0 Vect, v1 Vect, data voidptr)

// @C: `CP_EXPORT void cpMarchSoft( cpBB bb, unsigned long x_samples, unsigned long y_samples, cpFloat threshold, cpMarchSegmentFunc segment, void *segment_data, cpMarchSampleFunc sample, void *sample_data )`
fn C.cpMarchSoft(bb BB, x_samples u32, y_samples u32, threshold Float, segment MarchSegmentFunc, segment_data voidptr, sample MarchSampleFunc, sample_data voidptr)

// march_soft : Trace an anti-aliased contour of an image along a particular threshold.
// march_soft : The given number of samples will be taken and spread across the bounding box area using the sampling function and context.
// The segment function will be called for each segment detected that lies along the density contour for @c threshold.
pub fn march_soft(bb BB, x_samples u32, y_samples u32, threshold Float, segment MarchSegmentFunc, segment_data voidptr, sample MarchSampleFunc, sample_data voidptr) {
	C.cpMarchSoft(bb, x_samples, y_samples, threshold, segment, segment_data, sample,
		sample_data)
}

// @C: `CP_EXPORT void cpMarchHard( cpBB bb, unsigned long x_samples, unsigned long y_samples, cpFloat threshold, cpMarchSegmentFunc segment, void *segment_data, cpMarchSampleFunc sample, void *sample_data )`
fn C.cpMarchHard(bb BB, x_samples u32, y_samples u32, threshold Float, segment MarchSegmentFunc, segment_data voidptr, sample MarchSampleFunc, sample_data voidptr)

// march_hard : Trace an aliased curve of an image along a particular threshold.
// march_hard : The given number of samples will be taken and spread across the bounding box area using the sampling function and context.
// The segment function will be called for each segment detected that lies along the density contour for @c threshold.
pub fn march_hard(bb BB, x_samples u32, y_samples u32, threshold Float, segment MarchSegmentFunc, segment_data voidptr, sample MarchSampleFunc, sample_data voidptr) {
	C.cpMarchHard(bb, x_samples, y_samples, threshold, segment, segment_data, sample,
		sample_data)
}
