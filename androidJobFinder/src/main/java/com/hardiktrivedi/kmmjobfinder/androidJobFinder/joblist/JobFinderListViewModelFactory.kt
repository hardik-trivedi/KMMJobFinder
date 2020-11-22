package com.hardiktrivedi.kmmjobfinder.androidJobFinder.joblist

import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider
import com.hardiktrivedi.kmmjobfinder.shared.network.SharedApiClient

class JobFinderListViewModelFactory(private val apiClient: SharedApiClient) :
    ViewModelProvider.NewInstanceFactory() {
    override fun <T : ViewModel?> create(modelClass: Class<T>): T {
        return JobFinderListViewModel(apiClient) as T
    }
}