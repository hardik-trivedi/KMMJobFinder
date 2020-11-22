package com.hardiktrivedi.kmmjobfinder.androidJobFinder.joblist

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.bumptech.glide.Glide
import com.hardiktrivedi.kmmjobfinder.androidJobFinder.R
import com.hardiktrivedi.kmmjobfinder.shared.models.JobInfo

class JobListAdapter(
    private val items: List<JobInfo>,
    private val clickListener: (JobInfo) -> Unit
) :
    RecyclerView.Adapter<JobListAdapter.CountryViewHolder>() {

    inner class CountryViewHolder(private val view: View) : RecyclerView.ViewHolder(view) {
        fun bindView(jobInfo: JobInfo) {
            val flagImageView = view.findViewById<ImageView>(R.id.companyLogoImageView).apply {
                Glide.with(view)
                    .load(jobInfo.companyLogo)
                    .circleCrop()
                    .into(this)
            }

            view.findViewById<TextView>(R.id.jobTitleTextView).text = jobInfo.title
            view.findViewById<TextView>(R.id.companyNameTextView).text = jobInfo.company
            view.findViewById<TextView>(R.id.jobTypeTextView).text = jobInfo.type
            view.findViewById<TextView>(R.id.locationTextView).text = jobInfo.location

            view.setOnClickListener {
                clickListener(jobInfo)
            }
        }
    }


    // Create new views (invoked by the layout manager)
    override fun onCreateViewHolder(
        parent: ViewGroup,
        viewType: Int
    ): CountryViewHolder {
        return CountryViewHolder(
            LayoutInflater.from(parent.context)
                .inflate(R.layout.job_info_list_item, parent, false)
        )
    }

    // Replace the contents of a view (invoked by the layout manager)
    override fun onBindViewHolder(holder: CountryViewHolder, position: Int) {
        // - get element from your dataset at this position
        // - replace the contents of the view with that element
        holder.bindView(items[position])
    }

    // Return the size of your dataset (invoked by the layout manager)
    override fun getItemCount() = items.size
}