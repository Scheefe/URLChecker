#!/bin/bash

SetParam() {
	export URLLISTE="urls.txt"
	export ZEITPUNKT=`date +%d.%m.%Y@%H:%M:%S`
	export LOGFILE="url-status.log"
}

StatusCode() {
	SetParam
	cat $URLLISTE | while read next
	do
		CODE=`curl --output /dev/null --silent --head --write-out '%{http_code}\n' $next`
	case $CODE in
		100) echo "Status vom $ZEITPUNKT von der URL $next: $CODE (Continue)" ;;
		101) echo "Status vom $ZEITPUNKT von der URL $next: $CODE (Switching Protocols)" ;;
		102) echo "Status vom $ZEITPUNKT von der URL $next: $CODE (Processing (WebDAV) (RFC 2518) )" ;;
		103) echo "Status vom $ZEITPUNKT von der URL $next: $CODE (Checkpoint)" ;;
		122) echo "Status vom $ZEITPUNKT von der URL $next: $CODE (Request-URI too long)" ;;
		200) echo "Status vom $ZEITPUNKT von der URL $next: $CODE (OK)" ;;
		201) echo "Status vom $ZEITPUNKT von der URL $next: $CODE (Created)" ;;
		202) echo "Status vom $ZEITPUNKT von der URL $next: $CODE (Accepted)" ;;
		203) echo "Status vom $ZEITPUNKT von der URL $next: $CODE (Non-Authoritative Information)" ;;
		204) echo "Status vom $ZEITPUNKT von der URL $next: $CODE (No Content)" ;;
		205) echo "Status vom $ZEITPUNKT von der URL $next: $CODE (Reset Content)" ;;
		206) echo "Status vom $ZEITPUNKT von der URL $next: $CODE (Partial Content)" ;;
		207) echo "Status vom $ZEITPUNKT von der URL $next: $CODE (Multi-Status (WebDAV) (RFC 4918) )" ;;
		208) echo "Status vom $ZEITPUNKT von der URL $next: $CODE (Already Reported (WebDAV) (RFC 5842) )" ;;
		226) echo "Status vom $ZEITPUNKT von der URL $next: $CODE (IM Used (RFC 3229) )" ;;
		300) echo "Status vom $ZEITPUNKT von der URL $next: $CODE (Multiple Choices)" ;;
		301) echo "Status vom $ZEITPUNKT von der URL $next: $CODE (Moved Permanently)" ;;
		302) echo "Status vom $ZEITPUNKT von der URL $next: $CODE (Found)" ;;
		303) echo "Status vom $ZEITPUNKT von der URL $next: $CODE (See Other)" ;;
		304) echo "Status vom $ZEITPUNKT von der URL $next: $CODE (Not Modified)" ;;
		305) echo "Status vom $ZEITPUNKT von der URL $next: $CODE (Use Proxy)" ;;
		306) echo "Status vom $ZEITPUNKT von der URL $next: $CODE (Switch Proxy)" ;;
		307) echo "Status vom $ZEITPUNKT von der URL $next: $CODE (Temporary Redirect (since HTTP/1.1))" ;;
		308) echo "Status vom $ZEITPUNKT von der URL $next: $CODE (Resume Incomplete)" ;;
		400) echo "Status vom $ZEITPUNKT von der URL $next: $CODE (Bad Request)" ;;
		401) echo "Status vom $ZEITPUNKT von der URL $next: $CODE (Unauthorized)" ;;
		402) echo "Status vom $ZEITPUNKT von der URL $next: $CODE (Payment Required)" ;;
		403) echo "Status vom $ZEITPUNKT von der URL $next: $CODE (Forbidden)" ;;
		404) echo "Status vom $ZEITPUNKT von der URL $next: $CODE (Not Found)" ;;
		405) echo "Status vom $ZEITPUNKT von der URL $next: $CODE (Method Not Allowed)" ;;
		406) echo "Status vom $ZEITPUNKT von der URL $next: $CODE (Not Acceptable)" ;;
		407) echo "Status vom $ZEITPUNKT von der URL $next: $CODE (Proxy Authentication Required)" ;;
		408) echo "Status vom $ZEITPUNKT von der URL $next: $CODE (Request Timeout)" ;;
		409) echo "Status vom $ZEITPUNKT von der URL $next: $CODE (Conflict)" ;;
		410) echo "Status vom $ZEITPUNKT von der URL $next: $CODE (Gone)" ;;
		411) echo "Status vom $ZEITPUNKT von der URL $next: $CODE (Length Required)" ;;
		412) echo "Status vom $ZEITPUNKT von der URL $next: $CODE (Precondition Failed)" ;;
		413) echo "Status vom $ZEITPUNKT von der URL $next: $CODE (Request Entity Too Large)" ;;
		414) echo "Status vom $ZEITPUNKT von der URL $next: $CODE (Request-URI Too Long)" ;;
		415) echo "Status vom $ZEITPUNKT von der URL $next: $CODE (Unsupported Media Type)" ;;
		416) echo "Status vom $ZEITPUNKT von der URL $next: $CODE (Requested Range Not Satisfiable)" ;;
		417) echo "Status vom $ZEITPUNKT von der URL $next: $CODE (Expectation Failed)" ;;
		500) echo "Status vom $ZEITPUNKT von der URL $next: $CODE (Internal Server Error)" ;;
		501) echo "Status vom $ZEITPUNKT von der URL $next: $CODE (Not Implemented)" ;;
		502) echo "Status vom $ZEITPUNKT von der URL $next: $CODE (Bad Gateway)" ;;
		503) echo "Status vom $ZEITPUNKT von der URL $next: $CODE (Service Unavailable)" ;;
		504) echo "Status vom $ZEITPUNKT von der URL $next: $CODE (Gateway Timeout)" ;;
		505) echo "Status vom $ZEITPUNKT von der URL $next: $CODE (HTTP Version Not Supported)" ;;
		esac
	done;
}

Main() {
	StatusCode
}
SetParam
Main | tee -a $LOGFILE