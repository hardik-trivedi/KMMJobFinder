package com.hardiktrivedi.kmmjobfinder.shared.utils

actual fun getOSInformation(): String {
    return "${platform.UIKit.UIDevice.currentDevice.systemName()} ${platform.UIKit.UIDevice.currentDevice.systemVersion}"
}