<?php

/**
 * THIS FILE HELPS US TO DISPACTH THE ROUTES AND CALL THE SUITABLE CONTROLLER
 **/

 $cleanRoute = explode('?', $_SERVER['REQUEST_URI']);// expload the route
 $route = $cleanRoute[0]; // Get the request URI

if ($route === '/') {
   require_once 'app/core/views/home.php';
}

elseif ($route === '/register') {
    require_once 'app/core/views/register.php';
}

elseif ($route === '/add-post') {
    require_once 'app/core/views/add_post.php';
}

elseif ($route === '/login') {
    require_once 'app/core/views/login.php';
}

elseif ($route === '/logout') {
    require_once 'app/core/controllers/user.php';
    $user = new User();
    $user -> logout();
}

elseif ($route === '/post') {
    require_once 'app/core/views/post.php';
}

else {
    echo '404 vous etes perdue ;(';
}

// author : @ptahemdjehuty
