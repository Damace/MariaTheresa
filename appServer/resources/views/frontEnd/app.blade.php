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
</body>
</html>