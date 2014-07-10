Clone from gitHub

    git clone git@github.com:TEVASAKI/dotfiles.git


# Dropbox install

### Dropbox 本体を HomeにDownload して展開してアカウント紐付け
    $ wget -O dropbox-lnx.x86.tar.gz "https://www.dropbox.com/download?plat=lnx.x86"
    
    $ tar zxvf dropbox-lnx.x86.tar.gz
    
    $ ~/.dropbox-dist/dropboxd

**log**

This client is not linked to any account...  
Please visit https://www.dropbox.com/cli_link?host_id=xxxxyyyyzzzz to link this machine.  
Client successfully linked, Welcome tevasaki!  
^C  


### 管理スクリプトをDownloadして実行権限を付けて実行パスの通った場所に配置
    $ wget -O dropbox.py "https://www.dropbox.com/download?dl=packages/dropbox.py"
    
    $ chmod 700 dropbox.py
    
    # mv dropbox.py /usr/local/bin/dropbox
    
    $ dropbox start -i

**log**

Starting Dropbox...  
Dropbox is the easiest way to share and store your files online. Want to learn more? Head to https://www.dropbox.com/  
   
In order to use Dropbox, you must download the proprietary daemon.  
Note: python-gpgme is not installed, we will not be able to verify binary signatures. [y/n] y  
Downloading Dropbox... 100%  
Unpacking Dropbox... 100%  
Done!  

### status オプションで同期されているか確認
`$ dropbox status`  
Idle

### 同期除外したいフォルダを登録
`$ dropbox exclude add ~/Dropbox/Photos/`

Excluded:  
photos  
 
`$ dropbox exclude add ~/Dropbox/public/`

Excluded:  
public  
 
`$ dropbox exclude add ~/Dropbox/share/`

Excluded:  
share  
 
`$ dropbox exclude add ~/Dropbox/tool/`

Excluded:  
tool  

### 除外されているかを確認
`$ dropbox exclude list`

**log**

photos  
public  
share  
tool  

### dropbox.py のオプション一覧
`$ Dropbox --help`

Dropbox command-line interface  
  
commands:  
  
Note: use dropbox help <command> to view usage for a specific command.  
  
 *status*   get current status of the dropboxd  
 *help*   provide help  
 *puburl*   get public url of a file in your dropbox  
 *stop*   stop dropboxd  
 *running*   return whether dropbox is running  
 *start*   start dropboxd  
 *filestatus*   get current sync status of one or more files  
 *ls*   list directory contents with current sync status  
 *autostart*   automatically start dropbox at login  
 *exclude*   ignores/excludes a directory from syncing  
 *lansync*   enables or disables LAN sync  
