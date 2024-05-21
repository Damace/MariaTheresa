<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ratibaController;
use App\Http\Controllers\appController;



Route::get('/', [appController::class, 'index']);
Route::post('/upload', [appController::class, 'topbanner']);
Route::get('/ratiba', [ratibaController::class, 'ratiba_za_ibada']);







// Route::get('/', function () {
//     return view('welcome');
// });
