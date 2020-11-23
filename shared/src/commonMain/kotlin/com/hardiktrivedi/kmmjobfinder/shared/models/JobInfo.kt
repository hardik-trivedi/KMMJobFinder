package com.hardiktrivedi.kmmjobfinder.shared.models

import com.hardiktrivedi.kmmjobfinder.shared.Parcelable
import com.hardiktrivedi.kmmjobfinder.shared.Parcelize
import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Parcelize
@Serializable
data class JobInfo(
    @SerialName("id")
    val id: String,

    @SerialName("type")
    val type: String,

    @SerialName("url")
    val url: String,

    @SerialName("created_at")
    val createdAt: String,

    @SerialName("company")
    val company: String,

    @SerialName("company_url")
    val companyUrl: String,

    @SerialName("location")
    val location: String,

    @SerialName("title")
    val title: String,

    @SerialName("description")
    val description: String,

    @SerialName("how_to_apply")
    val howToApply: String,

    @SerialName("company_logo")
    val companyLogo: String? = null
) : Parcelable