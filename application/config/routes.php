<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	https://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There are three reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router which controller/method to use if those
| provided in the URL cannot be matched to a valid route.
|
|	$route['translate_uri_dashes'] = FALSE;
|
| This is not exactly a route, but allows you to automatically route
| controller and method names that contain dashes. '-' isn't a valid
| class or method name character, so it requires translation.
| When you set this option to TRUE, it will replace ALL dashes in the
| controller and method URI segments.
|
| Examples:	my-controller/index	-> my_controller/index
|		my-controller/my-method	-> my_controller/my_method
*/
$route['default_controller'] = 'my_blog';
$route['404_override'] = 'notfound';
$route['translate_uri_dashes'] = FALSE;


// --- admin-blog ---
$route['admin'] = 'adminBlog';
$route['admin/dashboard-blog'] = 'adminBlog/dashboard_blog';

// --- about-blog ---
$route['admin/about-blog'] = 'adminBlog/about';
$route['admin/about-blog/edit/(:num)'] = 'adminBlog/about/edit_about/$1';
$route['admin/about-blog/detail/(:num)'] = 'adminBlog/about/detail_about/$1';
$route['admin/about-blog/delete/(:num)'] = 'adminBlog/about/delete_about/$1';

// --- end ---


// --- cerita-blog ---
$route['admin/blog/cerita'] = 'adminBlog/cerita';
$route['admin/blog/cerita/edit/(:num)'] = 'adminBlog/cerita/edit_cerita/$1';
$route['admin/blog/cerita/detail/(:num)'] = 'adminBlog/cerita/detail_cerita/$1';
$route['admin/blog/cerita/delete/(:num)'] = 'adminBlog/cerita/delete_cerita/$1';
// --- end ---

// --- daily life ---
$route['admin/blog/daily-life'] = 'adminBlog/daily_life';
$route['admin/blog/daily-life/edit/(:num)'] = 'adminBlog/daily_life/edit_daily_life/$1';
$route['admin/blog/daily-life/detail/(:num)'] = 'adminBlog/daily_life/detail_daily_life/$1';
$route['admin/blog/daily-life/delete/(:num)'] = 'adminBlog/daily_life/delete_daily_life/$1';
// --- end ---

// --- jalan jalan ----
$route['admin/blog/jalan-jalan'] = 'adminBlog/jalan_jalan';
$route['admin/blog/jalan-jalan/edit/(:num)'] = 'adminBlog/jalan_jalan/edit_jalan_jalan/$1';
$route['admin/blog/jalan-jalan/detail/(:num)'] = 'adminBlog/jalan_jalan/detail_jalan_jalan/$1';
$route['admin/blog/jalan-jalan/delete/(:num)'] = 'adminBlog/jalan_jalan/delete_jalan_jalan/$1';
// --- end ---

// --- books ---
$route['admin/books'] = 'adminBlog/books';
$route['admin/books/edit/(:num)'] = 'adminBlog/books/edit_books/$1';
$route['admin/books/detail/(:num)'] = 'adminBlog/books/detail_books/$1';
$route['admin/books/delete/(:num)'] = 'adminBlog/books/delete_books/$1';
// --- end books ---

// --- kontak ---
$route['admin/kontak'] = 'adminBlog/kontak';
$route['admin/kontak/edit/(:num)'] = 'adminBlog/kontak/edit_kontak/$1';
$route['admin/kontak/detail/(:num)'] = 'adminBlog/kontak/detail_kontak/$1';
$route['admin/kontak/delete/(:num)'] = 'adminBlog/kontak/delete_kontak/$1';
// --- end kontak ----

// --- blog ---

$route['about'] = 'my_blog/about';
$route['blog'] = 'my_blog/blog';
$route['books'] = 'my_blog/books';
$route['books/(:any)'] = 'my_blog/books/detail/$1';
$route['blog/(:any)'] = 'my_blog/blog/get_blog/$1';
