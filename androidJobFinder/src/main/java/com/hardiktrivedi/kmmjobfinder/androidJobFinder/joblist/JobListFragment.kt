package com.hardiktrivedi.kmmjobfinder.androidJobFinder.joblist

import android.os.Bundle
import android.view.View
import android.widget.LinearLayout
import androidx.fragment.app.Fragment
import androidx.fragment.app.viewModels
import androidx.recyclerview.widget.DividerItemDecoration
import androidx.recyclerview.widget.LinearLayoutManager
import com.hardiktrivedi.kmmjobfinder.androidJobFinder.R
import com.hardiktrivedi.kmmjobfinder.androidJobFinder.databinding.FragmentJobListBinding
import com.hardiktrivedi.kmmjobfinder.shared.network.SharedApiClient


/**
 * A simple [Fragment] subclass.
 * Use the [JobListFragment.newInstance] factory method to
 * create an instance of this fragment.
 */
class JobListFragment : Fragment(R.layout.fragment_job_list) {

    companion object {
        @JvmStatic
        fun newInstance() = JobListFragment()
    }

    private val viewModel: JobFinderListViewModel by viewModels {
        JobFinderListViewModelFactory(SharedApiClient())
    }

    private lateinit var binding: FragmentJobListBinding

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        binding = FragmentJobListBinding.bind(view)
        viewModel.jobInfo.observe(viewLifecycleOwner, {
            with(binding.jobRecyclerView) {
                layoutManager = LinearLayoutManager(activity)
                addItemDecoration(DividerItemDecoration(activity, LinearLayout.VERTICAL))
                adapter = JobListAdapter(it) {

                }
            }
        })
    }
}