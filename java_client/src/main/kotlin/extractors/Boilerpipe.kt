package extractors

import de.l3s.boilerpipe.extractors.ArticleExtractor
import java.net.URL

/**
 * Created by herval on 8/6/17.
 */
class Boilerpipe {
    fun parse(urlStr: String) {
        val url = URL(urlStr)

        val text = ArticleExtractor.INSTANCE.getText(url)
        println(text)
    }
}
