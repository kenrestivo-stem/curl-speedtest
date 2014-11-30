curl-speedtest
==============

A simple benchmark script that shows download and <b>upload</b> speed to multiple locations around the world, CPU speed, and I/O write speed.

The motivation behind this speedtest project is to give you a full picture of your network capabilities. A server serves content, which means the upload speed is extremely important and should not be neglected in a network benchmark test. Using standard utilities in Linux that people are familiar with, this network speed test should be a good base line and works well on minimalistic systems. <br>
<br><br><br>
wget dl.getipaddr.net/speedtest.sh 2>/dev/null -O- | bash <br>
or <br>
curl -s dl.getipaddr.net/speedtest.sh -o- | bash <br>
or <br>
wget https://raw.github.com/blackdotsh/curl-speedtest/master/speedtest.sh && bash speedtest.sh

Note: A 100MB test file is used by default to test the download and upload speeds, however, in some "exotic" locations, a 10MB file is used to save bandwidth.

SHA-1 sums are posted on http://dl.getipaddr.net feel free to check if that's the official release.

