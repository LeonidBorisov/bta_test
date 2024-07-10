#!/bin/bash

# Устанавливаем путь к файлу
output_file="/home/codio/workspace/code/fundamentals/.git_user_params.txt"

cd "/home/codio/workspace"

# Получаем глобальные параметры Git пользователя
logs=$(git branch)

# Записываем параметры в файл
echo " $logs" > "$output_file"