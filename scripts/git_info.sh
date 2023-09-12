if [[ $1 == https://github.com/* ]]; then
  author=$(echo "$1" | cut -f4 -d "/")
  repo=$(echo "$1" | cut -f5 -d "/")
else
  author=$1
  repo=$2
fi

if [ -z "${author}" ] || [ -z "-z ${repo}" ]; then
  echo -e "Usage\n  $0 <author> <repo>\n  $0 <github_url>"
  exit 1
fi

resp=$(curl -s -f "https://api.github.com/repos/${author}/${repo}")

if [[ $? -eq 22 ]]; then
  echo -e "Couldn't find the given repo.\nTry checking the author/repo name and your internet connection"
  exit 1
fi

size=$(echo "${resp}" | grep "size" | grep -o "[0-9]*")
size_mb=$(echo "print('{0:0.2f}'.format(${size}/1024))" | python3)

# Don't ask me how this works
desc=$(echo "${resp}" | grep "description" | cut -b 16- | grep -o '"[^"]\+"')

lang=$(curl -f -s "https://api.github.com/repos/${author}/${repo}/languages" | grep -o '"[^"]\+"' | tr "\n" " ")

stars=$(echo "${resp}" | grep "stargazers_count" | grep -o "[0-9]*")

created_at=$(echo "${resp}" | grep "created_at" | cut -b 16- | grep -o '"[^"]\+"' | tr "\"" " ")
updated_at=$(echo "${resp}" | grep "updated_at" | cut -b 16- | grep -o '"[^"]\+"' | tr "\"" " ")

echo -e "${author}/${repo}:\n\
  DESCRIPTION: ${desc}\n\
  SIZE:        ${size_mb} MB\n\
  LANGUAGES:   ${lang}\n\
  STARS:       ${stars}\n\
  CREATED AT: ${created_at}\n\
  UPDATED AT: ${updated_at}"


