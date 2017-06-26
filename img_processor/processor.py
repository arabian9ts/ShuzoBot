from PIL import Image

img = Image.open('shuzo.png').convert('RGBA')
pixels = img.getdata()

newpixels = []
for pix in pixels:
    if pix[0] + pix[1] + pix[2] == 0:
        """ set your fore/background colors """
        newpixels.append((0, 0, 0, 0))
    else:
        newpixels.append((255, 255, 255, 255))

img.putdata(newpixels)
img.save('../shuzo.png', 'PNG')
