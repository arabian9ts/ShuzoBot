# ShuzoBot
tell the maxim quoted from Shozo Matsuoka


## About
ShuzoBot says the random maxim quoted from Shuzo Matsuoka.  
This requires iTerm2 command line environment and ruby processor.

## Install
    cd ~
    git clone https://github.com/arabian9ts/ShuzoBot
    cd ShuzoBot
    ./install.sh
    cd ../
    rm -rf ShuzoBot

## Notion
ShuzoBot shows Shuzo's image that has white color ASCII-ART.  
If your environment has white background, use ShuzoBot/img_processor/processor.py and change string color white -> the other.  

For example, if you have white background, ...

    from PIL import Image

    img = Image.open('shuzo.png').convert('RGBA')
    pixels = img.getdata()

    newpixels = []
    for pix in pixels:
         if pix[0] + pix[1] + pix[2] == 0:
         """ set your fore/background colors """
         newpixels.append((255, 255, 255, 255))
         else:
         newpixels.append((0, 0, 0, 0))

    img.putdata(newpixels)
    img.save('../shuzo.png', 'PNG')

Then, you can resize it as you like.  
## Enjoy your shell life !