package com.ute.comutemultimedia

import android.net.Uri
import android.os.Bundle
import android.webkit.WebChromeClient
import android.webkit.WebSettings
import android.webkit.WebView
import android.webkit.WebViewClient
import android.widget.MediaController
import android.widget.VideoView
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity

class MainActivity : AppCompatActivity() {

    private lateinit var webView: WebView
    private lateinit var videoView: VideoView

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_main)

        // --- YouTube en WebView ---
        webView = findViewById(R.id.webViewYouTube)

        val ws: WebSettings = webView.settings
        ws.javaScriptEnabled = true
        ws.domStorageEnabled = true
        ws.mediaPlaybackRequiresUserGesture = false
        ws.mixedContentMode = WebSettings.MIXED_CONTENT_ALWAYS_ALLOW

        webView.webChromeClient = WebChromeClient()
        webView.webViewClient = WebViewClient()

        // usar /embed/ y autoplay en mute (necesario en móviles)
        val youTubeEmbedUrl =
            "https://www.youtube.com/embed/M7lc1UVf-VE?autoplay=1&mute=1&playsinline=1"

        val html = """
            <!DOCTYPE html>
            <html>
            <head>
              <meta name="viewport" content="width=device-width, initial-scale=1">
              <style>
                html,body { height:100%; margin:0; background:#000; }
                .wrap { position:relative; width:100%; padding-top:56.25%; } /* 16:9 */
                .wrap iframe { position:absolute; inset:0; width:100%; height:100%; border:0; }
              </style>
            </head>
            <body>
              <div class="wrap">
                <iframe
                  src="$youTubeEmbedUrl"
                  title="YouTube player"
                  allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                  allowfullscreen
                ></iframe>
              </div>
            </body>
            </html>
        """.trimIndent()

        webView.loadDataWithBaseURL(
            "https://www.youtube.com", html, "text/html", "UTF-8", null
        )

        // --- MP4 local en VideoView (res/raw/demo.mp4) ---
        videoView = findViewById(R.id.videoViewMp4)

        val mediaController = MediaController(this).apply {
            setAnchorView(videoView)
        }
        videoView.setMediaController(mediaController)

        val videoUri: Uri = Uri.parse("android.resource://$packageName/${R.raw.demo}")
        videoView.setVideoURI(videoUri)
        videoView.setOnPreparedListener { mp ->
            mp.isLooping = false
            videoView.requestFocus()
            videoView.start()
        }
    }

    @Deprecated("onBackPressed() está deprecado en APIs nuevas")
    override fun onBackPressed() {
        if (this::webView.isInitialized && webView.canGoBack()) {
            webView.goBack()
        } else {
            super.onBackPressed()
        }
    }
}
