# FirebaseConfig

This extension does not provide any API, it's purpose is to package Firebase configuration resources for Android platform.

## Getting started

### Obtain google-services.json file

Start by creating Firebase project in the [Firebase console](https://console.firebase.google.com/) or open an existing one. Next, configure an Android app for the project while making sure the specified package name matches your application ID as defined in your AIR descriptor XML. Remember that AIR SDK automatically prefixes AIR app IDs with `air.` prefix so the value set in your Firebase console must reflect that.

When your app is configured, download the `google-services.json` file. See [this guide](https://support.google.com/firebase/answer/7015592#android) if you're having trouble locating the file in the console.

### Creating Android resources

Open the downloaded `google-services.json` file and [android/res/values/values.xml](android/res/values/values.xml) file that is part of this repository.
Copy the following values from `google-services.json` to corresponding elements in `values.xml` file:

| `google-services.json` | `values.xml` |
| --- | --- |
| `{YOUR_CLIENT}/client_info/mobilesdk_app_id` | `google_app_id` |
| `project_info/project_number` | `gcm_defaultSenderId` |
| `{YOUR_CLIENT}/oauth_client/client_id` (where `client_type == 3`) | `default_web_client_id` |
| `project_info/firebase_url` | `firebase_database_url` |
| `{YOUR_CLIENT}/api_key/current_key` | `google_api_key` |
| `{YOUR_CLIENT}/api_key/current_key` | `google_crash_reporting_api_key` |
| `{YOUR_CLIENT}/services/analytics-service/analytics_property/tracking_id`* | `ga_trackingId` |

\* If the `tracking_id` value is not available then you can comment out or delete the `ga_trackingId` element from `values.xml` file.

If you specified a value for `ga_trackingId` in `values.xml` then also set the same value in [android/res/xml/global_tracker.xml](android/res/xml/global_tracker.xml) file, otherwise comment out or delete the `ga_trackingId` element from `global_tracker.xml` file.

### Package the extension

The extension needs to be repackaged with the new values you have specified. Navigate to the [build](build/) directory from your command line and run:

`ant package`

File named `com.marpies.ane.firebase.config.ane` will be created in the [bin](bin/) directory. Copy it to your project directory and add the extension id to your AIR descriptor XML:

```xml
<extensions>
    <extensionID>com.marpies.ane.facedetection</extensionID>
</extensions>
```

Done.

### iOS configuration file

The extension itself is only necessary for Android apps. For iOS, you'll have a separate configuration file `GoogleService-Info.plist` from the Firebase console. You need to make sure this file is included in the **root of your IPA package** when building the app for iOS. If you create the IPA package from command line, simply specify path to the configuration file after your `main.swf` file:

```
adt
-package -target ipa-test
-storetype ... -keystore ... -provisioning-profile ...
output.ipa
app-desc.xml
-extdir ...
main.swf /path/to/GoogleService-Info.plist
```

If you use an IDE to create your IPA then refer to the IDE's instructions on how to include custom files.
