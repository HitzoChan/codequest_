Debugging TLS issues for CodeQuest (debug-only guidance)

Purpose
- This file explains the safe debug steps included in the repository to help you diagnose TLS/SSL handshake failures seen in Chromium/WebView (e.g. `net_error -200`).

What was added
- `android/app/src/debug/res/xml/network_security_config.xml`
  - Debug-only network security config that trusts `system` and `user` certificate stores for `drive.google.com`.
- `android/app/src/debug/AndroidManifest.xml`
  - Debug manifest overlay that points the debug app to the debug network security config.

How to use (safe, local debug)
1. When running a debug build (`flutter run --debug`), the app will use the debug network security config.
2. If your network uses a custom/intercepting proxy (corporate VPN, antivirus, or testing proxy) that replaces certificates with its own CA, you must install that CA on the device to allow the debug app to trust it.

Install a CA on an Android device
1. Copy the CA certificate (PEM or DER) to the device:
   adb push C:\path\to\my-ca.crt /sdcard/my-ca.crt
2. On the device, open Settings → Security → Install from storage (or open the file using a file manager) and install the certificate.
3. Confirm the certificate is listed under "Trusted credentials" → "User".

Run and test
1. Build/run the debug app:
   flutter run --debug
2. Reproduce the problem (open/download the PDF). If the cause was a proxy replacing certs with a user CA, the debug build should now succeed.

Important notes
- This debug configuration is ONLY enabled for debug builds (it lives under `android/app/src/debug`). It will not affect release builds.
- Do NOT trust user CAs in production. The correct long-term fix is to ensure the server uses a valid CA-signed certificate and presents the full intermediate chain.

Production fixes (recommended)
- If the failing host is your own backend:
  - Use a CA-signed certificate (Let's Encrypt is a free option).
  - Ensure the server sends the full certificate chain (including intermediate certificates).
  - Verify with `openssl s_client -connect host:443 -servername host -showcerts` and with https://www.ssllabs.com/ssltest/.
- If the failing host is third-party (e.g., Google Drive) and your device fails to validate the certificate:
  - Check device time (clock skew causes validation failures).
  - Check for intercepting proxies or antivirus on the network/device.
  - Update Android System WebView / Play Services on the device.

If you want me to:
- Help run `openssl s_client` or `curl -v` against the host and analyze the chain, paste the output here.
- Walk through installing a Let's Encrypt certificate on your server (tell me server type: Nginx/Apache).
- Add a short script to produce an APK signed for debugging with the overlay already included.
