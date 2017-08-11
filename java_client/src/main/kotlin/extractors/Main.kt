package extractors

object Main {

    @JvmStatic
    fun main(args: Array<String>) {
        val urlStr = args.get(0)
        val parser = args.get(1)

        when (parser) {
            "diffbot" -> {
                val mode = args.get(2)
                val apiKey = args.get(3)
                Diffbot().parse(urlStr, mode, apiKey)
            }
            "boilerpipe" -> Boilerpipe().parse(urlStr)
        }
    }

}
