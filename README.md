# my_music

An application where the users can add/remove music albums to/from their collections, share them, whislist, Admin users can also add, modify or delete albums, bands, and more, and Mega also assign who is an Admin or a normal user

Future updates:
- [WIP] Manage Genre(Mega): A list of music genres to pick. Only a list. FAB to Add a new Genre as a Modal, Edit on Modal, Delete on Confirmation 
- Add login/signup validation
- Improve login/signup Screens style
- Improve AvatarGlow https://pub.dev/packages/avatar_glow
- Add global styling to the app
- Manage Bands(Admin or Mega): String name, String Description, String Members, id Genre, String From, bool Active, String Photo
- Manage Albums(Admin or Mega): Date Released, id Genre, Time Length, List<String> tracks, String Title, Band Band, String Photo
- Add/Remove albums to my list
- Share the user collection
- Share the user list
- Add album to the wishlist/collection somehow (List of Save/Fav Icons on the AppBar? FAB?)
- Database relational with Back4App or Firebase?

If I have enough time:

- Auto-login on registration (On user registration, pass the info to the FirebaseAuth.instance)
- Create AppBar widget and share it with all app screens?
- Genres and Sub-genres: Pick Metal to choose between Black Metal, Doom Metal, Folk Metal, etc
- Members should be, instead of a String, an entry of the Members Table, to see where each musician has been played and it is playing
- Screen with Member info.