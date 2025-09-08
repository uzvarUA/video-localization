#!/data/data/com.termux/files/usr/bin/bash

read -p "Ставте URL: " opt
[[ -z "$opt" ]] && echo "❌ URL не вказано. Вихід." && exit 1

BRIGHTNESS=0.7
BRIGHTNESS_FILTER=$(echo "$BRIGHTNESS - 1" | bc)

yt-dlp -f bestvideo+bestaudio --merge-output-format mp4 "$opt" -o "%(title)s.%(ext)s"
latest=$(ls -t *.mp4 | head -n1)

base="${latest%.*}"
output="${base}_dark.mp4"

echo "🎬 Обробляємо: $latest → $output з яскравістю $BRIGHTNESS_FILTER"

ffmpeg -i "$latest" \
	-map_metadata -1 \
  -vf "eq=brightness=$BRIGHTNESS_FILTER" \
  -c:a copy "$output"
