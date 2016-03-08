#!/usr/bin/env bash

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

clone_dj(){
  git clone https://github.com/vilus/stepic_dj $target_dir
}

prep_db(){
  echo "prep_db"
  mysql -uroot -e "create database stepic_db"
  mysql -uroot -e "CREATE USER 'stepic'@'%' IDENTIFIED BY '1q2w3e'"
  mysql -uroot -e "GRANT ALL ON stepic_db.* TO 'stepic'@'%' IDENTIFIED BY '1q2w3e'"
  mysql -uroot -e "GRANT ALL ON stepic_db.* TO 'stepic'@'localhost' IDENTIFIED BY '1q2w3e'"
  mysql -uroot -e "FLUSH PRIVILEGES"
  pip install mysql-python
  sudo apt-get install python-dev libmysqlclient-dev
  pip install mysqlclient
}

prep_db
clone_dj
#mkdirs
#deploy
pip install --upgrade django
#nginx_configure
echo "All done"
