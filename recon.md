recon method

1. whatweb domain

	`ww=$(whatweb $domain| grep "200 OK")` 
yeh commmand apne ko sirf whi output degi jo kaam ke hai
	```echo "$ww"
	url=$(whatweb $domain |grep "200 OK"| awk '{print $1}')```
isse apn voh url extract krenge jo working mai hai.
	```echo "$url"```
---
2. go spider

	```gs=$(gospider -s "$url" -o output -t 10)``` 
isme apn go spider mai domain de rhe hai aur yeh apne ko ek text file degi output folder mai
	```echo "$gs"```
---
3. gobuster

	```gb=$(gobuster dns --domain admin.tugoz.com -w /usr/share/wordlists/dirb/common.txt)```
isme apn brute forcing karenge domain taki jo important files spider mai nhi aai voh mil jae.
---
4. wayback machine
	#isme apn wayback machine ko use krke data archive nikalenge ki voh kab update ki gyi hai kyonki update se pehle sab archive banate hai agr glt hhogi toh isslie

---
* now take the data from output folder of go spider which is in txt format and convert it in db by seperating values
data output is in form		[form] - https://www.realself.com/


if output is [javascript] - https://assets.realself.com/rs-frontend/v1/_next/static/chunks/polyfills-0498b55704b6caa5c326.js


if output is [linkfinder] - [from: https://assets.realself.com/rs-frontend/v1/_next/static/CeCXzP5hWP-1iATzHlx44/_buildManifest.js] - /auth


#table
|format|url|interestingfiles|
|----|----------------|----|
|form|https://www.realself.com|-|
|javascript|https://assets.realself.com/rs-frontend/v1/_next/static/chunks/polyfills-0498b55704b6caa5c326.js|-|
|linkfinder|https://assets.realself.com/rs-frontend/v1/_next/static/CeCXzP5hWP-1iATzHlx44/_buildManifest.js|/auth|


