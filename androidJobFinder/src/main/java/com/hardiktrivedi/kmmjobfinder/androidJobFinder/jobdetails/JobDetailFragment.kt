package com.hardiktrivedi.kmmjobfinder.androidJobFinder.jobdetails

import android.os.Bundle
import android.text.method.ScrollingMovementMethod
import android.view.View
import androidx.fragment.app.Fragment
import androidx.fragment.app.viewModels
import androidx.navigation.fragment.navArgs
import com.bumptech.glide.Glide
import com.hardiktrivedi.kmmjobfinder.androidJobFinder.R
import com.hardiktrivedi.kmmjobfinder.androidJobFinder.databinding.FragmentJobDetailBinding
import com.hardiktrivedi.kmmjobfinder.androidJobFinder.utils.openInBrowser
import com.hardiktrivedi.kmmjobfinder.shared.models.JobInfo
import com.hardiktrivedi.kmmjobfinder.shared.network.SharedApiClient
import com.hardiktrivedi.kmmjobfinder.shared.utils.getOSInformation


/**
 * A simple [Fragment] subclass.
 * Use the [JobDetailFragment.newInstance] factory method to
 * create an instance of this fragment.
 */
class JobDetailFragment : Fragment(R.layout.fragment_job_detail) {

    private val args by navArgs<JobDetailFragmentArgs>()


    private val viewModel: JobFinderDetailViewModel by viewModels {
        JobFinderDetailViewModelFactory(SharedApiClient())
    }

    private lateinit var binding: FragmentJobDetailBinding

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        binding = FragmentJobDetailBinding.bind(view)
        viewModel.fetchJobDetail(args.JOBID).observe(viewLifecycleOwner, { jobInfo ->
            showJobDetail(view, jobInfo)
        })
    }

    private fun showJobDetail(
        view: View,
        jobInfo: JobInfo
    ) {
        binding.companyLogoImageView.apply {
            Glide.with(view)
                .load(jobInfo.companyLogo)
                .into(this)
        }
        binding.jobTitleTextView.text = jobInfo.title
        binding.companyNameTextView.text = jobInfo.company
        binding.jobTypeTextView.text = jobInfo.type
        binding.locationTextView.text = jobInfo.location
        binding.jobDescriptionValueTextView.text = jobInfo.description
        binding.jobDescriptionValueTextView.movementMethod = ScrollingMovementMethod()

        binding.moreInfoButton.setOnClickListener {
            context?.openInBrowser(jobInfo.companyUrl)
        }
        binding.howToApplyButton.setOnClickListener {
            context?.openInBrowser(jobInfo.howToApply)
        }
        binding.osInfoTextView.text = getString(R.string.android, getOSInformation())
    }

    companion object {
        @JvmStatic
        fun newInstance() = JobDetailFragment()
    }
}