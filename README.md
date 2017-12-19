# Docker Jesque Web
A dockerized version of [Jesque-Web](https://github.com/gresrun/jesque-web)

## Dependencies
In order to run this image, you must have

 * [Docker Engine](https://docs.docker.com/engine/installation/)

## Usage
Start a Jesque-Web instance

    docker run \
      --env REDIS_HOST=redis.example.com \
      --publish 8080:8080 \
      sgillespie/jesque-web

### Environment Variables
This image will use the following environment variables:

 * `REDIS_HOST` (default: *localhost*)
 * `REDIS_PORT` (default: *6379*)
 * `REDIS_TIMEOUT` (default: *5000*)
 * `REDIS_PASSWORD` (no default)
 * `REDIS_NAMESPACE` (default: *resque*)
 * `REDIS_DATABASE` (default: *0*)
 * `JETTY_CONTEXT` (default: */*)


## Acknowledgements
This image uses Jesque-Web:

 * https://github.com/gresrun/jesque-web

## License
Copyright 2017 Sean Gillespie

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

For more information, please see <LICENSE>.
