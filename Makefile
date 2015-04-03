
s:
	rails s -b 0.0.0.0

m:
	rake db:migrate:reset db:seed
	annotate
