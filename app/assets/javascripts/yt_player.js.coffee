jQuery ->
  current_uid = ""

  $('.yt_preview').click ->
    $player_wrapper = $('#player-wrapper')
    $("#video-preview").slideDown() if $("#video-preview").css("display") == "none"
    $player_wrapper.fadeOut('fast')
    makeVideoPlayer $(this).data('uid')
    current_uid = $(this).data('uid')
    $player_wrapper.fadeIn('slow')

  # Initially the player is not loaded
  window.ytPlayerLoaded = false

  _run = ->
    # Runs as soon as Google API is loaded
    $("#video-preview").hide()
    return

  makeVideoPlayer = (video) ->
    if !window.ytPlayerLoaded
      $player_wrapper = $('#player-wrapper')
      $player_wrapper.append('<div id="ytPlayer"><p>Loading player...</p></div>')

      window.ytplayer = new YT.Player('ytPlayer', {
        width: '60%'
        height: ($player_wrapper.width() / 1.777777777) * 0.6
        videoId: video
        playerVars: {
          wmode: 'opaque'
          autoplay: 0
          modestbranding: 1
        }
        events: {
          'onReady': -> window.ytPlayerLoaded = true
          'onError': (errorCode) -> alert("We are sorry, but the following error occured: " + errorCode)
        }
      })
    else
      window.ytplayer.loadVideoById(video)
      window.ytplayer.pauseVideo()
    return

  google.setOnLoadCallback _run

  $('.glyphicon.glyphicon-2x.glyphicon-chevron-left').click ->
    switchVideo("left")

  $('.glyphicon.glyphicon-2x.glyphicon-chevron-right').click ->
    switchVideo("right")

  switchVideo = (direction) ->
    current_index = 0
    $yt_preview = $('.yt_preview')
    $.each $yt_preview, (index, video) ->
      if current_uid == $yt_preview.eq(index).data('uid')
        current_index = index

    next_index = if direction == 'left' then current_index - 1 else current_index + 1
    $yt_preview.eq(next_index).click()
    current_uid = next_uid

  return
