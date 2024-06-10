<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ratibaController;
use App\Http\Controllers\appController;
use App\Http\Controllers\AdminController;




//**********************************************ADMIN CONTROLLER ************************************************/


Route::get('/', [AdminController::class, 'index']);
Route::get('/home', [AdminController::class, 'home']);
Route::post('/login', [AdminController::class, 'login']);
Route::post('/jumuiya_mpya', [AdminController::class, 'jumuiya_mpya']);
Route::get('jumuiya/{id}/{jina}', [AdminController::class, 'jumuiya']);
Route::get('delete/{jina}', [AdminController::class, 'delete_jumuiya']);
Route::get('matangazo', [AdminController::class, 'matangazo']);
Route::get('matukio', [AdminController::class, 'matukio']);
Route::get('fomu_huduma', [AdminController::class, 'fomu_huduma']);
Route::post('matukio_parokia', [AdminController::class, 'matukio_parokia']);
Route::post('/myform', [AdminController::class, 'myform_huduma']);
Route::get('maoni', [AdminController::class, 'maoni_kwa_parokia']);
Route::get('delete_file/{id}', [AdminController::class, 'delete_file']);
Route::post('tangazo', [AdminController::class, 'mangazo']);
Route::post('tangazo_atachments', [AdminController::class, 'mangazo_atachments']);
Route::get('delete_tangazo/{tarehe}', [AdminController::class, 'delete_tangazo']);
Route::get('delete_maoni/{id}', [AdminController::class, 'delete_maoni']);
Route::get('delete_matukio/{id}', [AdminController::class, 'delete_matukio']);
Route::get('mapadri', [AdminController::class, 'mapadri']);
Route::post('mapadri', [AdminController::class, 'mapadri_insert']);
Route::get('delete_padri/{id}', [AdminController::class, 'delete_padri']);




//******************************************* APP CONTROLLER ***************************************************/

Route::post('/maoni', [appController::class, 'maoni']);
Route::post('/upload', [appController::class, 'topbanner']);
Route::get('/fomu', [appController::class, 'get_fomu']);
Route::get('/ratiba', [ratibaController::class, 'ratiba_za_ibada']);
Route::post('/mahudhurio', [appController::class, 'mahudhurio']);
Route::get('/get_attendance', [appController::class, 'get_mahudhurio']);
Route::get('/fom_download/{file_name}', [appController::class, 'fom_download']);







