# Veil #

## Adding people to the database ##

There is probably a better way to do this, but, do this....

	rails console

Then copy in the contents of this script:
`./bin/import_people.rb`. (it is in the bin folder of the Veil rails
app).

Then in the console type

	main('my_file_to_import.txt')

with whatever your file name is. This should be a tab separated file
with the following columns (in this order).

	name	email	p_type	picture	info

If you want to test this first, you can pass `--sandbox` to the console
command.

## Adding software ##

Completely analagous to adding people.
