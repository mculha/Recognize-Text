## Recognize Text

The app helps us scan an image and extract all text from it using Vision Framework. The app is inspired by the [**documentation**](https://developer.apple.com/documentation/vision/recognizing_text_in_images).

### Recognizing Text in Images
> One of Vision’s many powerful features is its ability to detect and recognize multilanguage text in images. You can use this functionality in your own apps to handle both real-time and offline use cases. In all cases, all of Vision’s processing happens on the user’s device to enhance performance and user privacy.

There are two ways during the time scanning. One of them is fast another one is accurate.

Fast:
  > The fast path uses the framework’s character-detection capabilities to find individual characters, and then uses a small machine learning model to recognize individual characters and words. This approach is similar to traditional optical character recognition (OCR).

Accurate: 
  > The accurate path uses a neural network to find text in terms of strings and lines, and then performs further analysis to find individual words and sentences. This approach is much more in line with how humans read text.

Both are selectable according to the app requirements. To minimize potential misreadings, the accurate way must be chosen.

The project scans the text as it is. If you have a particular structure the text can be organized as what the structure is such as a survey or an exam documentation vs.
