## Rotten Tomatoes

This is a movies app displaying box office and top rental DVDs using the [Rotten Tomatoes API](http://developer.rottentomatoes.com/docs/read/JSON).

Time spent: `13`

### Features

#### Required

- [ done ] User can view a list of movies. Poster images load asynchronously.
- [ done ] User can view movie details by tapping on a cell.
- [ done ] User sees loading state while waiting for the API.
- [ done ] User sees error message when there is a network error: http://cl.ly/image/1l1L3M460c3C
- [ done ] User can pull to refresh the movie list.

#### Optional

- [ no ] All images fade in.
- [ no ] For the larger poster, load the low-res first and switch to high-res when complete.
- [ done ] All images should be cached in memory and disk: AppDelegate has an instance of `NSURLCache` and `NSURLRequest` makes a request with `NSURLRequestReturnCacheDataElseLoad` cache policy. I tested it by turning off wifi and restarting the app.
- [ no ] Customize the highlight and selection effect of the cell.
- [ some ] Customize the navigation bar.
- [ no ] Add a tab bar for Box Office and DVD.
- [ no ] Add a search bar: pretty simple implementation of searching against the existing table view data.

### Walkthrough
![Video Walkthrough](https://github.com/apfritts/RottenTomatoes/raw/master/Screencast.gif)

Credits
---------
* [Rotten Tomatoes API](http://developer.rottentomatoes.com/docs/read/JSON)
* [AFNetworking](https://github.com/AFNetworking/AFNetworking)
* [MRProgress](https://github.com/mrackwitz/MRProgress)

