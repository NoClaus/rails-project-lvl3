install:
	bundle install
	yarn install

db-drop:
	bundle exec rails db:drop

db-migrate:
	bundle exec rails db:migrate

db-setup:
	bundle exec rails db:create db:migrate db:seed

db-reset:
	bundle exec rails db:drop db:create db:migrate db:seed

console:
	bundle exec rails console
	
lint: lint-code

lint-code:
	bundle exec rubocop
	bundle exec slim-lint app/views/

test:
	bundle exec rails test