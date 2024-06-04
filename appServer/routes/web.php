<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ratibaController;
use App\Http\Controllers\appController;
use App\Http\Controllers\AdminController;




//**********************************************ADMIN CONTROLLER ************************************************/


Route::get('/', [AdminController::class, 'index']);
Route::get('/home', [AdminController::class, 'home']);
Route::post('/login', [AdminController::class, 'login']);







//******************************************* APP CONTROLLER ***************************************************/


Route::post('/upload', [appController::class, 'topbanner']);
Route::post('/myform', [appController::class, 'fomu_za_huduma']);
Route::get('/fomu', [appController::class, 'get_fomu']);
Route::get('/ratiba', [ratibaController::class, 'ratiba_za_ibada']);
Route::post('/mahudhurio', [appController::class, 'mahudhurio']);
Route::get('/get_attendance', [appController::class, 'get_mahudhurio']);
Route::post('/jumuiya_login', [appController::class, 'jumuiya_login']);







