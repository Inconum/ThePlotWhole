#!/bin/bash

# Start a Jekyll container with gem caching
docker run --rm -it \
  -v "$PWD":/srv/jekyll \
  -v ~/.ThePlotWhole_bundle:/usr/local/bundle \
  -p 4000:4000 jekyll/jekyll:4 bash -c "bundle install && bundle exec jekyll serve --host 0.0.0.0 --port 4000"

#-v "$PWD":/srv/jekyll → mounts your project folder into the container.
#-v ~/.ThePlotWhole_bundle:/usr/local/bundle → caches gems outside the container.
#-p 4000:4000 → exposes the site on http://localhost:4000.
#bundle install && bundle exec jekyll serve → installs missing gems (if any) and serves the site.
