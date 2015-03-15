module.exports = (grunt) ->

	# configuration
	grunt.initConfig

		pkg:
			grunt.file.readJSON 'package.json'

		meta:
			banner:
				