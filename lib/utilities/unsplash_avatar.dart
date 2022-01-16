String _unsplashUrl = 'https://images.unsplash.com/photo';
String _parameters = 'fit=facearea&facepad=2&w=256&h=256&q=80';

String unsplashAvatar(String id) => '$_unsplashUrl-$id?$_parameters';
