install:
	bin/composer install

start:
	php -S localhost:8080

test:
	curl -s localhost:8080 | grep -q "<title>PrivateBin</title>"

lint:
	-find ./lib/ -type f -name '*.php' -exec php -l {} \;
	-exec ./vendor/bin/phpcs --extensions=php ./lib/  
	-exec ./vendor/bin/phpmd ./lib/ ansi codesize,unusedcode,naming 
dev: 
	php -dxdebug.mode=debug -dxdebug.start_with_request=yes -S localhost:8080
