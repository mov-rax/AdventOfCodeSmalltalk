"
This class is used in obtaining AdventOfCode data.

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #AdventOfCodeRunner,
	#superclass : #Object,
	#category : #'AdventOfCode-Runner'
}

{ #category : #initialization }
AdventOfCodeRunner class >> year: yearString puzzle: puzzleString [
	"Gets data for an advent of code puzzle"
	| file |
	file := (Path / 'home' / 'toast' / 'Documents' / 'AdventOfCode' / yearString / (puzzleString , '.txt')) asFileReference.
	^(file readStream upToEnd)
	
	
	
]
