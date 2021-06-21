Class {
	#name : #Lazy3DCube,
	#superclass : #Object,
	#instVars : [
		'world'
	],
	#category : #'AdventOfCode-AOC2020'
}

{ #category : #initialization }
Lazy3DCube class >> default [
	"Returns a Lazy3DCube."
			
	| temp |
	temp := self new.
	temp world: Lazy3DSpace default.
	^temp
]

{ #category : #testing }
Lazy3DCube >> isActiveAtCoords: coords [

	"comment stating purpose of instance-side method"

	| temp |
	temp := world getAtCoord: coords.
	temp ifNil: [ ^false ] ifNotNil: [ ^temp ]
]

{ #category : #testing }
Lazy3DCube >> setAtCoord: coord withValue: val [
	"Sets a value to a coord. (Value should be a True or a False)"
	
	world setAtCoord: coord withValue: val.
]

{ #category : #accessing }
Lazy3DCube >> world [

	^ world
]

{ #category : #accessing }
Lazy3DCube >> world: anObject [

	world := anObject
]
