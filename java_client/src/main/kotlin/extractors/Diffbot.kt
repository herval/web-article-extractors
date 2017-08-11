package extractors

import com.google.api.client.http.apache.ApacheHttpTransport
import com.google.api.client.json.jackson2.JacksonFactory
import com.syncthemall.diffbot.Diffbot
import java.net.URL

/**
 * Created by herval on 8/6/17.
 */
class Diffbot {
    fun parse(urlStr: String, mode: String, apiKey: String) {
        val diffbot = Diffbot(ApacheHttpTransport(), JacksonFactory(), apiKey)
        val article = diffbot.article().analyze(urlStr).execute()

        if (mode == "html") {
            println(article.html)
        } else {
            println(article.text)
        }
    }
}
