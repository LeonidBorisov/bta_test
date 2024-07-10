# Initialize a new Git repository
cd /home/codio/workspace

git init

touch app.py
git add app.py 
git commit -m "add app.py"

touch main_2.py
git add main_2.py 
git commit -m "Test main_2.py"

echo "print('hello world')" >> app.py
git add app.py 
git commit -m "modify app.py"

touch main_3.py
git add main_3.py 
git commit -m "Test main_3.py"

# ниже добавляем вывод в файл с логами 

# Сохраняем текущую функцию git, если она существует
current_git_function=$(grep -oP 'git\(\) \{' ~/.bashrc)

# Проверяем, есть ли уже такая функция git
if [ -z "$current_git_function" ]; then
  echo 'git() {' >> ~/.bashrc
  echo '  if [[ "$1" == "push" ]]; then' >> ~/.bashrc
  echo '    echo -n > /home/codio/workspace/code/fundamentals/.log.txt' >> ~/.bashrc
  echo '    remote_url=$(git remote -v | grep "fetch" | awk '\''{print $2}'\'')' >> ~/.bashrc
  echo '    command git "$@"' >> ~/.bashrc
  echo '    mkdir .tmp' >> ~/.bashrc
  echo '    cd .tmp' >> ~/.bashrc
  echo '    command git clone $remote_url' >> ~/.bashrc
  echo '    cd bta_test' >> ~/.bashrc
  echo '    command git log >> /home/codio/workspace/code/fundamentals/.log.txt' >> ~/.bashrc
  echo '    cd ../../' >> ~/.bashrc
  echo '    rm -rf .tmp' >> ~/.bashrc
  echo '  else' >> ~/.bashrc
  echo '    command git "$@"' >> ~/.bashrc
  echo '  fi' >> ~/.bashrc
  echo '}' >> ~/.bashrc
fi