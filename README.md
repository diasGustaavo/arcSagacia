# arcSagacia

## 🧾 Description 

An architecture style classifier made for iOS & iPadOS.

![IMG_3110](https://github.com/diasGustaavo/arcSagacia/assets/60455369/d36649e7-7f75-4284-97b2-f4782707019a)
![IMG_3111](https://github.com/diasGustaavo/arcSagacia/assets/60455369/975198e0-1a50-4e37-956f-0f911fbd073e)

## 📦 About the model

The model used transfer learning & applied fine-tuning based on the VGG16 model. It ran for 300 epochs, used 172 to train, 28 for validation & 50 for testing.
With the tf model ready, Core ML Tools was used to convert to CoreML & quantize with nbits = 8, 16. So there are 3 main models that can be chosen: arcSagaciaModel, arcSagacia16Model & arcSagacia8Model.
For general use, arcSagacia16Model is recommended as it's half the size of the original model & has similar precision.

## ⚙️ Frameworks & Dependencies Used

- [Keras](https://keras.io)
- [Tensorflow](https://www.tensorflow.org)
- [SwiftUI](https://developer.apple.com/documentation/swiftui/)
- [CoreML](https://developer.apple.com/documentation/coreml)
- [Core ML Tools](https://coremltools.readme.io/docs)
- [PhotoKit](https://developer.apple.com/documentation/photokit)
- [Firebase](https://cocoapods.org/pods/Firebase)

## 🔨 Build Instructions

1. Make an iOS Firebase [following this tutorial](https://firebase.google.com/docs/ios/setup), so u can get your own ````GoogleService-Info.plist````.

2. With Xcode >= 14 open, go to Source Control -> Clone -> Paste this repository link -> Clone.

3. Drag your own ````GoogleService-Info.plist```` into the navigator area.

4. Download one of the models: [arcSagaciaModel](https://www.icloud.com/iclouddrive/0celoRJL4Z-FX0eqxblFUIr8Q#arcSagaciaModel), [arcSagacia16Model](https://www.icloud.com/iclouddrive/08eK7gb5smw1lXzsfjq4jl2XQ#arcSagacia16Model), [arcSagacia8Model](https://www.icloud.com/iclouddrive/02bOf6mrFPvlnk-ryE4LMAZjA#arcSagacia8Model)

5. Drag the downloaded model into CoreML folder in the navigator area.

6. Run the app using ````⌘ + R````.
