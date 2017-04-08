#NASA Photo Of the Day

"Nasa Photo of the Day" is an app developed to practice networking and API calls, JSON, MVC structure and Unit Tests. It downloads and displays NASA's Astronomy Photo of the Day, and allows the user to read the information about the photo as well as save and share the photo.

## Install

To check out my version of "NASA Photo of the Day":

1. Clone or download my repository:
` $ https://github.com/ginnypx1/NASAPhotoOfTheDay.git `

2. Enter the "NASA Photo of the Day" directory:
` $ cd /NASAPhotoOfTheDay-master/ `

3. Open "NASA Photo of the Day" in XCode:
` $ open NASAPhotoOfTheDay.xcodeproj `

To run the project in xCode, you will need to add a Private.swift file with your API key information:

```
let YOUR_API_KEY = <YOUR_API_KEY>
```

## Instructions

You can see NASA's Astronomy Photo of the day by simply opening the app. Clicking on the :star: icon in the lower left corner pulls up a view with all of the provided information about the photo.

To share the photo, click the **Share** icon in the upper-left-hand corner of the photo view.

## Technical Information

NASA's Astronomy Picture of the day API can be found at: https://catalog.data.gov/dataset/astronomy-picture-of-the-day-api

## Improvements

Right now I am loading the photo of the day as an Image View, to allow easy saving and sharing and also to practice converting JSON data into a totally different format. In the future, this should probably be changed to be a web view display, to handle the days when NASA decides to provide a YouTube video instead of a still photo.