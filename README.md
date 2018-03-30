# openwrt fdicctv 1.0.0
<p>percobaan openwrt fdicctv pertama</p>

<p style="color:red;">pastikan internet di router sudah sedia</p>
<p style="color:red;">peralatan yang di sediakan:</p>
<p style="color:red;">router openwrt [daya cukup]</p>
<p style="color:red;">usb flash / microsd + adapter [exroot]</p>
<p style="color:red;">web camera uvc/yuv support</p>
<p style="color:red;">usb hub [ yang recomended ]</p>
<p style="color:red;">usb audio [soudcard recomended]</p>

<p>buka putty pada openwrt shell command</p>
<pre>
opkg update
opkg install git git-http
export GIT_SSL_NO_VERIFY=1
git clone https://github.com/friyadhibiermann/fdicctv.git
cd fdicctv
chmod 0755 ./install
./install
</pre>

<p style="color:red;">laporkan jika ada error di group fb OPENWRT INDONSEIA</p>
<p>mari diskusi</p>
