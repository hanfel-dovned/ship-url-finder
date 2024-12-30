You can obtain the host URL of any Urbit ship [by remote scrying that ship](https://github.com/hanfel-dovned/ship-url-finder/blob/master/desk/app/ship-url-getter.hoon#L94C7-L96C9). 

This is trivial within Urbit but hard from outside, so this app allows you to expose an HTTP endpoint on any ship that you can query the URL for any other ship at.

Install this desk on your running Urbit ship, and then send an HTTP request to [host-ship-url]/apps/ship-url-getter/[urbit-id] to receive the URL and `rift` of that ship as JSON.
