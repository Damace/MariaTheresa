<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ratibaController;



Route::get('/ratiba', [ratibaController::class, 'ratiba_za_ibada']);

// Route::get('/', function () {
//     return view('welcome');
// });
