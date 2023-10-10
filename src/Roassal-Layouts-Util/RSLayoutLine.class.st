"
Used int tests, for Roassal use RSLine
"
Class {
	#name : #RSLayoutLine,
	#superclass : #Object,
	#instVars : [
		'from',
		'to',
		'parent'
	],
	#category : #'Roassal-Layouts-Util'
}

{ #category : #accessing }
RSLayoutLine >> from [
	^ from
]

{ #category : #'instance creation' }
RSLayoutLine >> from: nodeA to: nodeB [
	nodeA connectedLines add: self.
	nodeB connectedLines add: self.
	from := nodeA.
	to := nodeB.
]

{ #category : #testing }
RSLayoutLine >> isNode [
	^ false
]

{ #category : #accessing }
RSLayoutLine >> parent [
	^ parent
]

{ #category : #accessing }
RSLayoutLine >> parent: aNode [
	parent := aNode
]

{ #category : #accessing }
RSLayoutLine >> to [
	^ to
]
