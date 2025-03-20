'***************************************************************
'** One Church Streaming App
'** version 1.0
'** Copyright (c) 2025 I Am One Church, Inc. All rights reserved.
'***************************************************************
'
'sub init() 
'  m.global.scene = CreateObject("roSGNode", "MainScene")  ' Create MainScene instance
'  m.top.appendChild(m.global.scene)  ' Add to scene graph
'end sub

' Channel entry point
sub Main()
  showHeroScreen()
end sub

' Initializes the scene and shows the main homepage.
' Handles closing of the channel.
sub showHeroScreen()
  print "main.brs - [showHeroScreen]"
  screen = CreateObject("roSGScreen")
  m.port = CreateObject("roMessagePort")
  screen.setMessagePort(m.port)
  scene = screen.CreateScene("MainScene")
  screen.show()

  'AppLaunchComlete beacon
  'event = CreateObject("roSGNode", "event")
  'event.SetField("name", "AppLaunchComplete")
  'event.SetField("time", CreateObject("roTimespan").totalMilliseconds())
  'event.Fire()

  while(true)
    msg = wait(0, m.port)
    msgType = type(msg)
    if msgType = "roSGScreenEvent"
      if msg.isScreenClosed() then return
    end if
  end while
end sub