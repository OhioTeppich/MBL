# Mindfully Balanced Living

## Environment Variables Frontend
assets/.env
````
HOST = 'your ip here:1337';
````

## Git Setup

### Set Line Endings(Windows only)
````bash
git config --global core.autocrlf false
````

### Setup git hooks
Run this in a unix based shell. Use git bash on windows to run this command successfully
````bash
chmod +x .githooks/* && .githooks/install-hooks
````
#### **Known issue on OSX**
add `pre-commit` and `pre-push` in `.git/hooks`.

#### **Hooks not working**
When the hooks don't execute then try removing `core.hooksPath` from the config file in `.git/config`

The `.git` directoty might be hidden and needs to be made visisble first. This differs per OS. Google it.

## Code Generation for json serializable
````bash
flutter pub run build_runner build
````

## Tests

### Mocks
Add for exmaple `@GenerateMocks([http.Client])` to your test function and run ...
````bash
flutter pub run build_runner build
````
See docs for more info: https://docs.flutter.dev/cookbook/testing/unit/mocking

### Unit Tests

add documentation