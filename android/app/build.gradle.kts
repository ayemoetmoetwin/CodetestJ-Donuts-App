plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.jdonuts.jdonuts_app"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.jdonuts.jdonuts_app"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

// integration_test is a dev dependency. Flutter still writes it into
// GeneratedPluginRegistrant.java, and the release classpath does not
// include that plugin, so release compilation fails. Strip that block
// only while the release sources are compiled, then put the file back.
val integrationTestRegistration =
    Regex(
        """\s*try \{\s*flutterEngine\.getPlugins\(\)\.add\(new dev\.flutter\.plugins\.integration_test\.IntegrationTestPlugin\(\)\);\s*\} catch \(Exception e\) \{\s*Log\.e\(TAG, "Error registering plugin integration_test[^"]*", e\);\s*\}""",
    )
val generatedRegistrant =
    file("src/main/java/io/flutter/plugins/GeneratedPluginRegistrant.java")
var savedRegistrant: String? = null

tasks.withType<org.gradle.api.tasks.compile.JavaCompile>().configureEach {
    if (!name.contains("Release")) {
        return@configureEach
    }
    doFirst {
        if (!generatedRegistrant.exists()) {
            return@doFirst
        }
        val original = generatedRegistrant.readText()
        val stripped = original.replace(integrationTestRegistration, "")
        if (stripped != original) {
            savedRegistrant = original
            generatedRegistrant.writeText(stripped)
        }
    }
}

tasks.register("restoreGeneratedPluginRegistrant") {
    doLast {
        val original = savedRegistrant ?: return@doLast
        generatedRegistrant.writeText(original)
        savedRegistrant = null
    }
}

tasks.withType<org.gradle.api.tasks.compile.JavaCompile>().configureEach {
    if (name.contains("Release")) {
        finalizedBy("restoreGeneratedPluginRegistrant")
    }
}
