plugins {
    id("com.android.application")
    kotlin("android")
    id("kotlin-android-extensions")
    id("kotlin-android")
}
group = "com.hardiktrivedi.kmmjobfinder"
version = "1.0-SNAPSHOT"

repositories {
    gradlePluginPortal()
    google()
    jcenter()
    mavenCentral()
}
dependencies {
    implementation(project(":shared"))
    implementation("com.google.android.material:material:1.2.1")
    implementation("androidx.appcompat:appcompat:1.2.0")
    implementation("androidx.constraintlayout:constraintlayout:2.0.4")
    implementation("org.jetbrains.kotlin:kotlin-stdlib:${rootProject.extra["kotlin_version"]}")
    implementation("androidx.legacy:legacy-support-v4:1.0.0")

    val navVersion = "2.3.1"
    implementation("androidx.navigation:navigation-fragment-ktx:$navVersion")
    implementation("androidx.navigation:navigation-ui-ktx:$navVersion")

    val viewModelVersion = "2.2.0"
    implementation("androidx.lifecycle:lifecycle-viewmodel:$viewModelVersion")

    val activityKtxVersion = "1.1.0"
    implementation("androidx.activity:activity-ktx:$activityKtxVersion")

    val glideVersion = "4.11.0"
    implementation("com.github.bumptech.glide:glide:$glideVersion")
    annotationProcessor("com.github.bumptech.glide:compiler:$glideVersion")

    val liveDataKtx = "2.2.0-alpha01"
    implementation("androidx.lifecycle:lifecycle-livedata-ktx:$liveDataKtx")

    val androidxCoreTesting = "2.1.0"
    testImplementation("androidx.arch.core:core-testing:$androidxCoreTesting")

    val coroutineVersion = "1.3.9-native-mt"
    testImplementation("org.jetbrains.kotlinx:kotlinx-coroutines-test:$coroutineVersion")

    val mockkVersion = "1.10.0"
    testImplementation("io.mockk:mockk:$mockkVersion")
}
android {
    compileSdkVersion(29)
    defaultConfig {
        applicationId = "com.hardiktrivedi.kmmjobfinder.androidJobFinder"
        minSdkVersion(24)
        targetSdkVersion(29)
        versionCode = 1
        versionName = "1.0"
    }
    buildTypes {
        getByName("release") {
            isMinifyEnabled = false
        }
    }
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_1_8.toString()
    }
    buildFeatures {
        viewBinding = true
    }
}