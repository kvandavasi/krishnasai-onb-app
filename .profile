chmod 777 script.sh
app_name="krishnasai-onb-app-2"

# Get the latest release from Heroku
latest_release=$(heroku releases -a "$app_name" | awk 'NR==4 {print $2}')
release_date=$(heroku releases -a "$app_name" | awk 'NR==4 {print $1}' | xargs -I{} heroku releases:info -a "$app_name" {} --json | grep -oP '(?<="created_at": ")[^"]+')

# Convert release date string to timestamp
release_timestamp=$(date -u -d "$release_date" +"%s")

# Get current timestamp
current_timestamp=$(date -u +"%s")

# Calculate the time difference in seconds
time_diff=$((current_timestamp - release_timestamp))

# Check if the release contains the keyword "deploy" and if it's within the last 5 minutes
if [[ $latest_release == "Deploy" && $time_diff -le 30 ]]; then
    echo "Hello! Because this is deploy"
fi
