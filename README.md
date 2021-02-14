# laravel-docker
### based on [lorisleiva/laravel-docker](https://github.com/lorisleiva/laravel-docker)

---

## Build
```
$ docker build -t lukaskj/laravel-docker:7.4-fpm -f 7.4-fpm\Dockerfile .
$ docker push lukaskj/laravel-docker:7.4-fpm
```
- Check for installed redis
```
$ docker run --rm lukaskj/laravel-docker:7.4-fpm sh -c "php -i | grep redis"
```

## Scripts
- `wait-for-it.sh` Located on /opt