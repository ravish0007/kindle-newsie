# Kindle-Newsie
News and Magazines to your ebook reader.

>  Receive news at 6 AM, Everyday :)

## Prerequisites
  - [**Google App Password**](https://support.google.com/accounts/answer/185833?hl=en), as this involves mailing to your kindle 
  - [**Kindle Email**](https://www.amazon.in/gp/help/customer/display.html?nodeId=G7V489F2ZZU9JJGE), works for both Kindle app and device
  - [Guide](https://www.amazon.in/gp/help/customer/display.html/ref=hp_left_v4_sib?ie=UTF8&nodeId=GX9XLEVV8G4DB28H), to setup email address to recieve docs to your kindle 

## Install

### Linux (Debian based)
1. Clone repository
   `git clone https://github.com/ravish0007/kindle-newsie` 
2. Go to the directory
   `cd kindle-newsie`
3. Modify *"config.ini"* to put your creds
4. Add raw urls of calibre recipes in **"recipes.url"** which exists here, [calibre/recipes](https://github.com/kovidgoyal/calibre/tree/master/recipes)
5. Modify **"setup.sh"** to update cron timing (default 6 AM system clock) and execute
   `bash setup.sh`
   
 ## Credits
 [Calibre](https://github.com/kovidgoyal/calibre)
 
 ## Extra
 [Bake your own recipe](https://manual.calibre-ebook.com/news.html)
