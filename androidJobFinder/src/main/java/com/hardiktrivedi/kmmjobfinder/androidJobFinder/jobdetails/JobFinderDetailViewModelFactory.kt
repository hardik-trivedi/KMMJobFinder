package com.hardiktrivedi.kmmjobfinder.androidJobFinder.jobdetails

import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider
import com.hardiktrivedi.kmmjobfinder.shared.network.SharedApiClient

class JobFinderDetailViewModelFactory(private val apiClient: SharedApiClient) :
    ViewModelProvider.NewInstanceFactory() {
    override fun <T : ViewModel?> create(modelClass: Class<T>): T {
        return JobFinderDetailViewModel(apiClient) as T
    }
}