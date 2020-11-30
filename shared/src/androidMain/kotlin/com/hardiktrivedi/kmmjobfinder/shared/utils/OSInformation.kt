package com.hardiktrivedi.kmmjobfinder.shared.utils

import android.os.Build

actual fun getOSInformation(): String {
    print(Build.VERSION_CODES::class.java.fields)
    return "${Build.VERSION_CODES::class.java.fields[Build.VERSION.SDK_INT].name} ${Build.VERSION.SDK_INT}"
}