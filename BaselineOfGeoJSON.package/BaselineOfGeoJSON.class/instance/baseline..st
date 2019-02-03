baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec
				package: 'GeoJSON-Core' with: [ spec requires: #('NeoJSON') ];
				package: 'GeoJSON-Tools' with: [ spec requires: #('Roassal2') ];
				package: 'GeoJSON-Voyage'
					with:
						[ spec requires: #('GeoJSON-Core')	"leaving out voyage for now. needs to be loaded separately" ].
			spec
				baseline: 'NeoJSON'
				with: [ spec repository: 'github://svenvc/NeoJSON:master/repository' ].
			spec
				baseline: 'Roassal2'
				with: [ spec repository: 'github://ObjectProfile/Roassal2:master/src' ].
			spec group: 'default' with: #('GeoJSON-Core') ]