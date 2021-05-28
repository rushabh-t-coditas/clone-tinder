# clone_tinder

The primary goal for building this app was for me to learn BLoC for state management and use Clean Coding Architecture
to manage and distribute the code in different layers.

This project is to implement a swipe-able stack of cards(using Draggable), which shows user's information.
Left/Right swipe action can be performed on the card, left swipe removes the user from the stack
whereas, right swipe will save the user in a Favorite's list, this list is stored offline.
A saved user can be deleted from the saved list by swiping right(using Dismissible).

# state management, architecture, packages used

I have used BLoC pattern for state management in this project(flutter_bloc package)
and used Clean Coding Architecture.
Sqlite to save the favorite user data locally(sqflite package)

# Some Screenshots


<img src="https://user-images.githubusercontent.com/78335579/119975366-634e1b80-bfd3-11eb-9da5-9f37070d3b66.jpeg" width = "250" height = "400" />\
Simple Text Splash Screen<br/>
<img src="https://user-images.githubusercontent.com/78335579/119975368-63e6b200-bfd3-11eb-99b5-1a6a13bd6044.jpeg" width="250" height="400" />\
Stack of Cards showing Users<br/>
<img src="https://user-images.githubusercontent.com/78335579/119975367-63e6b200-bfd3-11eb-81d7-32bc745bd668.jpeg" width="250" height="400" />\
Left/Right Swipe Action<br/>
<img src="https://user-images.githubusercontent.com/78335579/119975357-621cee80-bfd3-11eb-9827-22381aee4247.jpeg" width="250" height="400" />\
Relevant info of user on tapping of a button<br/>
<img src="https://user-images.githubusercontent.com/78335579/119975348-5f21fe00-bfd3-11eb-8d60-ef369fcfa923.jpeg" width="250" height="400" />\
Relevant info of a user on tapping the button<br/>
<img src="https://user-images.githubusercontent.com/78335579/119975363-62b58500-bfd3-11eb-9fa2-c5efb60b711b.jpeg" width="250" height="400" />\
List of saved users on right swipe, displayed in a different screen<br/>
<img src="https://user-images.githubusercontent.com/78335579/119975360-62b58500-bfd3-11eb-8331-a7a127ee316a.jpeg" width="250" height="400" />\
User detail displayed on another screen on tapping the list item
