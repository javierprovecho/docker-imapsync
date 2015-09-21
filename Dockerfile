FROM ubuntu:latest

RUN apt-get update && \
	apt-get install -y makepasswd rcs perl-doc libio-tee-perl git libmail-imapclient-perl libdigest-md5-file-perl libterm-readkey-perl libfile-copy-recursive-perl build-essential make automake libunicode-string-perl && \
	git clone git://github.com/imapsync/imapsync.git --depth 1 && \
	cd imapsync/ && \
	make install && \
	cpan -i Authen::NTLM Data::Uniqid Test::Pod

ENTRYPOINT ["/usr/bin/imapsync"]
