# Mindfully Balanced Living

### assets/.env
````
HOST = 'your ip here:1337';
````

### Run code gen for json serializable
flutter pub run build_runner build

## Git Setup

### Set Line Endings(Windows only)
git config --global core.autocrlf false

### Setup git hooks
Run this in a unix based shell. Use git bash on windows to runt this command successfully
chmod +x .githooks/*.bash && .githooks/install-hooks.bash

#### Hooks not working
When the hooks don't execute then try removing core.hooksPath from the config file in .git/config
.git directoty might be hidden and needs to be made visisble first. This differs per OS. Google it.

## Tests

### Mocks
Add for exmaple @GenerateMocks([http.Client]) to your test function and ...
Run flutter pub run build_runner build

See docs for more info: https://docs.flutter.dev/cookbook/testing/unit/mocking

### Unit Tests