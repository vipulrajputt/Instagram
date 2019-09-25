<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.css">

</head>
<body class="container">

<header>
     
<div class="ui secondary pointing menu">
    <a class="item" href="/">
        Home
    </a>
    <a class="item" href="/new">
        New Post
    </a>
    <a class="item">
        About InstaWeb
    </a>
</div>
</header>

<main>
    <div class="ui grid container">
        <div class="ui two column centered grid">
            <div class="column">
            	<div id="picture"></div>
                <!-- Enctype is multipart to support file upload -->
                <form action="/create" method="post" enctype="multipart/form-data" class="ui form">
                    <div class="field">
                        <label>Title</label>
                        <input name="title" type="text" placeholder="Title" />
                    </div>
                    <div class="field">
                        <label>Description</label>
                        <textarea rows="4" name="description" placeholder="Description"></textarea>
                    </div>
                    <div class="field">
                        <label>Image</label>
                        <input name="image" type="hidden" placeholder="Image URL" id="url_text"/>
                        <input name="image_id" id="image_id" type="hidden"/>
                    </div>
                    <button class="ui button" type="button" onclick="upload_image()" id="upload_widget_opener">Upload with Widget</button>
                    <button class="ui primary button" type="submit">Post</button>
                </form>
            </div>
        </div>
    </div>
</main>
 
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.js"></script>
<script src="https://widget.cloudinary.com/global/all.js" type="text/javascript"></script>
<script>
    function upload_image() {
    	var d = document.getElementById('picture');
        cloudinary.openUploadWidget({ cloud_name: 'dpxv0nhva', upload_preset: 'afbdnncj'},
            function(error, result) {
                console.log(error, result)
                // Push URL into text input
                document.getElementById('url_text').value = result[0].url;
                document.getElementById('image_id').value = result[0].public_id;
                d.innerHTML = '<img src='+result[0].url+'>';
            });
    }
    $('#tag').dropdown({
        allowAdditions: true
    });
</script>
</body>
</html>