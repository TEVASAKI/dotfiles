Clone from gitHub

    git clone git@github.com:TEVASAKI/dotfiles.git


# Dropbox install

### Dropbox �{�̂� Home��Download ���ēW�J���ăA�J�E���g�R�t��
    $ wget -O dropbox-lnx.x86.tar.gz "https://www.dropbox.com/download?plat=lnx.x86"
    
    $ tar zxvf dropbox-lnx.x86.tar.gz
    
    $ ~/.dropbox-dist/dropboxd

**log**

This client is not linked to any account...
Please visit https://www.dropbox.com/cli_link?host_id=xxxxyyyyzzzz to link this machine.
Client successfully linked, Welcome tevasaki!
^C


### �Ǘ��X�N���v�g��Download���Ď��s������t���Ď��s�p�X�̒ʂ����ꏊ�ɔz�u
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

### status �I�v�V�����œ�������Ă��邩�m�F
`$ dropbox status`  
Idle

### �������O�������t�H���_��o�^
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

### ���O����Ă��邩���m�F
`$ dropbox exclude list`

**log**

photos  
public  
share  
tool  


