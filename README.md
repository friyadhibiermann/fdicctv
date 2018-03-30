# openwrt fdicctv 1.0.0
<p>percobaan openwrt fdicctv pertama</p>

<p>pastikan internet di router sudah sedia</p>
<p>peralatan yang di sediakan:</p>
<pre>
router openwrt [daya cukup]
usb flash / microsd + adapter [exroot]
web camera uvc/yuv support
usb hub [ yang recomended ]
usb audio [soudcard recomended]
</pre>

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
<p>PENTING DI TEST COMMAND BERIKUT:</p>
<pre>
command yang bisa di coba: 
fdi_cam start
fdi_cam stop
fdi_cam rec
fdi_cam mail
uci show fdicctv
</pre>
# preview
<img src="list.JPG"></p>
<img src="setting.JPG"></p>
<img src="view.JPG"></p>
