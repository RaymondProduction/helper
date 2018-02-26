# Full transfer of the git repository to another server

All history will be saved

```sh
# Клонируем исходный репозиторий без рабочего каталога (--bare)
git clone --bare https://github.com/exampleuser/old-repository.git
 
 
cd old-repository.git
# Делаем mirror-push(будут скопированы все ветки и тэги) в новый репозиторий
git push --mirror https://github.com/exampleuser/new-repository.git
 
cd ..
# Удаляем папку с репозиторием
rm -rf old-repository.git
```

You can transfer to any server

[Original](https://gist.github.com/gaech/8355739)