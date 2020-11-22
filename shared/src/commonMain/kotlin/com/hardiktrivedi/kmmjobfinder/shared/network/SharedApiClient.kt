package com.hardiktrivedi.kmmjobfinder.shared.network

import com.hardiktrivedi.kmmjobfinder.shared.models.JobInfo
import io.ktor.client.*
import io.ktor.client.features.json.*
import io.ktor.client.features.json.serializer.*
import io.ktor.client.request.*

class SharedApiClient{
    companion object {
        private const val URL = "https://jobs.github.com/positions.json?description=android&full_time=true&location=uk"
    }

    private val httpApiClient: HttpClient = HttpClient {
        install(JsonFeature) {
            val json = kotlinx.serialization.json.Json { ignoreUnknownKeys = true }
            serializer = KotlinxSerializer(json)
        }
    }

    suspend fun getJobInfo(): List<JobInfo> {
        return httpApiClient.get(URL)
    }
}