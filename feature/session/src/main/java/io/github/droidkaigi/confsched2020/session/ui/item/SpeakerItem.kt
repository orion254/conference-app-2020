package io.github.droidkaigi.confsched2020.session.ui.item

import androidx.navigation.NavController
import com.squareup.inject.assisted.Assisted
import com.squareup.inject.assisted.AssistedInject
import com.xwray.groupie.databinding.BindableItem
import io.github.droidkaigi.confsched2020.item.EqualableContentsProvider
import io.github.droidkaigi.confsched2020.model.Speaker
import io.github.droidkaigi.confsched2020.session.R
import io.github.droidkaigi.confsched2020.session.databinding.ItemSpeakerBinding
import io.github.droidkaigi.confsched2020.session.ui.SearchSessionsFragmentDirections.actionSessionToSpeaker

class SpeakerItem @AssistedInject constructor(
    @Assisted val speaker: Speaker,
    val navController: NavController
) : BindableItem<ItemSpeakerBinding>(speaker.id.hashCode().toLong()),
    EqualableContentsProvider {
    override fun getLayout(): Int = R.layout.item_speaker

    override fun bind(viewBinding: ItemSpeakerBinding, position: Int) {
        viewBinding.title.text = speaker.name
        viewBinding.title.setOnClickListener {
            navController.navigate(actionSessionToSpeaker(speaker.id))
        }
    }

    override fun providerEqualableContents(): Array<*> {
        return arrayOf(speaker)
    }

    override fun equals(other: Any?): Boolean {
        return isSameContents(other)
    }

    override fun hashCode(): Int {
        return contentsHash()
    }

    @AssistedInject.Factory
    interface Factory {
        fun create(speaker: Speaker): SpeakerItem
    }
}