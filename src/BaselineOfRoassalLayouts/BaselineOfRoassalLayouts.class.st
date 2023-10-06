"
Based on roassal
https://github.com/ObjectProfile/Roassal3
"
Class {
	#name : #BaselineOfRoassalLayouts,
	#superclass : #BaselineOf,
	#category : #BaselineOfRoassalLayouts
}

{ #category : #baselines }
BaselineOfRoassalLayouts >> baseline: spec [
	<baseline>
	spec for: #common do: [
		spec 
			package: 'Roassal-Layouts';
			package: 'Roassal-Layouts-Tests';
			package: 'Roassal-Layouts-Util'.
		spec group: 'default' with: 'Roassal-Layouts'
	].
]
