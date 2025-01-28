"
RSOvalLayout is a layout algorithm that arranges shapes in an oval shape around a center point. The objects are evenly spaced considering the semi-major axis (a), semi-minor axis (b) and the number of shapes.
"
Class {
	#name : 'RSOvalLayout',
	#superclass : 'RSAbstractCircleLayout',
	#category : 'Roassal-Layouts-Circle',
	#package : 'Roassal-Layouts',
	#tag : 'Circle'
}

{ #category : 'hook' }
RSOvalLayout >> doExecute: shapes [

	| axisA axisB shapeIndex ellipsePoints item shapeCount |
	"Number of shapes"
	shapeCount := shapes size.
	shapeIndex := 1.

	"Semi-major axis a and semi-minor axis b"
	axisA := shapes first extent x * 0.2 * shapeCount.
	axisB := axisA / 2.
	ellipsePoints := self getEllipse: shapeCount a: axisA b: axisB.

	shapes do: [ :shape |
		item := ellipsePoints at: shapeIndex.
		shape position: (item at: 1) @ (item at: 2).
		shapeIndex := shapeIndex + 1 ].
]

{ #category : 'utilites' }
RSOvalLayout >> getEllipse: pointCount a: axisA b: axisB [
	| xCenter yCenter deltaT point ellipsePoints |
	
  "Assuming the center of the ellipse is at (0, 0)"
	xCenter := 0.
	yCenter := 0.
	ellipsePoints := OrderedCollection new.

	"Compute the step size for parameter t"
	deltaT := 2 * Float pi / pointCount.

	"Compute the ellipse points"
	1 to: pointCount do: [ :i |
		| t |
		t := i * deltaT.
		point := OrderedCollection new.
		
		"Plug semi-major axis a and semi-minor axis b into the formula"
		point add: xCenter + (axisA * t cos). "x"
		point add: yCenter + (axisB * t sin). "y"

		"Add to point to collection of all computed points"
		ellipsePoints add: point ].

	^ ellipsePoints
]
