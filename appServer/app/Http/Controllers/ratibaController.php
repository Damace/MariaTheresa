<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ratibaController extends Controller
{

    public function ratiba_za_ibada()
    {
        // $users = DB::select('select * from users where active = ?', [1]);
        $users = DB::select('select * from ratiba_za_ibada');
        return json_encode($users,JSON_PRETTY_PRINT);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

}



