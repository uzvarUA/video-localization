# встановлення
```bash
termux-change-repo && pkg update -y && pkg upgrade -y && pkg install git -y && git clone https://github.com/uzvarUA/termux-uzvarua && \
cd $HOME/termux-uzvarua && chmod +x install.sh && ./install.sh
```
___
# Локалізація відео
## git
```bash
#!/data/data/com.termux/files/usr/bin/bash

read -p "Вставте URL: " opt
[[ -z "$opt" ]] && echo "❌ URL не вказано. Вихід." && exit 1

if [[ ! "$opt" =~ ^https?://.+ ]]; then
  echo "❌ Невалідний формат URL."
  exit 1
fi

if ! git ls-remote "$opt" &> /dev/null; then
  echo "❌ Недоступний або не git-репозиторій."
  exit 1
fi

git clone "$opt"
```
2. `nano git.sh` вставити це код і зберегти `Ctrl + o`, і вийти `Ctrl + x`
3. Вставляємо це посилання `https://github.com/uzvarUA/video-localization`
> [!Warning]
> Важно, щоб було `cd $HOME`
> <br>
___
## Локалізація
4. Далі `cd $HOME/video-localization && proot -0 chmod +x uzvarua.sh && ./uzvarua.sh`
5. Готово
