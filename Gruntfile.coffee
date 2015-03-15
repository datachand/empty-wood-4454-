module.exports = (grunt) ->

	# configuration
	grunt.initConfig

		pkg:
			grunt.file.readJSON 'package.json'

		meta:
			banner: '/* <%= pkg.name %> - v<%= pkg.version %> - <%= grunt.template.today("yyyy-mm-dd") %> */'

		# grunt connect
		connect:
			server:
				options:
					base: './public'
					port: 12345
					host: '*'
					keepalive: true
					open: true