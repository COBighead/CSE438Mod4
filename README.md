# CSE438_Mod4

Chongtian Zhang
Movie App

============= ReadMe =============

Feature 1: Watching movie related videos

In the movie detail page, an extra button is added	to navigate to video list page. In the video list, user can see all available videos relate to this movie. User can choose one to go ahead and watch it. User also can go back to list and choose different videos to watch.

I added two extra view controllers to include movie list and video player. Make further query to Tmdb api to get video information, then navigate to YouTube for video watching. Include new custom video classes to store information, tableview for showing video info and player for playing videos.

I add this feature since users may not only want see the poster and few pieces info of movie. Being able to watch trailers in the app will increase the interest of user in using app a lot.
 
Feature 2: Get trending movies 

When app is launched, weekly trending movie will be automatically fetched and show on the collectionview. User can also come back to the trending page later by selecting trending button in page. Also, user can see movie list by selecting among other three buttons: Popularity, Date and Rating.

I use separates function to get movie data of different types from Tmdb API. Upon launching or clicking "Trend" button, function will be called to load trending movie in the array. Clicking buttons will load corresponding movies into list.

I think user will be more satisfied if they enter the app with populated movie table comparing with empty screen. They will also get some hint from movie lists sorted by different standards rather than just looking up movies by themselves.

Feature 3: Browse History

When User click the poster to see details of movie, it will be recorded to history list, user can check History any time by switch tab bar button. Also, a clear button is provided at the bottom of history page.

I add a new view	controller to store the history page. In main page, when a movie is selected to see details, its title will be written into Userdefaults. History page will read the array from userdefaults.

Sometimes user will want to go back to certain movie they browsed before, however they may forget the name of movie, this is when history will help them out.  	
