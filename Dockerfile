FROM  ubuntu:17.10

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		curl \
		wget \
		unzip \
		ca-certificates

RUN dpkg --add-architecture i386 \
		&& apt-get update \
		&& apt-get install -y cabextract \
		&& apt-get install -y --install-recommends \
		    winbind \
 		    wine32 \
		    xvfb \
		&& rm -rf /var/lib/apt/lists/*

ADD mt4 /u00/

ENV WINEARCH win32
ENV WINEPREFIX /u00/.wine
ENV WINEDEBUG="-ntdll,-ieframe,-win,-nls,-toolbar,-module,-mountmgr,-secur32,-mshtml,-imm,-winediag,-winsock,-iphlpapi,-ver"

WORKDIR '/u00'

ENTRYPOINT xvfb-run -a wine ./terminal.exe start.ini
