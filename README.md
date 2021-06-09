# my_music

An application where the users can add/remove music albums to/from their collection, share them, whislist, Admin users can also add, modify or delete albums, bands, and more, and Mega also assign who is an Admin or a normal user

Future updates:
- [WIP]Add login/signup Screens and improve style
- Improve AvatarGlow https://pub.dev/packages/avatar_glow
- Add global styling to the app
- Add email Auth with Firebase (Email, password, name, type of user [Normal (adds/remove music albums,sharing), Admin (Normal + Add/Modify/Delete albums and bands ), Mega(Admin + add user as Admin/Normal + Create music styles) ])
- Display options (Drawer or BottomNavigationBar) depending of the type of user
- Manage Genre(Mega): A list of music genres to pick
- Manage Bands(Admin or Mega): String Description, String Members, id Genre, String From, bool Active, String Photo
- Manage Albums(Admin or Mega): Date Released, Date Recorded, id Genre, Time Length, List<String> tracks, String Title, Band Band, String Photo
- Add/Remove albums to my list
- Share the user collection


If I have enough time:

- Genres and Sub-genres: Pick Metal to choose between Black Metal, Doom Metal, Folk Metal, etc
- Members should be, instead of a String, a document of the Members Collection, to see where each musician has been played and it is playing
- Screen with Member info.