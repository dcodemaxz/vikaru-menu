##### Perhatian ( Indonesian )

Jika kamu menggunakan chrome kamu bisa mengetuk titik 3 yang ada di pojok kanan atas lalu pilih opsi "Terjemahkan..."

---

Welcome
--------|
![](https://media.tenor.com/iVCiM9W7cvYAAAAd/welcome.gif)

# Vikaru-Bot

Vikaru-Bot is a bot that uses a template from the Autoresponder application and also uses additional plugins from Tasker and Termux, this bot is quite simple and can be developed yourself. 

## How to download this bot

- Open your terminal / [termux](https://github.com/termux/termux-app/releases/tag/v0.118.1)
- Give access to your device's internal storage
```
termux-setup-storage
```
- Update your termux ( opsional )
```
apt update && apt upgrade -y
```
```
pkg install git
```
```
pkg install bash
```
- Clone Vikaru-Bot repo
```
git clone https://github.com/dcodemaxz/Vikaru-Bot
```

- Enter the file storage directory
```
cd Vikaru-Bot
```

- Run the script vikaru.sh
```
bash vikaru.sh
```

## Required apps

1. [AutoResponder Wa](https://play.google.com/store/apps/dev?id=7857280643314172854) (subscribe/sell)
2. [Tasker](https://play.google.com/store/apps/details?id=net.dinglisch.android.taskerm) (sell)
3. [ContactsTask](https://play.google.com/store/apps/details?id=com.balda.contactstask) (free)
4. [AutoMail](https://www.google.com/url?sa=t&source=web&rct=j&opi=89978449&url=https://play.google.com/store/apps/details%3Fid%3Dcom.joaomgcd.autogmail%26hl%3Did%26referrer%3Dutm_source%253Dgoogle%2526utm_medium%253Dorganic%2526utm_term%253Daplikasi%2Bautomail%26pcampaignid%3DAPPU_1_v2QCZ6CrKeyJ4-EPhaS-4AQ&ved=2ahUKEwjghreuxPmIAxXsxDgGHQWSD0wQ5YQBegQIDBAC&usg=AOvVaw1y31sjS79VE0U_TperMzev) (sell)
5. [termux](https://github.com/termux/termux-app/releases/tag/v0.118.1) (free)

# Script feature info :

The following is a menu list from the "vikaru.sh" script.

## [1] Start

### Vikaru-Md | ( start )
- Start bot
```
npm start
```
- Enter the WhatsApp number (62: country code)
```
628xxxx
```
- Then copy the pairing code and enter the code via the WhatsApp notification that appears.
  
- Wait until it enters, then name the device as you wish.

- Then try sending a simple cmd to the bot number
```
/ping
```

## [2] Install

### Vikaru-Md | ( install )



##### Note :

Make sure you have the latest version of nodeJS to avoid errors.

How to install the latest nodeJS : 
>https://github.com/nodesource/distributions

<hr>
  
#### <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/Termux.svg/1280px-Termux.svg.png" alt="termux_logo" width="20"/> Termux :
Especially for termux users, I recommend using "nodejs-lts" for nodejs, which is the LongTermSupport version
```bash
pkg install nodejs-lts -y
```



### Ar-Vikaru-Bot | ( install )

This is an Autoresponder file template developed by [dcodemaxz](https://github.com/dcodemaxz)

The purpose of creating this template is to be able to use a WhatsApp bot that is easy to develop yourself without the need for coding and programming language skills.

##### Superiority 

The advantages of this bot are as follows :

- Multi Prefix & Multi Device
- No need to run using a server
- Registration System (save contact)
- Media sending system Vikaru-Md
- API System [Vikaru-Api](https://vikaru-api.bohr.io/) (error)
- Tasker System

##### Features

This bot has more than 100+ features that can definitely help you through its AI features, and it can also entertain you in your free time with its fun features.

Feature list :

- Main menu
- Other menu
- Owner menu
- Group menu
- Kerang menu
- Anime menu
- Islam menu
- Game menu
- System menu
- Akses-link
- Script-Termux
- Kalkulator 
- Api-Ai
   
#### Getting Started

1. Change to your name (owner) via [mt manager](https://pan.mt2.cn/mt/MT2.16.7.apk)

- <a href="https://">
   <img alt="Github" height="200px" src="https://pomf2.lain.la/f/td30ot.jpg">
  </a>

- <a href="https://">
   <img alt="Github" height="200px" src="https://pomf2.lain.la/f/awdvjzuq.jpg">
  </a>

- <a href="https://">
   <img alt="Github" height="200px" src="https://pomf2.lain.la/f/mx0kom.jpg">
  </a>

- <a href="https://">
   <img alt="Github" height="200px" src="https://pomf2.lain.la/f/tybe6il5.jpg">
  </a>

2. Import "Ar-Vikaru-bot.csv" file to Autoresponder
  
- <a href="https://">
   <img alt="Github" height="200px" src="https://files.catbox.moe/oiat1k.jpg">
  </a>
  
- <a href="https://">
    <img alt="Github" height="200px" src="https://files.catbox.moe/4rn197.jpg">
  </a>
  
---

3. Import "Ar-Vikaru-Input.csv" file to Ar Answer Replacement
   
- <a href="https://">
    <img alt="Github" height="200px" src="https://files.catbox.moe/0zjvmi.jpg">
  </a>
- <a href="https://">
    <img alt="Github" height="200px" src="https://files.catbox.moe/5mgwam.jpg">
  </a>
  
---

4. Go to Autoresponder settings and change "Automation" to like this
   
- <a href="https://">
    <img alt="Github" height="200px" src="https://files.catbox.moe/4wt63h.jpg">
  </a>
  
---

5. Then please change the settings according to your needs
   
---

6. Import the file "Tsk-Vikaru-plugin.xml" into the Tasker project and enable it
   
- <a href="https://">
    <img alt="Github" height="200px" src="https://files.catbox.moe/svogdw.jpg">
  </a>
- <a href="https://">
    <img alt="Github" height="200px" src="https://files.catbox.moe/o8pyi2.jpg">
  </a>
  
---

7. Then open the "ContactsTask" application and allow permissions from the application and allow/turn on always running in the background.
   
---

8. Open the "AutoMail" application and log in using the email account you want to use as the sender of the verification code message from the registration feature in the bot and allow/enable the app to always run in the background.
   
---

9. Make sure your internet and notifications are not problematic, And don't forget to allow the all application permissions and always allow the application to run in the background. - then start
    
- <a href="https://">
    <img alt="Github" height="200px" src="https://files.catbox.moe/rf1wal.jpg">
  </a>
  
---

10. Done, start using a simple command by typing :
    
```bash
/menu
```

##### Note

- Bots do not reply if they do not receive notifications, make sure the notification is sent correctly. If you open and read a message when someone sends a message, the notification will not come in and can cause bot not replying. and make sure you have a stable internet connection to receive messages.

- This bot prefix uses RegEx in almost all of its cmds, make sure you have basic knowledge about Regular Expression.

- This bot mostly uses Indonesian, if you want to use another language, please just request it to the owner.



### Update

This feature functions to update all files, make sure you back up the files before updating because the update will overwrite the files located in the ".vikaru-bot" directory

## Template Info 

You can buy this script via this [Telegram](https://t.me/dcodemaxz)

Or you can also contact this WhatsApp number :
```
+6289508899033
```


Get file :

- Ar-Vikaru-Bot.csv
- Ar-Vikaru-Input.csv
- Tsk-Vikaru-Plugin.xml
- base-vikaru-md

Buyer benefits :

- Get token for file access
- Get free updates ( No Expired )
- Updates 4 times/month 
- Given guidance to modify
- Guided to be able to develop bots

You can also use and see the bot features via community [group](https://chat.whatsapp.com/JfpGsd5GPh5EzvRVjm54tx)

## Contributing

Feel free to contribute by opening issues or pull requests. Your feedback and contributions are highly appreciated.

### License

This project is licensed under the [MIT License](LICENSE).
