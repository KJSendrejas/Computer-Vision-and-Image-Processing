'''
Different file format in image have different way to store the image data.
We use TiFF format because it is lossless and can store multiple channels.
'''

from PIL import Image
def show_image(image_path):
    try:
        img = Image.open(image_path)
        if img.mode != 'RGB':
            img = img.convert('RGB') #Change to L to convert to grayscale
        pixels = list(img.getdata())
        print(pixels)
        return pixels
    except Exception as e:
        print(f"Error opening image: {e}")
        return None

if __name__=="__main__":
    image_path = "resources\galaxy.png"
    show_image(image_path)

#this shows the array of the image

'''
image = Image.new('RGB', (9,9))
image.putdata(pixel_array)
'''