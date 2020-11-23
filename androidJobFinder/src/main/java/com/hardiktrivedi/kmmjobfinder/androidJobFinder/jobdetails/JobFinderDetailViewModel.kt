package com.hardiktrivedi.kmmjobfinder.androidJobFinder.jobdetails

import androidx.lifecycle.LiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.liveData
import com.hardiktrivedi.kmmjobfinder.shared.models.JobInfo
import com.hardiktrivedi.kmmjobfinder.shared.network.SharedApiClient

class JobFinderDetailViewModel(private val apiClient: SharedApiClient) : ViewModel() {
    fun fetchJobDetail(jobId: String): LiveData<JobInfo> = liveData {
        emit(apiClient.getJobDetail(jobId))
    }
}