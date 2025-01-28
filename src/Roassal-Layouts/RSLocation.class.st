"
<keyClass>
`RSLocation` locates shapes with respect to other shapes. Shapes can be positioned in a sticky fashion or not. Being sticky means whether the base shapes ""drag"" the sitcky shapes when dragged. `RSLocation` iteratively builds constraint for moving and positioning a shape on top of another one.

*Responsibility*: locate permanently or not some shapes with respect to other shapes.

*Collaborators*: closely interact with `RSShape`, `RSExtentChangedEvent`, and `RSPositionChangedEvent`

*Variables*:
- `offset`: offset between the positioned shape and the base shape
- `orientation`: a value that could be -1, 0, 1 indicating the orientation of the location
- `direction`: a point indicating the direction of the lcoation
"
Class {
	#name : 'RSLocation',
	#superclass : 'Object',
	#instVars : [
		'offset',
		'orientation',
		'direction',
		'fixedX',
		'fixedY'
	],
	#category : 'Roassal-Layouts-PositionAndResize',
	#package : 'Roassal-Layouts',
	#tag : 'PositionAndResize'
}

{ #category : 'public' }
RSLocation class >> move: aShapeOrAGroup1 above: aShapeOrAGroup2 [
	self new above; move: aShapeOrAGroup1 on: aShapeOrAGroup2
]

{ #category : 'public' }
RSLocation class >> move: aShapeOrAGroup1 below: aShapeOrAGroup2 [
	self new below; move: aShapeOrAGroup1 on: aShapeOrAGroup2
]

{ #category : 'public' }
RSLocation class >> move: aShapeOrAGroup1 onTheLeftOf: aShapeOrAGroup2 [
	self new left; outer; move: aShapeOrAGroup1 on: aShapeOrAGroup2
]

{ #category : 'public' }
RSLocation class >> move: aShapeOrAGroup1 onTheRightOf: aShapeOrAGroup2 [
	self new right; outer; move: aShapeOrAGroup1 on: aShapeOrAGroup2
]

{ #category : 'public - positioning shorcuts' }
RSLocation >> above [
	self top; outer
]

{ #category : 'public - positioning shorcuts' }
RSLocation >> below [
	self bottom; outer
]

{ #category : 'public - modifiers' }
RSLocation >> border [
	self orientation: 0@0
]

{ #category : 'public - modifiers' }
RSLocation >> borderX [
	self orientation: 0 @ orientation y
]

{ #category : 'public - modifiers' }
RSLocation >> borderY [
	self orientation: orientation x @ 0
]

{ #category : 'public - positioning' }
RSLocation >> bottom [
	"Locate the shape at the bottom of the base shape.
For example:
```Smalltalk
c := RSCanvas new.

g := RSGroup new.
g add: (RSLabel new text: 'Base shape').
baseShape := g asShape adjustToChildren.
baseShape color: #lightBlue.
baseShape @ RSDraggable.
c add: baseShape.

redShape := RSBox new extent: 60 @ 30; color: #red.
c add: redShape.

RSLocation new
	bottom;
	outer;
	right;
	move: redShape on: baseShape.
c
```
	"
	fixedY := #bottom.
	direction := direction x @ -1
]

{ #category : 'public - positioning' }
RSLocation >> center [
	fixedX := [ :rec | rec floatCenter x ].
	direction := 0 @ direction y
]

{ #category : 'private' }
RSLocation >> computePosition: movableShape on: fixedShape [
	^ movableShape extent / 2 * orientation * direction + (self parentPosition: fixedShape) + offset
]

{ #category : 'initialization' }
RSLocation >> initialize [
	super initialize.
	direction := 0 @ 0.
	self
		offset: 0;
		inner;
		middle;
		center
]

{ #category : 'public - modifiers' }
RSLocation >> inner [
	self orientation: 1@1
]

{ #category : 'public - modifiers' }
RSLocation >> innerX [
	self orientation: 1 @ orientation y
]

{ #category : 'public - modifiers' }
RSLocation >> innerY [
	self orientation: orientation x @ 1
]

{ #category : 'public - positioning shorcuts' }
RSLocation >> insideCornerLeft [
	self orientation: 1 @ -1; top; left
]

{ #category : 'public - positioning shorcuts' }
RSLocation >> insideCornerRight [
	self orientation: 1 @ -1; top; right
]

{ #category : 'public - positioning' }
RSLocation >> left [
	"Locate the shape on the left of the base shape.
For example:
```Smalltalk
c := RSCanvas new.

g := RSGroup new.
g add: (RSLabel new text: 'Base shape').
baseShape := g asShape adjustToChildren.
baseShape color: #lightBlue.
baseShape @ RSDraggable.
c add: baseShape.

redShape := RSBox new extent: 60 @ 30; color: #red.
c add: redShape.

RSLocation new
	above;
	left;
	move: redShape on: baseShape.
c
```"
	fixedX := #left.
	direction := 1@ direction y
]

{ #category : 'public - positioning' }
RSLocation >> middle [
	"Locate the shape in the middle of the base shape.
For example:
```Smalltalk
c := RSCanvas new.

g := RSGroup new.
g add: (RSLabel new text: 'Base shape').
baseShape := g asShape adjustToChildren.
baseShape color: #lightBlue.
baseShape @ RSDraggable.
c add: baseShape.

redShape := RSBox new extent: 60 @ 30; color: #red.
c add: redShape.

RSLocation new
	middle;
	above;
	move: redShape on: baseShape.
c
```
	"
	fixedY := [ :r | r floatCenter y ].
	direction := direction x @ 0
]

{ #category : 'public - executing' }
RSLocation >> move: movableShape on: baseShape [
	"Utility method"
	movableShape translateTo: (self computePosition: movableShape on: baseShape)
]

{ #category : 'public - modifiers' }
RSLocation >> offset [
	^ offset
]

{ #category : 'public - modifiers' }
RSLocation >> offset: aNumber [
	"Let an offset between the positioned shape and the base shape.

For example
```Smalltalk
c := RSCanvas new.

g := RSGroup new.
g add: (RSLabel new text: 'Base shape').
baseShape := g asShape adjustToChildren.
baseShape color: #lightBlue.
baseShape @ RSDraggable.
c add: baseShape.

redShape := RSBox new extent: 60 @ 30; color: #red.
c add: redShape.

RSLocation new
	bottom;
	outer;
	right;
	offset: 20;
	move: redShape on: baseShape.
c
```"
	offset := aNumber asPoint
]

{ #category : 'public - modifiers' }
RSLocation >> orientation: aPoint [
	"check users of method orientation"
	orientation := aPoint
]

{ #category : 'public - modifiers' }
RSLocation >> outer [
	self orientation: -1 @ -1
]

{ #category : 'public - modifiers' }
RSLocation >> outerX [
	self orientation: -1 @ orientation y
]

{ #category : 'public - modifiers' }
RSLocation >> outerY [
	self orientation: orientation x @ -1
]

{ #category : 'private' }
RSLocation >> parentPosition: fixedShape [
	| rec |
	rec := fixedShape.
	rec isRectangle ifFalse:  [ rec := rec encompassingRectangle ] .
	^ (fixedX value: rec)@ (fixedY value: rec)
]

{ #category : 'public - positioning' }
RSLocation >> right [
	"Locate the shape on the right of the base shape.
For example:
```Smalltalk
c := RSCanvas new.

g := RSGroup new.
g add: (RSLabel new text: 'Base shape').
baseShape := g asShape adjustToChildren.
baseShape color: #lightBlue.
baseShape @ RSDraggable.
c add: baseShape.

redShape := RSBox new extent: 60 @ 30; color: #red.
c add: redShape.

RSLocation new
	above;
	right;
	move: redShape on: baseShape.
c
```"
	fixedX := #right.
	direction := -1 @ direction y
]

{ #category : 'public - positioning' }
RSLocation >> top [
	fixedY := #top.
	direction := direction x @ 1
]
