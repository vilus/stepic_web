#!/bin/env bash

target_dir=$1


mkdirs(){
  echo "mkdirs"
  mkdir -p $target_dir/{public,uploads,etc}
  mkdir -p $target_dir/public/{img,css,js}
}


deploy(){
  echo "deploy"
  cp -f nginx.conf $target_dir/etc/nginx.conf
  cp -f for_uploads.jpeg $target_dir/uploads/1.jpeg
  cp -f for_uploads.jpeg $target_dir/public/img/1.jpeg
}


nginx_configure(){
  echo "nginx_configure"
  sudo yum install -y nginx #>/dev/null 2>&1
  sudo apt-get install nginx #>/dev/null 2>&1
  sudo ln -s $target_dir/etc/nginx.conf  /etc/nginx/sites-enabled/test.conf
  sudo /etc/init.d/nginx restart
}

mkdirs
deploy
nginx_configure
echo "All done"
