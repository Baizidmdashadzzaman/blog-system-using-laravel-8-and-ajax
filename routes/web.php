<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\backend\Usercontroller;
use App\Http\Controllers\backend\CategoryController;
use App\Http\Controllers\backend\CustomerController;
use App\Http\Controllers\backend\SettingController;
use App\Http\Controllers\backend\BlogController;
use App\Http\Controllers\backend\ContactMessageController;
use App\Http\Controllers\HomeController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', [HomeController::class, 'index'])->name('front.home');
Route::get('/contact', [HomeController::class, 'contact'])->name('front.contact');
Route::get('/blog/{id}', [HomeController::class, 'blog_view'])->name('front.blog.view');
Route::get('/blogs-all', [HomeController::class, 'blogs'])->name('front.blog');

Route::get('/login', [Usercontroller::class, 'login'])->name('login');
Route::post('/login-try', [Usercontroller::class, 'try_login'])->name('admin.login.try');
//ADMIN PROTECTED ROUTE START

Route::group(['prefix' => 'laravel-filemanager', 'middleware' => ['web', 'auth']], function () {
  \UniSharp\LaravelFilemanager\Lfm::routes();
});

Route::group(['middleware' => 'auth:web'], function () {
    
         //USER ROUTE
           Route::get('/admin-dashboard', [UserController::class, 'dashboard'])->name('admin.dashboard');
           Route::get('/admin-dashboard/admin-logout', [UserController::class, 'logout'])->name('admin.logout');
           Route::get('/admin-dashboard/changepassword', [UserController::class, 'change_password'])->name('admin.changepassword');
           Route::post('/admin-dashboard/changepassword', [UserController::class, 'change_password_try'])->name('admin.changepassword');
           
           Route::get('/admin-dashboard/user-list', [UserController::class, 'index'])->name('admin.user.list');
           Route::get('/admin-dashboard/user-create', [UserController::class, 'user_create'])->name('admin.user.create');
           Route::post('/admin-dashboard/user-store', [UserController::class, 'store'])->name('admin.user.store');
           Route::get('/admin-dashboard/user-edit/{id}', [UserController::class, 'edit'])->name('admin.user.edit');
           Route::get('/admin-dashboard/user-show/{id}', [UserController::class, 'user_show'])->name('admin.user.show');
           Route::post('/admin-dashboard/user-update/{id}', [UserController::class, 'update'])->name('admin.user.update');
           Route::delete('/admin-dashboard/user-delete/{id}', [UserController::class, 'destroy'])->name('admin.user.delete');
           Route::post('/admin-dashboard/user-search', [UserController::class, 'user_search'])->name('admin.user.search'); 
           Route::get('/admin-dashboard/user-addpermission/{id}', [UserController::class, 'user_addpermission'])->name('admin.user.addpermission');
           Route::post('/admin-dashboard/user-savepermissin', [UserController::class, 'user_savepermissin'])->name('admin.user.savepermissin');	   
         //USER ROUTE
         
         //SYSTEM SETTING ROUTE
           Route::get('/admin-dashboard/system-setting', [SettingController::class, 'index'])->name('admin.system.setting');
           Route::post('/admin-dashboard/system-setting-update', [SettingController::class, 'store'])->name('admin.system.setting.update');	  
         //SYSTEM SETTING ROUTE
         

    
         //CATEGORY ROUTE
           Route::get('/admin-dashboard/category-list', [CategoryController::class, 'index'])->name('admin.category.list');
           Route::get('/admin-dashboard/category-create', [CategoryController::class, 'create'])->name('admin.category.create');
           Route::post('/admin-dashboard/category-store', [CategoryController::class, 'store'])->name('admin.category.store');
           Route::get('/admin-dashboard/category-edit/{id}', [CategoryController::class, 'edit'])->name('admin.category.edit');
           Route::get('/admin-dashboard/category-show/{id}', [CategoryController::class, 'show'])->name('admin.category.show');
           Route::post('/admin-dashboard/category-update/{id}', [CategoryController::class, 'update'])->name('admin.category.update');
           Route::delete('/admin-dashboard/category-delete/{id}', [CategoryController::class, 'destroy'])->name('admin.category.delete');
           Route::post('/admin-dashboard/category-search', [CategoryController::class, 'search'])->name('admin.category.search');  
         //CATEGORY ROUTE

         //CUSTOMER ROUTE
           Route::get('/admin-dashboard/customer-list', [CustomerController::class, 'index'])->name('admin.customer.list');
           Route::get('/admin-dashboard/customer-create', [CustomerController::class, 'create'])->name('admin.customer.create');
           Route::post('/admin-dashboard/customer-store', [CustomerController::class, 'store'])->name('admin.customer.store');
           Route::get('/admin-dashboard/customer-edit/{id}', [CustomerController::class, 'edit'])->name('admin.customer.edit');
           Route::get('/admin-dashboard/customer-show/{id}', [CustomerController::class, 'show'])->name('admin.customer.show');
           Route::post('/admin-dashboard/customer-update/{id}', [CustomerController::class, 'update'])->name('admin.customer.update');
           Route::delete('/admin-dashboard/customer-delete/{id}', [CustomerController::class, 'destroy'])->name('admin.customer.delete');
           Route::post('/admin-dashboard/customer-search', [CustomerController::class, 'search'])->name('admin.customer.search');  
         //CUSTOMER ROUTE

         //CUSTOMER ROUTE
         Route::get('/admin-dashboard/blog-list', [BlogController::class, 'index'])->name('admin.blog.list');
         Route::get('/admin-dashboard/blog-create', [BlogController::class, 'create'])->name('admin.blog.create');
         Route::post('/admin-dashboard/blog-store', [BlogController::class, 'store'])->name('admin.blog.store');
         Route::get('/admin-dashboard/blog-edit/{id}', [BlogController::class, 'edit'])->name('admin.blog.edit');
         Route::get('/admin-dashboard/blog-show/{id}', [BlogController::class, 'show'])->name('admin.blog.show');
         Route::post('/admin-dashboard/blog-update/{id}', [BlogController::class, 'update'])->name('admin.blog.update');
         Route::delete('/admin-dashboard/blog-delete/{id}', [BlogController::class, 'destroy'])->name('admin.blog.delete');
         Route::post('/admin-dashboard/blog-search', [BlogController::class, 'search'])->name('admin.blog.search');  
        //CUSTOMER ROUTE
        
        //CONTACT ROUTE
         Route::get('/admin-dashboard/contactmessage-list', [ContactMessageController::class, 'index'])->name('admin.contactmessage.list');
         Route::get('/admin-dashboard/contactmessage-create', [ContactMessageController::class, 'create'])->name('admin.contactmessage.create');
         
         Route::get('/admin-dashboard/contactmessage-edit/{id}', [ContactMessageController::class, 'edit'])->name('admin.contactmessage.edit');
         Route::get('/admin-dashboard/contactmessage-show/{id}', [ContactMessageController::class, 'show'])->name('admin.contactmessage.show');
         Route::post('/admin-dashboard/contactmessage-update/{id}', [ContactMessageController::class, 'update'])->name('admin.contactmessage.update');
         Route::delete('/admin-dashboard/contactmessage-delete/{id}', [ContactMessageController::class, 'destroy'])->name('admin.contactmessage.delete');
         Route::post('/admin-dashboard/contactmessage-search', [ContactMessageController::class, 'search'])->name('admin.contactmessage.search');  
        //CONTACT ROUTE
        
    
    
    });
    //ADMIN PROTECTED ROUTE END
//Auth::routes();
Route::post('/admin-dashboard/contactmessage-store', [ContactMessageController::class, 'store'])->name('admin.contactmessage.store');
Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
