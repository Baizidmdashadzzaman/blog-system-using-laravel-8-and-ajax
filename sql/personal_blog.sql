-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 17, 2021 at 06:29 AM
-- Server version: 5.7.33
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `personal_blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `blog_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blog_thumnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blog_short_description` longtext COLLATE utf8mb4_unicode_ci,
  `blog_description` longtext COLLATE utf8mb4_unicode_ci,
  `wistia_link` longtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `blog_type` tinyint(1) NOT NULL DEFAULT '0',
  `read_count` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `category_id`, `blog_title`, `blog_thumnail`, `blog_short_description`, `blog_description`, `wistia_link`, `status`, `blog_type`, `read_count`, `created_at`, `updated_at`) VALUES
(2, 3, 'Laravel 8 CRUD Application Tutorial for Beginners', '1631859669laravek-8-crud.png', 'In this tutorial, i would like to show you laravel 8 crud operation example. we will implement a laravel 8 crud application for beginners. i will give you simple example of how to create crud in laravel 8. you will learn crud operation in laravel 8.', '<p>In this tutorial, i would like to show you laravel 8 crud operation example. we will implement a laravel 8 crud application for beginners. i will give you simple example of how to create crud in laravel 8. you will learn crud operation in laravel 8.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>So, let&#39;s follow few step to create example of laravel 8 crud application tutorial.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Laravel 8 is just released by yesterday, Laravel 8 gives several new features and LTS support. So if you are new to laravel then this tutorial will help you create insert update delete application in laravel 8.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>You just need to follow few step and you will get basic crud stuff using controller, model, route, bootstrap 4 and blade..</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>In this tutorial, you will learn very basic crud operation with laravel new version 6. I am going to show you step by step from scratch so, i will better to understand if you are new in laravel.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img src=\"https://www.itsolutionstuff.com/upload/laravek-8-crud.png\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Step 1 : Install Laravel 8</strong></p>\r\n\r\n<p>first of all we need to get fresh Laravel 8 version application using bellow command, So open your terminal OR command prompt and run bellow command:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<pre>\r\n\r\n&nbsp;</pre>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>composer create-project --prefer-dist laravel/laravel blog</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Step 2: Database Configuration</strong></p>\r\n\r\n<p>In second step, we will make database configuration for example database name, username, password etc for our crud application of laravel 8. So let&#39;s open .env file and fill all details like as bellow:</p>\r\n\r\n<p>.env</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<pre>\r\n\r\n&nbsp;</pre>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>DB_CONNECTION=mysql</p>\r\n\r\n<p>DB_HOST=127.0.0.1</p>\r\n\r\n<p>DB_PORT=3306</p>\r\n\r\n<p>DB_DATABASE=here your database name(blog)</p>\r\n\r\n<p>DB_USERNAME=here database username(root)</p>\r\n\r\n<p>DB_PASSWORD=here database password(root)</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Read Also: <a href=\"https://www.itsolutionstuff.com/post/whats-new-in-laravel-8-laravel-8-new-featuresexample.html\" target=\"_blank\">What&#39;s New in Laravel 8 | Laravel 8 New Features</a></p>\r\n\r\n<p><strong>Step 3: Create Migration</strong></p>\r\n\r\n<p>we are going to create crud application for product. so we have to create migration for &quot;products&quot; table using Laravel 8 php artisan command, so first fire bellow command:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<pre>\r\n\r\n&nbsp;</pre>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>php artisan make:migration create_products_table --create=products</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>After this command you will find one file in following path &quot;database/migrations&quot; and you have to put bellow code in your migration file for create products table.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<pre>\r\n\r\n&nbsp;</pre>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&lt;?php</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>use Illuminate\\Database\\Migrations\\Migration;</p>\r\n\r\n<p>use Illuminate\\Database\\Schema\\Blueprint;</p>\r\n\r\n<p>use Illuminate\\Support\\Facades\\Schema;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>class CreateProductsTable extends Migration</p>\r\n\r\n<p>{</p>\r\n\r\n<p>/**</p>\r\n\r\n<p>* Run the migrations.</p>\r\n\r\n<p>*</p>\r\n\r\n<p>* @return void</p>\r\n\r\n<p>*/</p>\r\n\r\n<p>public function up()</p>\r\n\r\n<p>{</p>\r\n\r\n<p>Schema::create(&#39;products&#39;, function (Blueprint $table) {</p>\r\n\r\n<p>$table-&gt;id();</p>\r\n\r\n<p>$table-&gt;string(&#39;name&#39;);</p>\r\n\r\n<p>$table-&gt;text(&#39;detail&#39;);</p>\r\n\r\n<p>$table-&gt;timestamps();</p>\r\n\r\n<p>});</p>\r\n\r\n<p>}</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>/**</p>\r\n\r\n<p>* Reverse the migrations.</p>\r\n\r\n<p>*</p>\r\n\r\n<p>* @return void</p>\r\n\r\n<p>*/</p>\r\n\r\n<p>public function down()</p>\r\n\r\n<p>{</p>\r\n\r\n<p>Schema::dropIfExists(&#39;products&#39;);</p>\r\n\r\n<p>}</p>\r\n\r\n<p>}</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Now you have to run this migration by following command:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<pre>\r\n\r\n&nbsp;</pre>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>php artisan migrate</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Step 4: Add Resource Route</strong></p>\r\n\r\n<p>Here, we need to add resource route for product crud application. so open your &quot;routes/web.php&quot; file and add following route.</p>\r\n\r\n<p>routes/web.php</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<pre>\r\n\r\n&nbsp;</pre>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>use App\\Http\\Controllers\\ProductController;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Route::resource(&#39;products&#39;, ProductController::class);</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Step 5: Add Controller and Model</strong></p>\r\n\r\n<p>In this step, now we should create new controller as ProductController. So run bellow command and create new controller. bellow controller for create resource controller.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<pre>\r\n\r\n&nbsp;</pre>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>php artisan make:controller ProductController --resource --model=Product</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>After bellow command you will find new file in this path &quot;app/Http/Controllers/ProductController.php&quot;.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>In this controller will create seven methods by default as bellow methods:</p>\r\n\r\n<p>1)index()</p>\r\n\r\n<p>2)create()</p>\r\n\r\n<p>3)store()</p>\r\n\r\n<p>4)show()</p>\r\n\r\n<p>5)edit()</p>\r\n\r\n<p>6)update()</p>\r\n\r\n<p>7)destroy()</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>So, let&#39;s copy bellow code and put on ProductController.php file.</p>\r\n\r\n<p>app/Http/Controllers/ProductController.php</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<pre>\r\n\r\n&nbsp;</pre>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&lt;?php</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>namespace App\\Http\\Controllers;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>use App\\Models\\Product;</p>\r\n\r\n<p>use Illuminate\\Http\\Request;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>class ProductController extends Controller</p>\r\n\r\n<p>{</p>\r\n\r\n<p>/**</p>\r\n\r\n<p>* Display a listing of the resource.</p>\r\n\r\n<p>*</p>\r\n\r\n<p>* @return \\Illuminate\\Http\\Response</p>\r\n\r\n<p>*/</p>\r\n\r\n<p>public function index()</p>\r\n\r\n<p>{</p>\r\n\r\n<p>$products = Product::latest()-&gt;paginate(5);</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>return view(&#39;products.index&#39;,compact(&#39;products&#39;))</p>\r\n\r\n<p>-&gt;with(&#39;i&#39;, (request()-&gt;input(&#39;page&#39;, 1) - 1) * 5);</p>\r\n\r\n<p>}</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>/**</p>\r\n\r\n<p>* Show the form for creating a new resource.</p>\r\n\r\n<p>*</p>\r\n\r\n<p>* @return \\Illuminate\\Http\\Response</p>\r\n\r\n<p>*/</p>\r\n\r\n<p>public function create()</p>\r\n\r\n<p>{</p>\r\n\r\n<p>return view(&#39;products.create&#39;);</p>\r\n\r\n<p>}</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>/**</p>\r\n\r\n<p>* Store a newly created resource in storage.</p>\r\n\r\n<p>*</p>\r\n\r\n<p>* @param \\Illuminate\\Http\\Request $request</p>\r\n\r\n<p>* @return \\Illuminate\\Http\\Response</p>\r\n\r\n<p>*/</p>\r\n\r\n<p>public function store(Request $request)</p>\r\n\r\n<p>{</p>\r\n\r\n<p>$request-&gt;validate([</p>\r\n\r\n<p>&#39;name&#39; =&gt; &#39;required&#39;,</p>\r\n\r\n<p>&#39;detail&#39; =&gt; &#39;required&#39;,</p>\r\n\r\n<p>]);</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Product::create($request-&gt;all());</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>return redirect()-&gt;route(&#39;products.index&#39;)</p>\r\n\r\n<p>-&gt;with(&#39;success&#39;,&#39;Product created successfully.&#39;);</p>\r\n\r\n<p>}</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>/**</p>\r\n\r\n<p>* Display the specified resource.</p>\r\n\r\n<p>*</p>\r\n\r\n<p>* @param \\App\\Product $product</p>\r\n\r\n<p>* @return \\Illuminate\\Http\\Response</p>\r\n\r\n<p>*/</p>\r\n\r\n<p>public function show(Product $product)</p>\r\n\r\n<p>{</p>\r\n\r\n<p>return view(&#39;products.show&#39;,compact(&#39;product&#39;));</p>\r\n\r\n<p>}</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>/**</p>\r\n\r\n<p>* Show the form for editing the specified resource.</p>\r\n\r\n<p>*</p>\r\n\r\n<p>* @param \\App\\Product $product</p>\r\n\r\n<p>* @return \\Illuminate\\Http\\Response</p>\r\n\r\n<p>*/</p>\r\n\r\n<p>public function edit(Product $product)</p>\r\n\r\n<p>{</p>\r\n\r\n<p>return view(&#39;products.edit&#39;,compact(&#39;product&#39;));</p>\r\n\r\n<p>}</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>/**</p>\r\n\r\n<p>* Update the specified resource in storage.</p>\r\n\r\n<p>*</p>\r\n\r\n<p>* @param \\Illuminate\\Http\\Request $request</p>\r\n\r\n<p>* @param \\App\\Product $product</p>\r\n\r\n<p>* @return \\Illuminate\\Http\\Response</p>\r\n\r\n<p>*/</p>\r\n\r\n<p>public function update(Request $request, Product $product)</p>\r\n\r\n<p>{</p>\r\n\r\n<p>$request-&gt;validate([</p>\r\n\r\n<p>&#39;name&#39; =&gt; &#39;required&#39;,</p>\r\n\r\n<p>&#39;detail&#39; =&gt; &#39;required&#39;,</p>\r\n\r\n<p>]);</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>$product-&gt;update($request-&gt;all());</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>return redirect()-&gt;route(&#39;products.index&#39;)</p>\r\n\r\n<p>-&gt;with(&#39;success&#39;,&#39;Product updated successfully&#39;);</p>\r\n\r\n<p>}</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>/**</p>\r\n\r\n<p>* Remove the specified resource from storage.</p>\r\n\r\n<p>*</p>\r\n\r\n<p>* @param \\App\\Product $product</p>\r\n\r\n<p>* @return \\Illuminate\\Http\\Response</p>\r\n\r\n<p>*/</p>\r\n\r\n<p>public function destroy(Product $product)</p>\r\n\r\n<p>{</p>\r\n\r\n<p>$product-&gt;delete();</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>return redirect()-&gt;route(&#39;products.index&#39;)</p>\r\n\r\n<p>-&gt;with(&#39;success&#39;,&#39;Product deleted successfully&#39;);</p>\r\n\r\n<p>}</p>\r\n\r\n<p>}</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ok, so after run bellow command you will find &quot;app/Models/Product.php&quot; and put bellow content in Product.php file:</p>\r\n\r\n<p>app/Models/Product.php</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<pre>\r\n\r\n&nbsp;</pre>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&lt;?php</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>namespace App\\Models;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>use Illuminate\\Database\\Eloquent\\Factories\\HasFactory;</p>\r\n\r\n<p>use Illuminate\\Database\\Eloquent\\Model;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>class Product extends Model</p>\r\n\r\n<p>{</p>\r\n\r\n<p>use HasFactory;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>protected $fillable = [</p>\r\n\r\n<p>&#39;name&#39;, &#39;detail&#39;</p>\r\n\r\n<p>];</p>\r\n\r\n<p>}</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Step 6: Add Blade Files</strong></p>\r\n\r\n<p>In last step. In this step we have to create just blade files. So mainly we have to create layout file and then create new folder &quot;products&quot; then create blade files of crud app. So finally you have to create following bellow blade file:</p>\r\n\r\n<p>1) layout.blade.php</p>\r\n\r\n<p>2) index.blade.php</p>\r\n\r\n<p>3) create.blade.php</p>\r\n\r\n<p>4) edit.blade.php</p>\r\n\r\n<p>5) show.blade.php</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>So let&#39;s just create following file and put bellow code.</p>\r\n\r\n<p>resources/views/products/layout.blade.php</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<pre>\r\n\r\n&nbsp;</pre>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&lt;!DOCTYPE html&gt;</p>\r\n\r\n<p>&lt;html&gt;</p>\r\n\r\n<p>&lt;head&gt;</p>\r\n\r\n<p>&lt;title&gt;Laravel 8 CRUD Application - ItSolutionStuff.com&lt;/title&gt;</p>\r\n\r\n<p>&lt;link href=&quot;https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha/css/bootstrap.css&quot; rel=&quot;stylesheet&quot;&gt;</p>\r\n\r\n<p>&lt;/head&gt;</p>\r\n\r\n<p>&lt;body&gt;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&lt;div class=&quot;container&quot;&gt;</p>\r\n\r\n<p>@yield(&#39;content&#39;)</p>\r\n\r\n<p>&lt;/div&gt;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&lt;/body&gt;</p>\r\n\r\n<p>&lt;/html&gt;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>resources/views/products/index.blade.php</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<pre>\r\n\r\n&nbsp;</pre>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>@extends(&#39;products.layout&#39;)</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>@section(&#39;content&#39;)</p>\r\n\r\n<p>&lt;div class=&quot;row&quot;&gt;</p>\r\n\r\n<p>&lt;div class=&quot;col-lg-12 margin-tb&quot;&gt;</p>\r\n\r\n<p>&lt;div class=&quot;pull-left&quot;&gt;</p>\r\n\r\n<p>&lt;h2&gt;Laravel 8 CRUD Example from scratch - ItSolutionStuff.com&lt;/h2&gt;</p>\r\n\r\n<p>&lt;/div&gt;</p>\r\n\r\n<p>&lt;div class=&quot;pull-right&quot;&gt;</p>\r\n\r\n<p>&lt;a class=&quot;btn btn-success&quot; href=&quot;{{ route(&#39;products.create&#39;) }}&quot;&gt; Create New Product&lt;/a&gt;</p>\r\n\r\n<p>&lt;/div&gt;</p>\r\n\r\n<p>&lt;/div&gt;</p>\r\n\r\n<p>&lt;/div&gt;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>@if ($message = Session::get(&#39;success&#39;))</p>\r\n\r\n<p>&lt;div class=&quot;alert alert-success&quot;&gt;</p>\r\n\r\n<p>&lt;p&gt;{{ $message }}&lt;/p&gt;</p>\r\n\r\n<p>&lt;/div&gt;</p>\r\n\r\n<p>@endif</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&lt;table class=&quot;table table-bordered&quot;&gt;</p>\r\n\r\n<p>&lt;tr&gt;</p>\r\n\r\n<p>&lt;th&gt;No&lt;/th&gt;</p>\r\n\r\n<p>&lt;th&gt;Name&lt;/th&gt;</p>\r\n\r\n<p>&lt;th&gt;Details&lt;/th&gt;</p>\r\n\r\n<p>&lt;th width=&quot;280px&quot;&gt;Action&lt;/th&gt;</p>\r\n\r\n<p>&lt;/tr&gt;</p>\r\n\r\n<p>@foreach ($products as $product)</p>\r\n\r\n<p>&lt;tr&gt;</p>\r\n\r\n<p>&lt;td&gt;{{ ++$i }}&lt;/td&gt;</p>\r\n\r\n<p>&lt;td&gt;{{ $product-&gt;name }}&lt;/td&gt;</p>\r\n\r\n<p>&lt;td&gt;{{ $product-&gt;detail }}&lt;/td&gt;</p>\r\n\r\n<p>&lt;td&gt;</p>\r\n\r\n<p>&lt;form action=&quot;{{ route(&#39;products.destroy&#39;,$product-&gt;id) }}&quot; method=&quot;POST&quot;&gt;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&lt;a class=&quot;btn btn-info&quot; href=&quot;{{ route(&#39;products.show&#39;,$product-&gt;id) }}&quot;&gt;Show&lt;/a&gt;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&lt;a class=&quot;btn btn-primary&quot; href=&quot;{{ route(&#39;products.edit&#39;,$product-&gt;id) }}&quot;&gt;Edit&lt;/a&gt;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>@csrf</p>\r\n\r\n<p>@method(&#39;DELETE&#39;)</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&lt;button type=&quot;submit&quot; class=&quot;btn btn-danger&quot;&gt;Delete&lt;/button&gt;</p>\r\n\r\n<p>&lt;/form&gt;</p>\r\n\r\n<p>&lt;/td&gt;</p>\r\n\r\n<p>&lt;/tr&gt;</p>\r\n\r\n<p>@endforeach</p>\r\n\r\n<p>&lt;/table&gt;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>{!! $products-&gt;links() !!}</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>@endsection</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>resources/views/products/create.blade.php</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<pre>\r\n\r\n&nbsp;</pre>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>@extends(&#39;products.layout&#39;)</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>@section(&#39;content&#39;)</p>\r\n\r\n<p>&lt;div class=&quot;row&quot;&gt;</p>\r\n\r\n<p>&lt;div class=&quot;col-lg-12 margin-tb&quot;&gt;</p>\r\n\r\n<p>&lt;div class=&quot;pull-left&quot;&gt;</p>\r\n\r\n<p>&lt;h2&gt;Add New Product&lt;/h2&gt;</p>\r\n\r\n<p>&lt;/div&gt;</p>\r\n\r\n<p>&lt;div class=&quot;pull-right&quot;&gt;</p>\r\n\r\n<p>&lt;a class=&quot;btn btn-primary&quot; href=&quot;{{ route(&#39;products.index&#39;) }}&quot;&gt; Back&lt;/a&gt;</p>\r\n\r\n<p>&lt;/div&gt;</p>\r\n\r\n<p>&lt;/div&gt;</p>\r\n\r\n<p>&lt;/div&gt;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>@if ($errors-&gt;any())</p>\r\n\r\n<p>&lt;div class=&quot;alert alert-danger&quot;&gt;</p>\r\n\r\n<p>&lt;strong&gt;Whoops!&lt;/strong&gt; There were some problems with your input.&lt;br&gt;&lt;br&gt;</p>\r\n\r\n<p>&lt;ul&gt;</p>\r\n\r\n<p>@foreach ($errors-&gt;all() as $error)</p>\r\n\r\n<p>&lt;li&gt;{{ $error }}&lt;/li&gt;</p>\r\n\r\n<p>@endforeach</p>\r\n\r\n<p>&lt;/ul&gt;</p>\r\n\r\n<p>&lt;/div&gt;</p>\r\n\r\n<p>@endif</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&lt;form action=&quot;{{ route(&#39;products.store&#39;) }}&quot; method=&quot;POST&quot;&gt;</p>\r\n\r\n<p>@csrf</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&lt;div class=&quot;row&quot;&gt;</p>\r\n\r\n<p>&lt;div class=&quot;col-xs-12 col-sm-12 col-md-12&quot;&gt;</p>\r\n\r\n<p>&lt;div class=&quot;form-group&quot;&gt;</p>\r\n\r\n<p>&lt;strong&gt;Name:&lt;/strong&gt;</p>\r\n\r\n<p>&lt;input type=&quot;text&quot; name=&quot;name&quot; class=&quot;form-control&quot; placeholder=&quot;Name&quot;&gt;</p>\r\n\r\n<p>&lt;/div&gt;</p>\r\n\r\n<p>&lt;/div&gt;</p>\r\n\r\n<p>&lt;div class=&quot;col-xs-12 col-sm-12 col-md-12&quot;&gt;</p>\r\n\r\n<p>&lt;div class=&quot;form-group&quot;&gt;</p>\r\n\r\n<p>&lt;strong&gt;Detail:&lt;/strong&gt;</p>\r\n\r\n<p>&lt;textarea class=&quot;form-control&quot; style=&quot;height:150px&quot; name=&quot;detail&quot; placeholder=&quot;Detail&quot;&gt;&lt;/textarea&gt;</p>\r\n\r\n<p>&lt;/div&gt;</p>\r\n\r\n<p>&lt;/div&gt;</p>\r\n\r\n<p>&lt;div class=&quot;col-xs-12 col-sm-12 col-md-12 text-center&quot;&gt;</p>\r\n\r\n<p>&lt;button type=&quot;submit&quot; class=&quot;btn btn-primary&quot;&gt;Submit&lt;/button&gt;</p>\r\n\r\n<p>&lt;/div&gt;</p>\r\n\r\n<p>&lt;/div&gt;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&lt;/form&gt;</p>\r\n\r\n<p>@endsection</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>resources/views/products/edit.blade.php</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<pre>\r\n\r\n&nbsp;</pre>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>@extends(&#39;products.layout&#39;)</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>@section(&#39;content&#39;)</p>\r\n\r\n<p>&lt;div class=&quot;row&quot;&gt;</p>\r\n\r\n<p>&lt;div class=&quot;col-lg-12 margin-tb&quot;&gt;</p>\r\n\r\n<p>&lt;div class=&quot;pull-left&quot;&gt;</p>\r\n\r\n<p>&lt;h2&gt;Edit Product&lt;/h2&gt;</p>\r\n\r\n<p>&lt;/div&gt;</p>\r\n\r\n<p>&lt;div class=&quot;pull-right&quot;&gt;</p>\r\n\r\n<p>&lt;a class=&quot;btn btn-primary&quot; href=&quot;{{ route(&#39;products.index&#39;) }}&quot;&gt; Back&lt;/a&gt;</p>\r\n\r\n<p>&lt;/div&gt;</p>\r\n\r\n<p>&lt;/div&gt;</p>\r\n\r\n<p>&lt;/div&gt;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>@if ($errors-&gt;any())</p>\r\n\r\n<p>&lt;div class=&quot;alert alert-danger&quot;&gt;</p>\r\n\r\n<p>&lt;strong&gt;Whoops!&lt;/strong&gt; There were some problems with your input.&lt;br&gt;&lt;br&gt;</p>\r\n\r\n<p>&lt;ul&gt;</p>\r\n\r\n<p>@foreach ($errors-&gt;all() as $error)</p>\r\n\r\n<p>&lt;li&gt;{{ $error }}&lt;/li&gt;</p>\r\n\r\n<p>@endforeach</p>\r\n\r\n<p>&lt;/ul&gt;</p>\r\n\r\n<p>&lt;/div&gt;</p>\r\n\r\n<p>@endif</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&lt;form action=&quot;{{ route(&#39;products.update&#39;,$product-&gt;id) }}&quot; method=&quot;POST&quot;&gt;</p>\r\n\r\n<p>@csrf</p>\r\n\r\n<p>@method(&#39;PUT&#39;)</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&lt;div class=&quot;row&quot;&gt;</p>\r\n\r\n<p>&lt;div class=&quot;col-xs-12 col-sm-12 col-md-12&quot;&gt;</p>\r\n\r\n<p>&lt;div class=&quot;form-group&quot;&gt;</p>\r\n\r\n<p>&lt;strong&gt;Name:&lt;/strong&gt;</p>\r\n\r\n<p>&lt;input type=&quot;text&quot; name=&quot;name&quot; value=&quot;{{ $product-&gt;name }}&quot; class=&quot;form-control&quot; placeholder=&quot;Name&quot;&gt;</p>\r\n\r\n<p>&lt;/div&gt;</p>\r\n\r\n<p>&lt;/div&gt;</p>\r\n\r\n<p>&lt;div class=&quot;col-xs-12 col-sm-12 col-md-12&quot;&gt;</p>\r\n\r\n<p>&lt;div class=&quot;form-group&quot;&gt;</p>\r\n\r\n<p>&lt;strong&gt;Detail:&lt;/strong&gt;</p>\r\n\r\n<p>&lt;textarea class=&quot;form-control&quot; style=&quot;height:150px&quot; name=&quot;detail&quot; placeholder=&quot;Detail&quot;&gt;{{ $product-&gt;detail }}&lt;/textarea&gt;</p>\r\n\r\n<p>&lt;/div&gt;</p>\r\n\r\n<p>&lt;/div&gt;</p>\r\n\r\n<p>&lt;div class=&quot;col-xs-12 col-sm-12 col-md-12 text-center&quot;&gt;</p>\r\n\r\n<p>&lt;button type=&quot;submit&quot; class=&quot;btn btn-primary&quot;&gt;Submit&lt;/button&gt;</p>\r\n\r\n<p>&lt;/div&gt;</p>\r\n\r\n<p>&lt;/div&gt;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&lt;/form&gt;</p>\r\n\r\n<p>@endsection</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>resources/views/products/show.blade.php</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<pre>\r\n\r\n&nbsp;</pre>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>@extends(&#39;products.layout&#39;)</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>@section(&#39;content&#39;)</p>\r\n\r\n<p>&lt;div class=&quot;row&quot;&gt;</p>\r\n\r\n<p>&lt;div class=&quot;col-lg-12 margin-tb&quot;&gt;</p>\r\n\r\n<p>&lt;div class=&quot;pull-left&quot;&gt;</p>\r\n\r\n<p>&lt;h2&gt; Show Product&lt;/h2&gt;</p>\r\n\r\n<p>&lt;/div&gt;</p>\r\n\r\n<p>&lt;div class=&quot;pull-right&quot;&gt;</p>\r\n\r\n<p>&lt;a class=&quot;btn btn-primary&quot; href=&quot;{{ route(&#39;products.index&#39;) }}&quot;&gt; Back&lt;/a&gt;</p>\r\n\r\n<p>&lt;/div&gt;</p>\r\n\r\n<p>&lt;/div&gt;</p>\r\n\r\n<p>&lt;/div&gt;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&lt;div class=&quot;row&quot;&gt;</p>\r\n\r\n<p>&lt;div class=&quot;col-xs-12 col-sm-12 col-md-12&quot;&gt;</p>\r\n\r\n<p>&lt;div class=&quot;form-group&quot;&gt;</p>\r\n\r\n<p>&lt;strong&gt;Name:&lt;/strong&gt;</p>\r\n\r\n<p>{{ $product-&gt;name }}</p>\r\n\r\n<p>&lt;/div&gt;</p>\r\n\r\n<p>&lt;/div&gt;</p>\r\n\r\n<p>&lt;div class=&quot;col-xs-12 col-sm-12 col-md-12&quot;&gt;</p>\r\n\r\n<p>&lt;div class=&quot;form-group&quot;&gt;</p>\r\n\r\n<p>&lt;strong&gt;Details:&lt;/strong&gt;</p>\r\n\r\n<p>{{ $product-&gt;detail }}</p>\r\n\r\n<p>&lt;/div&gt;</p>\r\n\r\n<p>&lt;/div&gt;</p>\r\n\r\n<p>&lt;/div&gt;</p>\r\n\r\n<p>@endsection</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Now we are ready to run our crud application example with laravel 8 so run bellow command for quick run:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<pre>\r\n\r\n&nbsp;</pre>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>php artisan serve</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Now you can open bellow URL on your browser:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Read Also: <a href=\"https://www.itsolutionstuff.com/post/laravel-8-livewire-crud-with-jetstream-tailwind-cssexample.html\" target=\"_blank\">Laravel 8 Livewire CRUD with Jetstream &amp; Tailwind CSS</a></p>\r\n\r\n<pre>\r\n\r\n&nbsp;</pre>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>http://localhost:8000/products</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>You will see layout as like bellow:</p>\r\n\r\n<p>List Page:</p>\r\n\r\n<p><img src=\"https://www.itsolutionstuff.com/upload/laravel-8-crud-index.png\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Add Page:</p>\r\n\r\n<p><img src=\"https://www.itsolutionstuff.com/upload/laravel-crud-add.png\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Edit Page:</p>\r\n\r\n<p><img src=\"https://www.itsolutionstuff.com/upload/laravel-crud-edit.png\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>You can download code from git:</p>\r\n\r\n<p>&nbsp;</p>', NULL, 1, 0, 2, '2021-09-17 00:21:09', '2021-09-17 00:22:13'),
(3, 1, 'Laravel 8 Firebase Mobile Number (OTP) Authentication Tutorial', '1631859899laravel-firebase-phone-auth.png', 'This tutorial will give you example of laravel 8 firebase phone auth. I’m going to show you about laravel 8 mobile number verification firebase auth. i would like to show you laravel 8 firebase mobile otp. This tutorial will give you simple example of firebase phone authentication laravel 8 example. Follow bellow tutorial step of laravel 8 phone number verification with firebase.', '<p>Hi Dev,</p>\r\n\r\n<p>This tutorial will give you example of laravel 8 firebase phone auth. I&rsquo;m going to show you about laravel 8 mobile number verification firebase auth. i would like to show you laravel 8 firebase mobile otp. This tutorial will give you simple example of firebase phone authentication laravel 8 example. Follow bellow tutorial step of laravel 8 phone number verification with firebase.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>In this tutorial, i will create step by step simple example of firebase phone auth in laravel 8. we will create firebase app and give login with phone enable. then we will write simple code to mobile verification(opt) in laravel 8.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>let&#39;s see bellow preview and step to complete mobile verification:</p>\r\n\r\n<p>Preview:</p>\r\n\r\n<p><img src=\"https://www.itsolutionstuff.com/upload/laravel-firebase-phone-auth.png\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Step 1: Create Firebase Project and App</strong></p>\r\n\r\n<p>In first step, we have to go <a href=\"https://console.firebase.google.com\" target=\"_blank\">Firebase Console</a> and create a project. then you have to create web app on that project as like i added bellow screenshot:</p>\r\n\r\n<p><img src=\"https://www.itsolutionstuff.com/upload/laravel-firebase-push-notification-2.png\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>After given name and next then you will received firebase sdk as like bellow screen shot:</p>\r\n\r\n<p><img src=\"https://www.itsolutionstuff.com/upload/laravel-firebase-push-notification-3.png\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Next you need to enable phone number auth from bellow link:</p>\r\n\r\n<p><a href=\"https://console.firebase.google.com/u/0/project/itdemo-push-notification/authentication/providers\" target=\"_blank\">Authentication</a></p>\r\n\r\n<p><img src=\"https://www.itsolutionstuff.com/upload/laravel-firebase-phone-auth-2.png\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>You have to save that all information because we will use in our app.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Step 2: Install Laravel</strong></p>\r\n\r\n<p>first of all we need to get fresh Laravel application using bellow command, So open your terminal OR command prompt and run bellow command:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<pre>\r\n\r\n&nbsp;</pre>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>composer create-project --prefer-dist laravel/laravel blogFirebase</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Read Also: <a href=\"https://www.itsolutionstuff.com/post/laravel-8-pagination-example-tutorialexample.html\" target=\"_blank\">Laravel 8 Pagination Example Tutorial</a></p>\r\n\r\n<p><strong>Step 3: Create Route</strong></p>\r\n\r\n<p>Here, we need to add one route with FirebaseController controller so let&#39;s add that route in web.php file.</p>\r\n\r\n<p>routes/web.php</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<pre>\r\n\r\n&nbsp;</pre>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&lt;?php</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>use Illuminate\\Support\\Facades\\Route;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>use App\\Http\\Controllers\\FirebaseController;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>/*</p>\r\n\r\n<p>|--------------------------------------------------------------------------</p>\r\n\r\n<p>| Web Routes</p>\r\n\r\n<p>|--------------------------------------------------------------------------</p>\r\n\r\n<p>|</p>\r\n\r\n<p>| Here is where you can register web routes for your application. These</p>\r\n\r\n<p>| routes are loaded by the RouteServiceProvider within a group which</p>\r\n\r\n<p>| contains the &quot;web&quot; middleware group. Now create something great!</p>\r\n\r\n<p>|</p>\r\n\r\n<p>*/</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Route::get(&#39;firebase-phone-authentication&#39;, [FirebaseController::class, &#39;index&#39;]);</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Step 4: Create Controller</strong></p>\r\n\r\n<p>we will create new controller as like beloow</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>now, so let&#39;s add like as bellow:</p>\r\n\r\n<p>app/Http/Controllers/FirebaseController.php</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<pre>\r\n\r\n&nbsp;</pre>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&lt;?php</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>namespace App\\Http\\Controllers;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>use Illuminate\\Http\\Request;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>class FirebaseController extends Controller</p>\r\n\r\n<p>{</p>\r\n\r\n<p>/**</p>\r\n\r\n<p>* Write code on Method</p>\r\n\r\n<p>*</p>\r\n\r\n<p>* @return response()</p>\r\n\r\n<p>*/</p>\r\n\r\n<p>public function index()</p>\r\n\r\n<p>{</p>\r\n\r\n<p>return view(&#39;firebase&#39;);</p>\r\n\r\n<p>}</p>\r\n\r\n<p>}</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Step 5: Create Blade File</strong></p>\r\n\r\n<p>let&#39;s create new blade file that where we write all logic on phone auth.</p>\r\n\r\n<p>resources/views/firebase.blade.php</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<pre>\r\n\r\n&nbsp;</pre>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&lt;html&gt;</p>\r\n\r\n<p>&lt;head&gt;</p>\r\n\r\n<p>&lt;title&gt;Laravel Phone Number Authentication using Firebase - ItSolutionStuff.com&lt;/title&gt;</p>\r\n\r\n<p>&lt;!-- CSS only --&gt;</p>\r\n\r\n<p>&lt;link href=&quot;https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css&quot; rel=&quot;stylesheet&quot;&gt;</p>\r\n\r\n<p>&lt;script src=&quot;https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js&quot;&gt;&lt;/script&gt;</p>\r\n\r\n<p>&lt;/head&gt;</p>\r\n\r\n<p>&lt;body&gt;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&lt;div class=&quot;container&quot;&gt;</p>\r\n\r\n<p>&lt;h1&gt;Laravel Phone Number Authentication using Firebase - ItSolutionStuff.com&lt;/h1&gt;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&lt;div class=&quot;alert alert-danger&quot; id=&quot;error&quot; style=&quot;display: none;&quot;&gt;&lt;/div&gt;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&lt;div class=&quot;card&quot;&gt;</p>\r\n\r\n<p>&lt;div class=&quot;card-header&quot;&gt;</p>\r\n\r\n<p>Enter Phone Number</p>\r\n\r\n<p>&lt;/div&gt;</p>\r\n\r\n<p>&lt;div class=&quot;card-body&quot;&gt;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&lt;div class=&quot;alert alert-success&quot; id=&quot;sentSuccess&quot; style=&quot;display: none;&quot;&gt;&lt;/div&gt;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&lt;form&gt;</p>\r\n\r\n<p>&lt;label&gt;Phone Number:&lt;/label&gt;</p>\r\n\r\n<p>&lt;input type=&quot;text&quot; id=&quot;number&quot; class=&quot;form-control&quot; placeholder=&quot;+91********&quot;&gt;</p>\r\n\r\n<p>&lt;div id=&quot;recaptcha-container&quot;&gt;&lt;/div&gt;</p>\r\n\r\n<p>&lt;button type=&quot;button&quot; class=&quot;btn btn-success&quot; onclick=&quot;phoneSendAuth();&quot;&gt;SendCode&lt;/button&gt;</p>\r\n\r\n<p>&lt;/form&gt;</p>\r\n\r\n<p>&lt;/div&gt;</p>\r\n\r\n<p>&lt;/div&gt;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&lt;div class=&quot;card&quot; style=&quot;margin-top: 10px&quot;&gt;</p>\r\n\r\n<p>&lt;div class=&quot;card-header&quot;&gt;</p>\r\n\r\n<p>Enter Verification code</p>\r\n\r\n<p>&lt;/div&gt;</p>\r\n\r\n<p>&lt;div class=&quot;card-body&quot;&gt;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&lt;div class=&quot;alert alert-success&quot; id=&quot;successRegsiter&quot; style=&quot;display: none;&quot;&gt;&lt;/div&gt;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&lt;form&gt;</p>\r\n\r\n<p>&lt;input type=&quot;text&quot; id=&quot;verificationCode&quot; class=&quot;form-control&quot; placeholder=&quot;Enter verification code&quot;&gt;</p>\r\n\r\n<p>&lt;button type=&quot;button&quot; class=&quot;btn btn-success&quot; onclick=&quot;codeverify();&quot;&gt;Verify code&lt;/button&gt;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&lt;/form&gt;</p>\r\n\r\n<p>&lt;/div&gt;</p>\r\n\r\n<p>&lt;/div&gt;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&lt;/div&gt;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&lt;script src=&quot;https://www.gstatic.com/firebasejs/6.0.2/firebase.js&quot;&gt;&lt;/script&gt;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&lt;script&gt;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>var firebaseConfig = {</p>\r\n\r\n<p>apiKey: &quot;AIzaSyBPdVwUIYOY0qRr9kbIMTnxKpFw_nkneYk&quot;,</p>\r\n\r\n<p>authDomain: &quot;itdemo-push-notification.firebaseapp.com&quot;,</p>\r\n\r\n<p>databaseURL: &quot;https://itdemo-push-notification.firebaseio.com&quot;,</p>\r\n\r\n<p>projectId: &quot;itdemo-push-notification&quot;,</p>\r\n\r\n<p>storageBucket: &quot;itdemo-push-notification.appspot.com&quot;,</p>\r\n\r\n<p>messagingSenderId: &quot;257055232313&quot;,</p>\r\n\r\n<p>appId: &quot;1:257055232313:web:3f09127acdda7298dfd8e8&quot;,</p>\r\n\r\n<p>measurementId: &quot;G-VMJ68DFLXL&quot;</p>\r\n\r\n<p>};</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>firebase.initializeApp(firebaseConfig);</p>\r\n\r\n<p>&lt;/script&gt;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&lt;script type=&quot;text/javascript&quot;&gt;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>window.onload=function () {</p>\r\n\r\n<p>render();</p>\r\n\r\n<p>};</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>function render() {</p>\r\n\r\n<p>window.recaptchaVerifier=new firebase.auth.RecaptchaVerifier(&#39;recaptcha-container&#39;);</p>\r\n\r\n<p>recaptchaVerifier.render();</p>\r\n\r\n<p>}</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>function phoneSendAuth() {</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>var number = $(&quot;#number&quot;).val();</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>firebase.auth().signInWithPhoneNumber(number,window.recaptchaVerifier).then(function (confirmationResult) {</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>window.confirmationResult=confirmationResult;</p>\r\n\r\n<p>coderesult=confirmationResult;</p>\r\n\r\n<p>console.log(coderesult);</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>$(&quot;#sentSuccess&quot;).text(&quot;Message Sent Successfully.&quot;);</p>\r\n\r\n<p>$(&quot;#sentSuccess&quot;).show();</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>}).catch(function (error) {</p>\r\n\r\n<p>$(&quot;#error&quot;).text(error.message);</p>\r\n\r\n<p>$(&quot;#error&quot;).show();</p>\r\n\r\n<p>});</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>}</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>function codeverify() {</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>var code = $(&quot;#verificationCode&quot;).val();</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>coderesult.confirm(code).then(function (result) {</p>\r\n\r\n<p>var user=result.user;</p>\r\n\r\n<p>console.log(user);</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>$(&quot;#successRegsiter&quot;).text(&quot;you are register Successfully.&quot;);</p>\r\n\r\n<p>$(&quot;#successRegsiter&quot;).show();</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>}).catch(function (error) {</p>\r\n\r\n<p>$(&quot;#error&quot;).text(error.message);</p>\r\n\r\n<p>$(&quot;#error&quot;).show();</p>\r\n\r\n<p>});</p>\r\n\r\n<p>}</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&lt;/script&gt;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&lt;/body&gt;</p>\r\n\r\n<p>&lt;/html&gt;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ok, now we are ready to run.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>So let&#39;s run project using this command:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Read Also: <a href=\"https://www.itsolutionstuff.com/post/razorpay-payment-gateway-integration-in-laravel-8-tutorialexample.html\" target=\"_blank\">Razorpay Payment Gateway Integration in Laravel 8 Tutorial</a></p>\r\n\r\n<pre>\r\n\r\n&nbsp;</pre>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>php artisan serve</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>I hope it can help you...</p>\r\n\r\n<p>&nbsp;</p>', NULL, 1, 0, NULL, '2021-09-17 00:24:59', '2021-09-17 00:24:59');
INSERT INTO `blogs` (`id`, `category_id`, `blog_title`, `blog_thumnail`, `blog_short_description`, `blog_description`, `wistia_link`, `status`, `blog_type`, `read_count`, `created_at`, `updated_at`) VALUES
(4, 1, 'Construct a Wistia Embed Code', '1631860134Capture.PNG', 'The Wistia APIs were specifically built for videos in projects. We do not formally support using our APIs for audio files in projects, or audio or video episodes in Channels at this time. For the most reliable experience, we recommend continuing to use these for videos in projects', '<p>Learn to programmatically construct an embed code starting with just the video ID!</p>\r\n\r\n<p><em>If your use case requires you to build lots of embed codes for your videos dynamically, you will want to live by this guide. We&rsquo;ll break down each embed code type, and the best way to generate them.</em></p>\r\n\r\n<p>Note</p>\r\n\r\n<p>The Wistia APIs were specifically built for <em>videos</em> in <em>projects</em>. We do not formally support using our APIs for audio files in projects, or audio or video episodes in Channels at this time. For the most reliable experience, we recommend continuing to use these for videos in projects.</p>\r\n\r\n<h2><a href=\"https://wistia.com/support/developers/construct-an-embed-code#embed-code-types\">Embed Code Types</a></h2>\r\n\r\n<p>Before we get started, let&rsquo;s define some jargon around embed code types. At this time, the two (and a half) embed code types you can use with Wistia are:</p>\r\n\r\n<ul>\r\n	<li><strong>async</strong> - in the Wistia app we call this the &ldquo;Standard&rdquo; embed. If you want to use the <a href=\"https://wistia.com/support/developers/player-api\">Player API</a> to interact with your video, use this embed type.</li>\r\n	<li><strong>iframe</strong> - in the Wistia app we call this the &ldquo;Fallback&rdquo; embed. It&rsquo;s super simple, supported almost everywhere, and easy to build.</li>\r\n	<li><strong>popover</strong> - our async embed, but with more\r\n	<p><a href=\"https://wistia.com/support/developers/construct-an-embed-code#\">pop</a></p>\r\n	</li>\r\n</ul>\r\n\r\n<h2><a href=\"https://wistia.com/support/developers/construct-an-embed-code#using-the-oembed-endpoint\">Using the oEmbed Endpoint</a></h2>\r\n\r\n<p>Here&rsquo;s a quick primer on using the Wistia oEmbed endpoint, which is the easiest way to generate each of the Wistia embed code types.</p>\r\n\r\n<h3><a href=\"https://wistia.com/support/developers/construct-an-embed-code#the-endpoint\">The Endpoint</a></h3>\r\n\r\n<p>Our oEmbed endpoint is: <code>http://fast.wistia.net/oembed</code></p>\r\n\r\n<p>By default, the endpoint returns JSON, but use <code>http://fast.wistia.net/oembed.xml</code> to return XML.</p>\r\n\r\n<p>Our oEmbed endpoint recognizes two URL formats, <em>iframe embed URLs</em> and <em>public media URLs</em>.</p>\r\n\r\n<p><strong>iframe Embed URLs</strong></p>\r\n\r\n<p>You can build these for single videos or generate them through your account. If you&rsquo;re looking to build these for a playlist, that feature has been deprecated and we recommend using <a href=\"https://wistia.com/support/developers/embed-links\">embed links</a>.</p>\r\n\r\n<p><strong>Examples</strong></p>\r\n\r\n<ul>\r\n	<li><strong>single video</strong> - <code>http://fast.wistia.net/embed/iframe/26sk4lmiix</code></li>\r\n</ul>\r\n\r\n<p><strong>Public Media URLs</strong></p>\r\n\r\n<p>Public Media URLs are the address to a video in your account.</p>\r\n\r\n<ul>\r\n	<li><strong>example</strong> - <code>https://support.wistia.com/medias/26sk4lmiix</code></li>\r\n</ul>\r\n\r\n<h3><a href=\"https://wistia.com/support/developers/construct-an-embed-code#the-regex\">The Regex</a></h3>\r\n\r\n<p>If you&rsquo;re looking to automatically detect Wistia URLs and run them against our endpoint, we recommend using this regular expression:</p>\r\n\r\n<p><code>/https?:\\/\\/(.+)?(wistia\\.com|wi\\.st)\\/(medias|embed)\\/.*/</code></p>\r\n\r\n<p>Or if you don&rsquo;t speak regex, here&rsquo;s what we&rsquo;re matching:</p>\r\n\r\n<pre>\r\n<code>http(s)://*wistia.com/medias/*\r\nhttp(s)://*wistia.com/embed/*\r\nhttp(s)://*wi.st/medias/*\r\nhttp(s)://*wi.st/embed/*\r\n</code></pre>\r\n\r\n<p>Note, it&rsquo;s likely we&rsquo;ll add support for more URLs in the future so feel free to use a more general regular expression so you don&rsquo;t miss out on future enhancements! Perhaps this:</p>\r\n\r\n<p><code>/https?:\\/\\/(.+)?(wistia\\.com|wi\\.st)\\/.*/</code></p>\r\n\r\n<h2><a href=\"https://wistia.com/support/developers/construct-an-embed-code#oembed-parameters\">oEmbed Parameters</a></h2>\r\n\r\n<p>The required URL parameter that&rsquo;s passed in supports all the options detailed in the <a href=\"https://wistia.com/support/developers/player-api\">Player API</a>.</p>\r\n\r\n<p>We also accept some additional parameters that can change the output of the embed code:</p>\r\n\r\n<table>\r\n	<thead>\r\n		<tr>\r\n			<th>Name</th>\r\n			<th>Type</th>\r\n			<th>Description</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>callback</td>\r\n			<td>string</td>\r\n			<td>Only applicable to JSON requests. When specified, json is wrapped in a javascript function given by the callback param. This is to facilitate JSONP requests.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>embedType</td>\r\n			<td>string</td>\r\n			<td>Only applicable to videos and playlists. Accepts <strong>async</strong>, <strong>iframe</strong>, <strong>async_popover</strong>, <strong>playlist_iframe</strong>, <strong>playlist_api</strong>, <strong>playlist_popover</strong>, and <strong>open_graph_tags</strong> (videos only).</td>\r\n		</tr>\r\n		<tr>\r\n			<td>width</td>\r\n			<td>integer</td>\r\n			<td>The requested width of the video embed. Defaults to the native size of the video or 640, whichever is smaller.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>height</td>\r\n			<td>integer</td>\r\n			<td>The requested height of the video embed. Defaults to the native size of the video or 360, whichever is smaller.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>handle</td>\r\n			<td>string</td>\r\n			<td>Only applicable to <strong>async</strong>, and <strong>playlist_api</strong> embed types. Sets the javascript handle. Default is <strong>wistiaEmbed</strong> for medias and <strong>wistiaPlaylist</strong> for playlists.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>You can also get a popover embed code by using the async embedType, and adding <code>popover=true</code> to the URL. Check out <a href=\"https://wistia.com/support/developers/construct-an-embed-code#popover-embed-tutorial\">our tutorial</a> for a full break down.</p>\r\n\r\n<p>If given a <strong>width</strong>, <strong>height</strong>, <strong>maxwidth</strong>, or <strong>maxheight</strong> parameter (or any combination of those), the other dimensions in the resulting embed code may change so that the video&rsquo;s aspect ratio is preserved.</p>\r\n\r\n<p>Note</p>\r\n\r\n<p>These parameters are attached to the Wistia media URL, and not the oEmbed call. So they must be URL-encoded to travel with the Wistia URL.</p>\r\n\r\n<h2><a href=\"https://wistia.com/support/developers/construct-an-embed-code#troubleshooting\">Troubleshooting</a></h2>\r\n\r\n<ol>\r\n	<li>If an invalid URL (one that doesn&rsquo;t match our regular expression above) is given, the endpoint will return <strong>404 Not Found</strong>.</li>\r\n	<li>If an unparseable URL is given in the URL param, the endpoint will return <strong>404 Not Found</strong>.</li>\r\n	<li>If a media is found but has no available embed code, the endpoint will return <strong>501 Not Implemented</strong>. Only videos are embeddable.</li>\r\n	<li>If a playlist is found but has no videos, the endpoint will return <strong>501 Not Implemented</strong>.</li>\r\n</ol>\r\n\r\n<h2><a href=\"https://wistia.com/support/developers/construct-an-embed-code#standard-async-embed-tutorial\">Standard (async) Embed Tutorial</a></h2>\r\n\r\n<h3><a href=\"https://wistia.com/support/developers/construct-an-embed-code#using-the-oembed\">Using the oEmbed</a></h3>\r\n\r\n<p>Here is how we can get the embed code and some information for a video at <code>https://support.wistia.com/medias/26sk4lmiix</code> in JSON format:</p>\r\n\r\n<p>Quick note &mdash; we have yet to update the oEmbed return to automatically return the Standard (async) embed code type. Currently, this is Wistia&rsquo;s recommended embed type. To call the Standard embed:</p>\r\n\r\n<pre>\r\n<code>curl &quot;http://fast.wistia.net/oembed?url=https%3A%2F%2Fsupport.wistia.com%2Fmedias%2F26sk4lmiix&amp;embedType=async&quot;\r\n</code></pre>\r\n\r\n<p>Which returns:</p>\r\n\r\n<pre>\r\n<code>{\r\n  &quot;version&quot;:&quot;1.0&quot;,\r\n  &quot;type&quot;:&quot;video&quot;,\r\n  &quot;html&quot;:&quot;&lt;script charset=\\&quot;ISO-8859-1\\&quot; src=\\&quot;//fast.wistia.com/assets/external/E-v1.js\\&quot; async&gt;&lt;/script&gt;&lt;div class=\\&quot;wistia_embed wistia_async_26sk4lmiix\\&quot; style=\\&quot;height:540px;width:960px\\&quot;&gt;&amp;nbsp;&lt;/div&gt;&quot;,\r\n  &quot;width&quot;:960,\r\n  &quot;height&quot;:540,\r\n  &quot;provider_name&quot;:&quot;Wistia, Inc.&quot;,\r\n  &quot;provider_url&quot;:&quot;https://wistia.com&quot;,\r\n  &quot;title&quot;:&quot;Nice.&quot;,\r\n  &quot;thumbnail_url&quot;:&quot;https://embed-ssl.wistia.com/deliveries/56cacb9a5d6ea04b1f29defaf4b55d1ec979e1b0.jpg?image_crop_resized=960x540&quot;,\r\n  &quot;thumbnail_width&quot;:960,\r\n  &quot;thumbnail_height&quot;:540,\r\n  &quot;duration&quot;:44.457\r\n}\r\n</code></pre>\r\n\r\n<p>The <code>html</code> returned in the JSON body is the Standard embed code you can use to add this video to your website.</p>\r\n\r\n<p>For all the fine details about the options supported, see the official <a href=\"http://oembed.com/\" target=\"_blank\">oEmbed spec</a>.</p>\r\n\r\n<h3><a href=\"https://wistia.com/support/developers/construct-an-embed-code#using-a-template-approach-standard\">Using a Template Approach (Standard)</a></h3>\r\n\r\n<p>If you want to avoid making the additional request against the oEmbed endpoint, you can also build an Standard embed code template, and then add in the video&rsquo;s <code>hashed ID</code>.</p>\r\n\r\n<p>For this example we&rsquo;ll be using a hashed ID of <code>&#39;abcde12345&#39;</code>.</p>\r\n\r\n<p>The basic Standard embed code looks like this:</p>\r\n\r\n<pre>\r\n<code>&lt;script charset=&quot;ISO-8859-1&quot; src=&quot;//fast.wistia.com/assets/external/E-v1.js&quot; async&gt;&lt;/script&gt;&lt;div class=&quot;wistia_embed wistia_async_&lt;media-hashed-id&gt;&quot; style=&quot;height:366px;width:600px&quot;&gt;&amp;nbsp;&lt;/div&gt;\r\n</code></pre>\r\n\r\n<p>So to use this template with the hashed ID <code>&#39;abcde12345&#39;</code>, we insert it in place of <code>&lt;media-hashed-id&gt;</code>:</p>\r\n\r\n<pre>\r\n<code>&lt;script charset=&quot;ISO-8859-1&quot; src=&quot;//fast.wistia.com/assets/external/E-v1.js&quot; async&gt;&lt;/script&gt;&lt;div class=&quot;wistia_embed wistia_async_abcde12345&quot; style=&quot;height:366px;width:600px&quot;&gt;&amp;nbsp;&lt;/div&gt;\r\n</code></pre>\r\n\r\n<p>Note</p>\r\n\r\n<p>Because height and width will change based on your video&rsquo;s content, the template approach is probably best when your entire library uses a consistent size.</p>\r\n\r\n<p>If you&rsquo;d like to use a responsive template:</p>\r\n\r\n<pre>\r\n<code>&lt;script charset=&quot;ISO-8859-1&quot; src=&quot;//fast.wistia.com/assets/external/E-v1.js&quot; async&gt;&lt;/script&gt;&lt;div class=&quot;wistia_responsive_padding&quot; style=&quot;padding:56.25% 0 28px 0;position:relative;&quot;&gt;&lt;div class=&quot;wistia_responsive_wrapper&quot; style=&quot;height:100%;left:0;position:absolute;top:0;width:100%;&quot;&gt;&lt;div class=&quot;wistia_embed wistia_async_abcde12345 videoFoam=true&quot; style=&quot;height:100%;width:100%&quot;&gt;&amp;nbsp;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;\r\n</code></pre>\r\n\r\n<h2><a href=\"https://wistia.com/support/developers/construct-an-embed-code#popover-embed-tutorial\">Popover Embed Tutorial</a></h2>\r\n\r\n<p>To grab a popover oEmbed, you can use the <code>embedType=async_popover</code>, or add <code>&amp;popover=true</code> to the request:</p>\r\n\r\n<pre>\r\n<code>curl &quot;http://fast.wistia.net/oembed?url=https%3A%2F%2Fsupport.wistia.com%2Fmedias%2F26sk4lmiix&amp;embedType=async&amp;popover=true&quot;\r\ncurl &quot;http://fast.wistia.net/oembed?url=https%3A%2F%2Fsupport.wistia.com%2Fmedias%2F26sk4lmiix&amp;embedType=async_popover&quot;\r\n</code></pre>\r\n\r\n<p>Both options return:</p>\r\n\r\n<pre>\r\n<code>{\r\n  &quot;version&quot;:&quot;1.0&quot;,\r\n  &quot;type&quot;:&quot;video&quot;,\r\n  &quot;html&quot;:&quot;&lt;script charset=\\&quot;ISO-8859-1\\&quot; src=\\&quot;//fast.wistia.com/assets/external/E-v1.js\\&quot; async&gt;&lt;/script&gt;&lt;span class=\\&quot;wistia_embed wistia_async_26sk4lmiix popover=true\\&quot; style=\\&quot;display:inline-block;height:100px;width:150px\\&quot;&gt;&amp;nbsp;&lt;/span&gt;&quot;,\r\n  &quot;width&quot;:960,\r\n  &quot;height&quot;:540,\r\n  &quot;provider_name&quot;:&quot;Wistia, Inc.&quot;,\r\n  &quot;provider_url&quot;:&quot;https://wistia.com&quot;,\r\n  &quot;title&quot;:&quot;Nice.&quot;,\r\n  &quot;thumbnail_url&quot;:&quot;https://embed-ssl.wistia.com/deliveries/56cacb9a5d6ea04b1f29defaf4b55d1ec979e1b0.jpg?image_crop_resized=960x540&quot;,\r\n  &quot;thumbnail_width&quot;:960,\r\n  &quot;thumbnail_height&quot;:540,\r\n  &quot;duration&quot;:44.457\r\n}\r\n</code></pre>\r\n\r\n<p>For more fun embed options, check out the <a href=\"https://wistia.com/support/developers/embed-options#options-list\">full list of embed options</a>.</p>\r\n\r\n<h2><a href=\"https://wistia.com/support/developers/construct-an-embed-code#fallback-iframe-embed-tutorial\">Fallback (iframe) Embed Tutorial</a></h2>\r\n\r\n<h3><a href=\"https://wistia.com/support/developers/construct-an-embed-code#using-the-oembed-1\">Using the oEmbed</a></h3>\r\n\r\n<p>And finally, here&rsquo;s a quick tutorial for calling the iframe (Fallback) embed. You may also call the iframe embed code type:</p>\r\n\r\n<pre>\r\n<code>curl &quot;http://fast.wistia.net/oembed?url=https%3A%2F%2Fsupport.wistia.com%2Fmedias%2F26sk4lmiix&quot;\r\n</code></pre>\r\n\r\n<p>This returns:</p>\r\n\r\n<pre>\r\n<code>{\r\n  &quot;version&quot;:&quot;1.0&quot;,\r\n  &quot;type&quot;:&quot;video&quot;,&quot;\r\n  html&quot;:&quot;&lt;iframe src=\\&quot;//fast.wistia.net/embed/iframe/26sk4lmiix\\&quot; allowtransparency=\\&quot;true\\&quot; frameborder=\\&quot;0\\&quot; scrolling=\\&quot;no\\&quot; class=\\&quot;wistia_embed\\&quot; name=\\&quot;wistia_embed\\&quot; allowfullscreen mozallowfullscreen webkitallowfullscreen oallowfullscreen msallowfullscreen width=\\&quot;960\\&quot; height=\\&quot;540\\&quot;&gt;&lt;/iframe&gt;\\n&lt;script src=\\&quot;//fast.wistia.net/assets/external/E-v1.js\\&quot; async&gt;&lt;/script&gt;&quot;,\r\n  &quot;width&quot;:960,\r\n  &quot;height&quot;:540,\r\n  &quot;provider_name&quot;:&quot;Wistia, Inc.&quot;,\r\n  &quot;provider_url&quot;:&quot;https://wistia.com&quot;,\r\n  &quot;title&quot;:&quot;Nice.&quot;,\r\n  &quot;thumbnail_url&quot;:&quot;https://embed-ssl.wistia.com/deliveries/56cacb9a5d6ea04b1f29defaf4b55d1ec979e1b0.jpg?image_crop_resized=960x540&quot;,\r\n  &quot;thumbnail_width&quot;:960,\r\n  &quot;thumbnail_height&quot;:540,\r\n  &quot;duration&quot;:44.457\r\n}\r\n</code></pre>\r\n\r\n<p>Note the <code>html</code> returned in the JSON body is the iframe embed code you can use to add this video to your website.</p>\r\n\r\n<h3><a href=\"https://wistia.com/support/developers/construct-an-embed-code#using-a-template-approach-fallback\">Using a Template Approach (Fallback)</a></h3>\r\n\r\n<p>Just like the Standard embed, you can build an iframe embed code template, and swap out the video&rsquo;s <code>hashed ID</code>.</p>\r\n\r\n<p>Again, for this example we&rsquo;ll be using a hashed ID of <code>&#39;abcde12345&#39;</code>.</p>\r\n\r\n<p>The basic iframe embed code looks like this:</p>\r\n\r\n<pre>\r\n<code>&lt;iframe src=&quot;//fast.wistia.net/embed/iframe/&lt;media-hashed-id&gt;&quot; allowtransparency=&quot;true&quot; frameborder=&quot;0&quot; scrolling=&quot;no&quot; class=&quot;wistia_embed&quot; name=&quot;wistia_embed&quot; allowfullscreen mozallowfullscreen webkitallowfullscreen oallowfullscreen msallowfullscreen width=&quot;600&quot; height=&quot;366&quot;&gt;&lt;/iframe&gt;\r\n&lt;script src=&quot;//fast.wistia.net/assets/external/E-v1.js&quot; async&gt;&lt;/script&gt;\r\n</code></pre>\r\n\r\n<p>So to use this template with the hashed ID <code>&#39;abcde12345&#39;</code>, we insert it in place of <code>&lt;media-hashed-id&gt;</code>:</p>\r\n\r\n<pre>\r\n<code>&lt;iframe src=&quot;//fast.wistia.net/embed/iframe/abcde12345&quot; allowtransparency=&quot;true&quot; frameborder=&quot;0&quot; scrolling=&quot;no&quot; class=&quot;wistia_embed&quot; name=&quot;wistia_embed&quot; allowfullscreen mozallowfullscreen webkitallowfullscreen oallowfullscreen msallowfullscreen width=&quot;600&quot; height=&quot;366&quot;&gt;&lt;/iframe&gt;\r\n&lt;script src=&quot;//fast.wistia.net/assets/external/E-v1.js&quot; async&gt;&lt;/script&gt;\r\n</code></pre>\r\n\r\n<p>Note</p>\r\n\r\n<p>Because height and width will change based on your video&rsquo;s content, the template approach is probably best when your entire library uses a consistent size.</p>\r\n\r\n<p>Just like the Standard embed, the iframe embed can be responsive. Here&rsquo;s the template:</p>\r\n\r\n<pre>\r\n<code>&lt;div class=&quot;wistia_responsive_padding&quot; style=&quot;padding:56.25% 0 28px 0;position:relative;&quot;&gt;&lt;div class=&quot;wistia_responsive_wrapper&quot; style=&quot;height:100%;left:0;position:absolute;top:0;width:100%;&quot;&gt;&lt;iframe src=&quot;//fast.wistia.net/embed/iframe/abcde12345?videoFoam=true&quot; allowtransparency=&quot;true&quot; frameborder=&quot;0&quot; scrolling=&quot;no&quot; class=&quot;wistia_embed&quot; name=&quot;wistia_embed&quot; allowfullscreen mozallowfullscreen webkitallowfullscreen oallowfullscreen msallowfullscreen width=&quot;100%&quot; height=&quot;100%&quot;&gt;&lt;/iframe&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;script src=&quot;//fast.wistia.net/assets/external/E-v1.js&quot; async&gt;&lt;/script&gt;\r\n</code></pre>\r\n\r\n<h2><a href=\"https://wistia.com/support/developers/construct-an-embed-code#amp-embed-tutorial\">AMP Embed Tutorial</a></h2>\r\n\r\n<p>Wistia videos are compatible with AMP HTML pages as well! You&rsquo;ll just want to make sure your AMP webpage includes the following script:</p>\r\n\r\n<pre>\r\n<code>&lt;script async custom-element=&quot;amp-wistia-player&quot; src=&quot;https://cdn.ampproject.org/v0/amp-wistia-player-0.1.js&quot;&gt;&lt;/script&gt;\r\n</code></pre>\r\n\r\n<p>Then you can embed your Wistia video by placing it inside of an <code>amp-wistia-player</code> tag like so:</p>\r\n\r\n<pre>\r\n<code> &lt;amp-wistia-player\r\n    data-media-hashed-id=&quot;abc123&quot;\r\n    width=&quot;700&quot;\r\n    height=&quot;394&quot;\r\n    &gt;&lt;/amp-wistia-player&gt;\r\n</code></pre>\r\n\r\n<p>We have an example of how that all looks on a live webpage <a href=\"https://w-amp-example.glitch.me/\" target=\"_blank\">here</a>. For further information regarding supported layouts for the embed, you can go to the <a href=\"https://amp.dev/documentation/components/amp-wistia-player/\" target=\"_blank\">AMP webpage here</a>.</p>\r\n\r\n<h2><a href=\"https://wistia.com/support/developers/construct-an-embed-code#using-jsonp\">Using JSONP</a></h2>\r\n\r\n<p><a href=\"http://en.wikipedia.org/wiki/JSONP\" target=\"_blank\">JSONP</a> is a javascript technique used to get information from a server that is not the same origin as your current domain. This means they can avoid cross-domain security issues.</p>\r\n\r\n<p>In this example, we&rsquo;ll write some javascript to pull data for our video against the oEmbed endpoint, utilizing JSONP. Then, we&rsquo;ll manipulate the data returned to embed the thumbnail image.</p>\r\n\r\n<p>Given the oEmbed <code>base URL</code>, your <code>account URL</code>, and a <code>media hashed id</code>, we can use the jQuery <code>getJSON</code> function to call against the oEmbed endpoint to return the video data.</p>\r\n\r\n<p>Note this function also takes a callback function as a parameter. We&rsquo;ll set up that callback function next.</p>\r\n\r\n<pre>\r\n<code>var baseUrl = &quot;http://fast.wistia.com/oembed/?url=&quot;;\r\nvar accountUrl = encodeURIComponent(&quot;http://home.wistia.com/medias/&quot;);\r\nvar mediaHashedId = &quot;01a1d9f97c&quot;;\r\n\r\nfunction getThumbnailUrl(hashedId, callback) {\r\n  $.getJSON(baseUrl + accountUrl + hashedId + &quot;&amp;format=json&amp;callback=?&quot;, callback);\r\n}\r\n</code></pre>\r\n\r\n<p>This function will return a JSON data object, and pass it to our callback function, which will parse the JSON and log the thumbnail URL. Let&rsquo;s write that callback function now:</p>\r\n\r\n<pre>\r\n<code>function parseJSON(json) {\r\n  console.log(json.thumbnail_url);\r\n};\r\n</code></pre>\r\n\r\n<p>Finally, we&rsquo;ll setup something to call these functions for our <code>media hashed id</code>:</p>\r\n\r\n<pre>\r\n<code>getThumbnailUrl(mediaHashedId, parseJSON);\r\n</code></pre>\r\n\r\n<h3><a href=\"https://wistia.com/support/developers/construct-an-embed-code#working-with-the-thumbnail\">Working With The Thumbnail</a></h3>\r\n\r\n<p>Part of the JSON returned by the oEmbed is the <code>thumbnail_url</code>. This URL is a direct link to the thumbnail image asset. If your implementation involves using the thumbnail image (i.e. building your own &rsquo;popover&#39; embeds, displaying your own play button, etc.) you should use this thumbnail image, which by default has no Wistia play button overlaid on it.</p>\r\n\r\n<p>See our <a href=\"https://wistia.com/support/developers/working-with-images\">working with Wistia images</a> guide for more info!</p>\r\n\r\n<h2><a href=\"https://wistia.com/support/developers/construct-an-embed-code#embedding-options-and-plugins\">Embedding Options and Plugins</a></h2>\r\n\r\n<p>Once you have your embed code built, you probably want to tailor the appearance and behavior to your wishes. You may also want to add a plugin like Turnstile or a Call-to-Action.</p>\r\n\r\n<p>For a list of available embedding options to be used with the Customize API, check our <a href=\"https://wistia.com/support/developers/embed-options\">Embedding Options Documentation</a>.</p>\r\n\r\n<h2><a href=\"https://wistia.com/support/developers/construct-an-embed-code#retrieving-m3u8-files\">Retrieving .m3u8 files</a></h2>\r\n\r\n<p>For those that would like to create an .m3u8 playlist for all video&rsquo;s assets, the <code>fast.wistia.net/embed/medias/&lt;hashed_id&gt;.m3u8</code> endpoint will return the .m3u8 manifest and allow for adaptive playback. We do not recommend using this method as it will pull the video file outside of our player; as a result, you don&rsquo;t get any stats, analytics, or customizations. Using them, however, does count towards your account&rsquo;s bandwidth.</p>', '<script src=\"https://fast.wistia.com/embed/medias/g9y745j9ly.jsonp\" async></script><script src=\"https://fast.wistia.com/assets/external/E-v1.js\" async></script><div class=\"wistia_responsive_padding\" style=\"padding:54.17% 0 0 0;position:relative;\"><div class=\"wistia_responsive_wrapper\" style=\"height:100%;left:0;position:absolute;top:0;width:100%;\"><div class=\"wistia_embed wistia_async_g9y745j9ly videoFoam=true\" style=\"height:100%;position:relative;width:100%\"><div class=\"wistia_swatch\" style=\"height:100%;left:0;opacity:0;overflow:hidden;position:absolute;top:0;transition:opacity 200ms;width:100%;\"><img src=\"https://fast.wistia.com/embed/medias/g9y745j9ly/swatch\" style=\"filter:blur(5px);height:100%;object-fit:contain;width:100%;\" alt=\"\" aria-hidden=\"true\" onload=\"this.parentNode.style.opacity=1;\" /></div></div></div></div>', 1, 1, 1, '2021-09-17 00:28:54', '2021-09-17 00:29:07');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_banner` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_description` longtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `category_code`, `category_image`, `category_slug`, `category_banner`, `category_description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Programming', '430039290903388100', '1631531002index04-promo-img-02.jpg', 'programming', '1631531002index04-promo-img-01.jpg', 'Programming', 1, '2021-09-13 05:03:22', '2021-09-16 01:50:26'),
(2, 'Development', '642289753863990800', '16317786511.jpg', 'development', '16317786511.jpg', 'Development', 1, '2021-09-16 01:50:51', '2021-09-16 01:50:51'),
(3, 'Opinion', '952968328744919800', '16317786748.jpg', 'opinion', '16317786748.jpg', 'Opinion', 1, '2021-09-16 01:51:14', '2021-09-16 01:51:14');

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci,
  `notified` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `name`, `email`, `subject`, `message`, `notified`, `created_at`, `updated_at`) VALUES
(1, 'asas', 'admin@admin.com', 'asas', 'asas', 0, '2021-09-16 23:51:54', '2021-09-16 23:57:10'),
(2, 'asdasd', 'admin@admin.com', 'asd', 'asdasd', 1, '2021-09-17 00:04:28', '2021-09-17 00:05:40'),
(3, 'asas', 'asadEmplyee1@gmail.com', 'asas', 'asasas', 0, '2021-09-17 00:05:31', '2021-09-17 00:05:31');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `customer_name`, `customer_phone`, `customer_address`, `created_at`, `updated_at`) VALUES
(2, 'ASAS', 'ASAS', 'ASAS', '2021-09-13 04:51:43', '2021-09-13 04:51:43'),
(3, NULL, NULL, NULL, '2021-09-16 23:50:23', '2021-09-16 23:50:23');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_09_12_150013_create_customers_table', 1),
(6, '2021_09_13_064144_create_categories_table', 1),
(7, '2021_09_13_111059_create_settings_table', 2),
(12, '2021_09_16_063851_create_blogs_table', 3),
(13, '2021_09_17_052744_create_contact_messages_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `site_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website_logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website_fabicon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website_mobilenumber` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website_address` longtext COLLATE utf8mb4_unicode_ci,
  `fb_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkdin_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `insta_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pintest_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website_keywords` longtext COLLATE utf8mb4_unicode_ci,
  `website_descriptions` longtext COLLATE utf8mb4_unicode_ci,
  `blog_author` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blog_author_designation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `speed_system` tinyint(1) DEFAULT '0',
  `author_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `site_name`, `site_url`, `website_logo`, `website_fabicon`, `website_mobilenumber`, `website_email`, `website_address`, `fb_link`, `twitter_link`, `linkdin_link`, `insta_link`, `pintest_link`, `whatsapp_number`, `website_keywords`, `website_descriptions`, `blog_author`, `blog_author_designation`, `speed_system`, `author_image`, `created_at`, `updated_at`) VALUES
(1, 'Demo', 'Demo', '1631533983AdminLTELogo.png', '1631533983AdminLTELogo.png', 'Demo', 'demo@mail.com', 'Demo', 'Demo', 'Demo', 'Demo', 'Demo', 'Demo', 'Demo', 'Demo', 'Demo', 'Asad', 'Developer', 0, '1631855634author.jpg', '2021-09-13 05:28:45', '2021-09-17 00:06:17');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_status` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `email_verified_at`, `password`, `user_permission`, `user_status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@admin.com', '01810000000', NULL, '$2y$10$WiQUVGDIB9fRcweXQ5Cax.yaw33kNssfZi/LSwKMfqCfxJsD9Eejq', '1,2,3,4,5,6', 1, NULL, '2021-09-13 01:00:56', '2021-09-13 01:00:56'),
(3, 'asdasd', 'asadEmplyee1@gmail.com', 'wqeqweqwe', NULL, '$2y$10$T.nUIDy58KhPMNBpAllPgeHE9F6UpnRcvOToKfalvFB1f/9ns5vKC', '', 1, NULL, '2021-09-13 03:28:21', '2021-09-17 00:17:50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
