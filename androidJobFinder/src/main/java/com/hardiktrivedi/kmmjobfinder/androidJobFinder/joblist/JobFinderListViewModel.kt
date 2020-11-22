package com.hardiktrivedi.kmmjobfinder.androidJobFinder.joblist

import androidx.lifecycle.LiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.liveData
import com.hardiktrivedi.kmmjobfinder.shared.models.JobInfo
import com.hardiktrivedi.kmmjobfinder.shared.network.SharedApiClient

class JobFinderListViewModel(private val apiClient: SharedApiClient) : ViewModel() {
    val jobInfo: LiveData<List<JobInfo>> = liveData {
        emit(apiClient.getJobInfo())
    }
}