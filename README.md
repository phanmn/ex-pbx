# ExPbx

```iex
:nksip_uac.options(:client, "sip:127.0.0.1", [{:get_meta,[:reason_phrase]}])

:nksip_uac.register(:client, "sip:127.0.0.1", [{:sip_pass, "1234"}, :contact, {:get_meta, [<<"contact">>]}])

:nksip_uac.register(:client, "sip:127.0.0.1", [{:sip_pass, "1234"}])

:nksip_uac.register(:client, "sip:127.0.0.1", [{:sip_pass, "1234"}, :contact, {:get_meta, [<<"contact">>]}])

:nksip_uac.register(:client, "<sip:127.0.0.1;transport=tcp>", [{:sip_pass, "1234"}, :contact, {:get_meta, [<<"contact">>]}])

:nksip_uac_auto_register.start_ping(:client, :ping1, "<sip:127.0.0.1:5060;transport=tcp>", [{:expires, 5}])
```