Class {
	#name : #AdventOfCodeTester,
	#superclass : #TestCase,
	#category : #'AdventOfCode-Tests'
}

{ #category : #accessing }
AdventOfCodeTester >> testPassportVerifier [
	"Tests things that do stuff."
			
	self assert: (PassportVerifier checkBirthYear: 'byr:2003') equals: false.
	self assert: (PassportVerifier checkIssueYear: 'iyr:2020') equals: true.
	self assert: (PassportVerifier checkExpirationYear: 'eyr:2030') equals: true.
	self assert: (PassportVerifier checkHeight: 'hgt:65in') equals: true.
	self assert: (PassportVerifier checkHairColor: 'hcl:#00000G') equals: false.
	self assert: (PassportVerifier checkEyeColor: 'ecl:blu') equals: true.
	self assert: (PassportVerifier checkPassportID: 'pid:000000001') equals: true.
	
]
