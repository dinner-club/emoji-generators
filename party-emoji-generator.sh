function partyemoji {
  IFS="."; declare -a Array=($1);

  convert "${Array[0]}.${Array[1]}" -resize $2x$2 1_party_emoji_partial.png
  for i in {2..8}
  do
    convert "$(( i - 1 ))_party_emoji_partial.png" -set option:modulate:colorspace hsb -modulate 100,100,75 "${i}_party_emoji_partial.png"
  done
  convert *_party_emoji_partial.png "${Array[0]}_party.gif"
  rm *_party_emoji_partial.png
}

