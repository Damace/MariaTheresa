<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Laravel File Upload</title>
</head>
<body>
    <form action="/upload" method="POST" enctype="multipart/form-data">
        @csrf
        <input type="text" name="describ">
        <br>
        <input type="file" name="myImage">
        <br>
        <button type="submit">Upload</button>
    </form>

    <p><br><p>
// --------------------------- FOMU ZA HUDUMA  ---------------------------------------

<form action="/myform" method="POST" enctype="multipart/form-data">
        @csrf
        <input type="text" name="jina_la_fomu">
        <br>
        <input type="file" name="fomu_file">
        <br>
        <button type="submit">Upload</button>
    </form>


    // --------------------------- FOMU ZA HUDUMA  ---------------------------------------   
</body>
</html>