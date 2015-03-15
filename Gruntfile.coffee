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

		# grunt clean
		clean:
			build:
				src: ['public/js', 'public/css']

		# grunt sass
		sass:
			src:
				options:
					style: 'expanded'
				files: [
					expand: true
					cwd: './src'
					src: ['**/*.scss', '**/*.sass']
					dest: 'public/app'
					ext: '.css'
				]

		# grunt coffee
		coffee:
			src:
				options:
					bare: true
					preserve_dirs: true
					sourceMap: true
				files: [
					expand: true
					cwd: './src'
					src: ['**/*.coffee']
					dest: 'public/app'
					ext: '.js'
				]
			tests:
				options:
					bare: true
					preserve_dirs: true
					sourceMap: true
				files: [
					expand: true
					cwd: './tests'
					src: ['**/*.coffee']
					dest: 'tests'
					ext: '.js'
				]

		# grunt haml
		haml:
			compile:
				files: [
					expand: true
					cwd: './src'
					src: ['**/*.haml']
					dest: 'public/app'
					ext: '.html'
				]

		# grunt watch
		watch:
			haml:
				files: '<%= haml.compile.src %>'
				tasks: ['haml']
			sass:
				files: '<%= sass.compile.files[0].src %>'
				tasks: ['sass']
			coffee:
				files: '<%= coffee.compile.src %>'
				tasks: ['coffee']
			options:
				livereload: true


				