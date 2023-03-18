# Mindfully Balanced Living

## assets/.env
````
HOST = 'your ip here';
````

## Access env vars
````
dotenv.get('HOST')
````

## Git Setup

### Set Line Endings(Windows only)
git config --global core.autocrlf false

### Setup git hooks
Run this in a unix based shell. Use git bash on windows to runt this command successfully
chmod +x .githooks/*.bash && .githooks/install-hooks.bash