# Movieva

<p float="left">
<img src="https://github.com/kerimozek/Movieva/blob/main/Movieva/app%20images/movieva%20app.png" width=35%>
<img src="https://github.com/kerimozek/Movieva/blob/main/Movieva/app%20images/movieva%20app%202.png" width=35%>
</p>

## Description

### There are 3 sections in TabBar.
- First section
  - There is a horizontal scrolling collectionview at the top of the main screen. At the bottom, there are 3 different views created with container view. These views contain Latest - Popular and TopRated movies. You can scroll the collectionview cells unlimitedly because it is making new request from API with pagination method. You can tap on the movie that you like and go to the detail screen. When you go to the detail screen, you can add the movie to "WatchList" for later watch.
  
- Second section
  - Here again different movies are listed. Unlike the first screen, we can use the "Search" feature on this page to more easily access the movies we want. You can also access the detail page from this page and add it to the "WatchList".

- Last section
  - All the movies you have added to watchlist are listed here. You can add or remove from favorites at any time.
  
## TOOLS
  
### Swift
- Delegate
- Protocols
  
### UIKit
- Infinite Scroll CollectionView
- Dynamic TableView Cells
- TabBar
- SearchBar Controller
  
### Network
- API
- URLSession
  
### Database
- CoreData

### Library
- Kingfisher
