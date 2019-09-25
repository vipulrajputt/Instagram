<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>SIGN IN</title>
    <meta name="description" content="MOGHA ACADEMY is a coaching Institute located in Uttam Nagar, West Delhi. It runs by a group of highly qualified and experienced teachers. It also provides an online educational portal in which students can find their Study material, Assignments and test papers.">
     <meta name="Keywords" content="Mogha academy, Signin page, access to content, Uttam Nagar, Study Material, Mathematics assignments, assignments, Mathematics, Science, Test results, maths help, class 9, class 10, class 11, class 12"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,400i,700">
    <link rel="stylesheet" href="https://res.cloudinary.com/dpxv0nhva/raw/upload/v1565383757/bootstrap_ok5v3a.css">
    <link href="https://res.cloudinary.com/dpxv0nhva/raw/upload/v1565386601/style_admin_kcmuxh.css" rel="stylesheet" type="text/css">
    <link rel="icon" href="https://res.cloudinary.com/dpxv0nhva/image/upload/v1565383982/images/logo_oeoohn.png" sizes="16x16" type="image/png">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
  	<link rel="stylesheet" href="style.css">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
  </head>
  <body><div class="container-fluid px-3">
      <div class="row min-vh-100">
      <div class="col-md-4 col-lg-6 col-xl-8 d-none d-md-block">
          <!-- Image-->
          <div style="background-image: url(https://res.cloudinary.com/dpxv0nhva/image/upload/v1569337324/Testing%20insta/Screenshot_from_2019-09-24_20-29-48_k8ka0x.png); background-size: 60%;" class="bg-cover h-100 mr-n3"></div>
        </div>
        <div class="col-md-8 col-lg-6 col-xl-4 d-flex align-items-center">
          <div class="w-100 py-5 px-md-5 px-xl-6 position-relative">
            <div class="mb-5">
              <img class="logoinsta" src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Instagram_logo.svg/1200px-Instagram_logo.svg.png" alt="Instagram">
               <h4 style="color:red">${loginsuccess}</h4>
            </div>
            <form action="studentlog" modelAttribute="studentlogin" method="POST" class="form-validate">
              <div class="form-group">
               <input type="text" id="name" aria-describedby="" autocomplete="off" placeholder="E-mail ID" aria-required="true" maxlength="30" autocapitalize="off" autocorrect="off" class="form-control" required> 
               </div>
               <div class="form-group">
               <input type="text" id="name" aria-describedby="" autocomplete="off" placeholder="Name" aria-required="true" maxlength="30" autocapitalize="off" autocorrect="off" class="form-control" required> 
               </div>
               <div class="form-group">
               <input type="text" id="username" aria-describedby="" autocomplete="off" placeholder="Username" aria-required="true" maxlength="30" autocapitalize="off" autocorrect="off" class="form-control" required> 
               </div>
              <div class="form-group">
                  <input type="password" id="password" placeholder="Password" aria-describedby="" maxlength="30" aria-required="true" autocapitalize="off" autocorrect="off" required class="form-control"/>
              </div>
              <!-- Submit-->
              <button class="btn btn-lg btn-block btn-secondary">Sign up</button>
            </form>
            <p class="textinsta">Have an account? <a href="signin">Sign in</a></p>
          </div>
        </div>
      </div>
    </div>
    <!-- JavaScript files-->
    <script>
      // ------------------------------------------------------- //
      //   Inject SVG Sprite - 
      //   see more here 
      //   https://css-tricks.com/ajaxing-svg-sprite/
      // ------------------------------------------------------ //
      function injectSvgSprite(path) {
      
          var ajax = new XMLHttpRequest();
          ajax.open("GET", path, true);
          ajax.send();
          ajax.onload = function(e) {
          var div = document.createElement("div");
          div.className = 'd-none';
          div.innerHTML = ajax.responseText;
          document.body.insertBefore(div, document.body.childNodes[0]);
          }
      }    
      // to avoid CORS issues when viewing using file:// protocol, using the demo URL for the SVG sprite
      // use your own URL in production, please :)
      // https://demo.bootstrapious.com/directory/1-0/icons/orion-svg-sprite.svg
      //- injectSvgSprite('icons/orion-svg-sprite.52f2f033.svg'); 
      injectSvgSprite('https://demo.bootstrapious.com/directory/1-2/icons/orion-svg-sprite.52f2f033.svg'); 
      
    </script>
    <!-- jQuery-->
    <script src="https://res.cloudinary.com/dpxv0nhva/raw/upload/v1568298068/mainsitejs/jquery.min_bnjclz.js"></script>
    <!-- Bootstrap JS bundle - Bootstrap + PopperJS-->
    <script src="https://res.cloudinary.com/dpxv0nhva/raw/upload/v1568298067/mainsitejs/bootstrap.bundle.min_zqbcy2.js"></script>
    <!-- Bootstrap Select-->
    <script src="https://res.cloudinary.com/dpxv0nhva/raw/upload/v1568298067/mainsitejs/bootstrap-select.min_zu8gc8.js"></script>
    <!-- Object Fit Images - Fallback for browsers that don't support object-fit-->
    <script src="https://res.cloudinary.com/dpxv0nhva/raw/upload/v1568298066/mainsitejs/ofi.min_tye7kc.js"></script>
  </body>
</html>