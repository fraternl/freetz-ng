default_password_set() {
        [ "$MOD_HTTPD_PASSWD" == '$1$$zO6d3zi9DefdWLMB.OHaO.' ] || [ "$MOD_HTTPD_PASSWD" == "$(md5pw "$BACKPASS")"  ]
}

md5pw() { /bin/busybox cryptpw -m md5 -S "" "$1"; }

BACKPASS=`grep '^webgui_pass'  /proc/sys/urlader/environment | awk '{print $2}' | egrep -o '[a-z]+[0-9]+'`

if default_password_set; then
	print_warning "$(lang \
	  de:"Standard-Passwort gesetzt. <a href=\"/cgi-bin/passwd.cgi\">Bitte &auml;ndern!</a> " \
	  en:"Default password set. <a href=\"/cgi-bin/passwd.cgi\">Please change!</a>" \
	)"
fi
