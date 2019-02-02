as yet unclassified
buildSegments
	^ (1 to: coordinates size - 1) collect: [ :idx |
		LineSegment from: (self pointAt: idx) to: (self pointAt: idx + 1)  ].