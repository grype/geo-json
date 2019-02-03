*GeoJSON-Tools
gtInspectorPreviewIn: composite
	<gtInspectorPresentationOrder: 10>
	| map coords |
	composite roassal2
		title: [ 'Map' translated ];
		initializeView: [ RTView new ];
		painting: [ :view :obj | 
			map := RTOSM new onload: [ self inform: 'Load done' ].
			view add: map element.
			coords := self gtCoordinates.
			view
				addAll:
					(coords
						collect: [ :aCoordinate | 
							((RTEllipse new
								width: 1;
								height: 1;
								scale: 0.01;
								color: (Color red alpha: 0.88)) elementOn: aCoordinate)
								@ RTPopup @ RTHighlightable
								translateTo: (map latLonToRoassal: aCoordinate first @ aCoordinate second) ]).
			view canvas camera
				translateTo: (map latLonToRoassal: coords first first @ coords first second).
			view canvas camera noInitializationWhenOpen.
			view canvas camera scale: 1000.
			view @ RTDraggableView @ RTZoomableView.
			RTEmptyViewContext setOnView: view ]