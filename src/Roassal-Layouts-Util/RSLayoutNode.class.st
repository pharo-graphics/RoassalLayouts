"
Class used for tests, for roassal use RSBox, RSComposite or RSCanvas
"
Class {
	#name : #RSLayoutNode,
	#superclass : #Object,
	#traits : 'RSTNode',
	#classTraits : 'RSTNode classTrait',
	#instVars : [
		'position',
		'extent',
		'children',
		'model',
		'connectedLines',
		'parent',
		'properties'
	],
	#category : #'Roassal-Layouts-Util'
}

{ #category : #'instance creation' }
RSLayoutNode class >> model: anObject [
	^ self new
		model: anObject;
		yourself
]

{ #category : #'instance creation' }
RSLayoutNode class >> models: aCollection [
	^ aCollection collect: [ :each | self model: each ].
]

{ #category : #'instance creation' }
RSLayoutNode class >> models: aCollection forEach: aBlock [
	| node |
	^ aCollection collect: [ :model |
		node := self new.
		node model: model.
		aBlock value: node value: model.
		node
		 ]
]

{ #category : #'instance creation' }
RSLayoutNode class >> text: aString [
	^ self new model: aString
]

{ #category : #'instance creation' }
RSLayoutNode class >> with: aGroupOfNodes [
	| group rectangle |
	group := RSGroup withAll: aGroupOfNodes.
	rectangle := group encompassingRectangle.
	^ self new
		addAll: aGroupOfNodes;
		position: rectangle floatCenter;
		extent: rectangle extent;
		yourself
		
]

{ #category : #adding }
RSLayoutNode >> add: aNode [
	children add: aNode.
	aNode parent: self
]

{ #category : #adding }
RSLayoutNode >> addAll: aCollection [
	aCollection do: [ :e | self add: e ]
]

{ #category : #accessing }
RSLayoutNode >> children [
	^ children
]

{ #category : #accessing }
RSLayoutNode >> color: aColor [
]

{ #category : #'accessing - lines' }
RSLayoutNode >> connectedLines [
	^ connectedLines
]

{ #category : #actions }
RSLayoutNode >> draggable [
]

{ #category : #accessing }
RSLayoutNode >> encompassingRectangle [
	^ Rectangle floatCenter: position extent: extent
]

{ #category : #accessing }
RSLayoutNode >> extent [
	^ extent
]

{ #category : #accessing }
RSLayoutNode >> extent: aPoint [
	extent := aPoint
]

{ #category : #testing }
RSLayoutNode >> hasLines [
	^ connectedLines notEmpty
]

{ #category : #accessing }
RSLayoutNode >> height [
	^ extent y
]

{ #category : #accessing }
RSLayoutNode >> height: aNumber [
	self extent: self width @ aNumber
]

{ #category : #lines }
RSLayoutNode >> incomingLines [
	"Return the list of incoming edges from the node"
	connectedLines ifNil: [ ^ #() ].
	^ connectedLines select: [ :e | e to == self ]
]

{ #category : #'accessing - nodes' }
RSLayoutNode >> incomingNodes [
	^ self incomingLines collect: #from
]

{ #category : #initialization }
RSLayoutNode >> initialize [
	super initialize.
	children := RSGroup new.
	connectedLines := OrderedCollection new.
	extent:= 10 asPoint.
	position := 0@0
]

{ #category : #testing }
RSLayoutNode >> isNode [
	^ true
]

{ #category : #accessing }
RSLayoutNode >> model [
	^ model
]

{ #category : #accessing }
RSLayoutNode >> model: anObject [
	model := anObject 
]

{ #category : #accessing }
RSLayoutNode >> nodes [
	^ self children select: [ :child | child isNode ]
]

{ #category : #'accessing - nodes' }
RSLayoutNode >> outgoingLines [
	"Return the list of outgoing edges from the node"
	connectedLines ifNil: [ ^ #() ].
	^ self connectedLines select: [ :e | e from == self ]
]

{ #category : #'accessing - nodes' }
RSLayoutNode >> outgoingNodes [
	^ self outgoingLines collect: #to
]

{ #category : #actions }
RSLayoutNode >> padding: aNumber [
	| margin rect |
	margin := aNumber asMargin.
	rect := children encompassingRectangle.
	rect := margin expandRectangle: rect.
	self extent: rect extent.
]

{ #category : #accessing }
RSLayoutNode >> parent [
	^ parent
]

{ #category : #accessing }
RSLayoutNode >> parent: aNode [
	parent := aNode
]

{ #category : #accessing }
RSLayoutNode >> position [
	^ position
]

{ #category : #accessing }
RSLayoutNode >> position: aPoint [
	position := aPoint
]

{ #category : #accessing }
RSLayoutNode >> propertyAt: key [
	properties ifNil: [ ^ nil ].
	^ properties at: key
]

{ #category : #accessing }
RSLayoutNode >> propertyAt: key ifAbsent: aBlock [
	properties ifNil: [ ^ aBlock value ].
	^ properties at: key ifAbsent: aBlock
]

{ #category : #accessing }
RSLayoutNode >> propertyAt: key put: anObject [
	properties ifNil: [ properties := Dictionary new ].
	^ properties at: key put: anObject
]

{ #category : #actions }
RSLayoutNode >> remove [
	parent ifNil: [ ^ self ].
	parent remove: self
]

{ #category : #removing }
RSLayoutNode >> remove: aNode [
	aNode parent: nil.
	self children remove: aNode
]

{ #category : #actions }
RSLayoutNode >> setAsFixed [
]

{ #category : #accessing }
RSLayoutNode >> size: aNumber [
	self extent: aNumber asPoint
]

{ #category : #actions }
RSLayoutNode >> translateBy: aPoint [
	position := position + aPoint
]

{ #category : #actions }
RSLayoutNode >> translateTo: aPoint [
	position := aPoint
]

{ #category : #accessing }
RSLayoutNode >> width [
	^ extent x
]

{ #category : #accessing }
RSLayoutNode >> width: aNumber [
	^ self extent: aNumber @ self height
]
