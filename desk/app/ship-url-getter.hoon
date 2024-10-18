/+  dbug, default-agent, server, schooner
::
^-  agent:gall
=<
|_  =bowl:gall
+*  this  .
    def  ~(. (default-agent this %|) bowl)
    hc   ~(. +> [bowl ~])
    card  card:agent:gall
::
++  on-init
  ^-  (quip card _this)
  =/  cards  abet:init:hc
  [cards this]
::
++  on-save
  ^-  vase
  !>(~)
::
++  on-load
  |=  =vase
  ^-  (quip card _this)
  [~ this]
::
++  on-poke
  |=  =cage
  ^-  (quip card _this)
  =/  cards  abet:(poke:hc cage)
  [cards this]
::
++  on-peek
  |=  =path
  ^-  (unit (unit cage))
  [~ ~]
::
++  on-agent
  |=  [=wire =sign:agent:gall]
  ^-  (quip card _this)
  `this
::
++  on-arvo
  |=  [=wire =sign-arvo]
  ^-  (quip card _this)
  =/  cards  abet:(arvo:hc [wire sign-arvo])
  [cards this]
::
++  on-watch
  |=  =path
  ^-  (quip card _this)
  `this
::
++  on-fail   on-fail:def
++  on-leave  on-leave:def
--
::
|_  [=bowl:gall deck=(list card:agent:gall)]
+*  that  .
    card  card:agent:gall
::
++  emit  |=(=card that(deck [card deck]))
++  emil  |=(lac=(list card) that(deck (welp lac deck)))
++  abet  ^-((list card) (flop deck))
::
++  init
  ^+  that
  %-  emit
  :*  %pass   /eyre/connect   
      %arvo  %e  %connect
      `/apps/ship-url-getter  %ship-url-getter
  ==
::
++  poke
  |=  =cage
  ^+  that
  ?+    -.cage  !!
      %handle-http-request
    (handle-http !<([@ta =inbound-request:eyre] +.cage))
  ==
::
++  handle-http
  |=  [eyre-id=@ta =inbound-request:eyre]
  ^+  that
  =/  ,request-line:server
    (parse-request-line:server url.request.inbound-request)
  ::
  ?+    method.request.inbound-request  that
      %'GET'
    ?+    site  that
        [%apps %ship-url-getter @ ~]
      ::  send a remote scry request and save this eyre-task
      =/  =ship   (slav %p +14:site)
      =/  nonce  eny.bowl
      %-  emit
      :*  %pass  /eauth/(scot %p ship)/[eyre-id]
          [%keen %.n [ship /e/x/(scot %da now.bowl)//eauth/url]]
      ==
    ==
  ==
::
++  arvo
  |=  [=wire =sign-arvo]
  ^+  that
  ?+    wire  that
      [%eauth @ @ ~]
    =/  =ship  (slav %p +6:wire)
    =/  eyre-id=@ta  +14:wire
    ?+    sign-arvo  that 
        [%ames %tune *]
      =/  =roar:ames  (need roar.sign-arvo)
      ::  roar is a [dat=[p=/ q=~] syg=~]    
      =/  c=(cask)  (need q.dat.roar)
      ::  c should be a [%cord *]
      =/  url=@t  (need ;;((unit @t) +.c))
      =/  =header-list:http  
        :~  'Access-Control-Allow-Origin'^'*' 
            'Content-Type'^'application/json'
        ==
      =/  rift
        .^  @ud 
            %j 
            %+  en-beam 
              [our.bowl %rift [%da now.bowl]] 
            /(scot %p ship)
        ==
      =+  send=(cury response:schooner eyre-id)
      %-  emil
      %-  flop
      %-  send
      :+  200 
        header-list
      :-  %json
      %-  pairs:enjs:format
      :~  [%url s+url]
          [%rift s+(scot %ud rift)]
      ==
    ==
  ==
--