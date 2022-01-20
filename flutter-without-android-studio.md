# Flutter without installing Android Studio

1. Install flutter and Android command line tools.

https://docs.flutter.dev/get-started/install
https://developer.android.com/studio

2. Create ~/Android/cmdline-tools/latest and move command line tools content to that folder.

https://stackoverflow.com/questions/65262340/cmdline-tools-could-not-determine-sdk-root

3. Add command line tools and android environments to path.

4. Install tools using sdkmanager CLI.

`$ sdkmanager "platform-tools" "platforms;android-30" "build-tools;30.0.2"`

5. Check everything using flutter doctor.
