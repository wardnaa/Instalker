import urllib.parse
url = "https://scontent-sin6-2.cdninstagram.com/v/t51.2885-15/e35/69316454_379314056080515_1283996940359928744_n.jpg?_nc_ht=scontent-sin6-2.cdninstagram.com\u0026_nc_cat=103\u0026_nc_ohc=IjwwVnOPBf0AX_2Yssx\u0026oh=e45d3f9f760b98b670d712d1f6e62d05\u0026oe=5E4065FC"

print(urllib.parse.unquote(url))
