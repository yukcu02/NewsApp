## News App 
This News App is an iOS application developed using Swift. It consists of two pages and utilizes an API to fetch data from developer.nytimes.com. When the user taps on the second page, it opens the relevant website within the app using SafariView, allowing them to browse the site without leaving the application.

## Features 
The app retrieves current news articles from the New York Times API and presents them to the user.
The app is divided into two pages: the main page and the detail page.
On the main page, the user can view a list of news articles with their headlines and brief descriptions.
When the user taps on a news article, they are taken to the detail page.
On the detail page, the full article content is displayed along with additional information such as the author, publication date, and related images.
When the user taps on a link within the detail page, the SafariView opens, allowing them to view the full article on the New York Times website without leaving the app.
The app provides a seamless user experience by leveraging SafariView to maintain the app's context while browsing external content.
## Setup
To run the News App project, follow these steps:

Clone the repository to your local machine.
Open the project in Xcode.
Ensure that you have a valid API key from developer.nytimes.com.
Open the Constants.swift file and replace YOUR_API_KEY with your actual API key.
Build and run the project on the iOS simulator or a physical device.
Please note that you need an active internet connection for the app to fetch news articles from the New York Times API.

## Dependencies
The News App project uses the following dependencies:

Alamofire: Used for making network requests to the New York Times API.
SwiftyJSON: Used for parsing and handling JSON data returned by the API.
SafariServices: Used for presenting the SafariView to display the full article within the app.

## Contributing
Contributions to the News App project are welcome. If you encounter any issues or have suggestions for improvements, please open an issue on the GitHub repository.

## License
The News App project is released under the MIT License. You are free to modify and distribute the code for personal or commercial purposes.

## Contact
If you have any questions or need further assistance, please contact me at frknykc@hotmail.com
