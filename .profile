chmod 777 script.sh
apt install jq -y

app_name="krishnasai-onb-app-2"

# Get the latest release from Heroku
latest_release=$(heroku releases -a "$app_name" --json | jq -r '.[0].description')
release_date=$(heroku releases -a "$app_name" --json | jq -r '.[0].created_at')

# Convert release date string to timestamp
release_timestamp=$(date -u -d "$release_date" +"%s")

# Get current timestamp
current_timestamp=$(date -u +"%s")

# Calculate the time difference in seconds
time_diff=$((current_timestamp - release_timestamp))

# Check if the release contains the keyword "deploy" and if it's within the last 5 minutes
if [[ $latest_release == *"Deploy"* && $time_diff -le 300 ]]; then
    echo "Hello!"
fi
