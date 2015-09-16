#!/bin/sh

deploy_dir=/home/rails/local_deploy/gameband_test
rails_env=production

cd $deploy_dir
bundle exec cap local-$rails_env deploy
