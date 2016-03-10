#!/usr/bin/env bash

target_dir=$1

#rm -fr $target_dir 

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
  cd $target_dir
  git init
  git remote add origin https://github.com/vilus/stepic_dj
  git pull origin master

  pip install PyYAML
  pip install pytz
  python ${target_dir}/manage.py makemigrations
  python ${target_dir}/manage.py migrate
#  python ${target_dir}/manage.py loaddata init
  cd - 
}

prep_db(){
  echo "prep_db"
  /etc/init.d/mysql start
  mysql -uroot -e "create database stepic_db"
  mysql -uroot -e "CREATE USER 'stepic'@'%' IDENTIFIED BY '1q2w3e'"
  mysql -uroot -e "GRANT ALL ON stepic_db.* TO 'stepic'@'%' IDENTIFIED BY '1q2w3e'"
  mysql -uroot -e "GRANT ALL ON stepic_db.* TO 'stepic'@'localhost' IDENTIFIED BY '1q2w3e'"
  mysql -uroot -e "FLUSH PRIVILEGES"
  apt-get install libmysqlclient-dev
  apt-get install python-dev libmysqlclient-dev
  pip install mysql-python
  pip install mysqlclient
}

prep_db
clone_dj
#mkdirs
#deploy
pip install --upgrade django
#nginx_configure
echo "All done"
