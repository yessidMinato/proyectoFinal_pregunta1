<?php
	session_start();
	include "cabecera.inc.php";
	$ok = 0;
	if (isset($_GET['error']))
	{
		$error = $_GET["error"];
		if ($error == "si")
			$ok = 1;
	}
	$textError = "<h4> Error en el usuario o contraseña </h4>";

	if (isset($_SESSION["IdUser"]))
	{
		header("Location: bandeja.php");
		exit();
	}
?>
<section class="vh-100" style="background-color: #9A616D;">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col col-xl-10">
        <div class="card" style="border-radius: 1rem;">
          <div class="row g-0">
		  <div class="col-md-6 col-lg-5 d-none d-md-block">
			<img src="assets/inmuebles.jpg" alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem; height:680px;" />
			</div>
            <div class="col-md-6 col-lg-7 d-flex align-items-center">
              <div class="card-body p-4 p-lg-5 text-black">

                <form method="POST" action="controlusuario.php">

                  <div class="d-flex align-items-center mb-3 pb-1">
                    <i class="fas fa-cubes fa-2x me-3" style="color: #ff6219;"></i>
                    <span class="h1 fw-bold mb-0">INMUEBLES MULTIMEDIAL S.R.L.</span>
                  </div>

                  <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Ingresar su cuenta de usuario</h5>

                  <div class="form-outline mb-4">
				  	<input type="text" id="login" class="form-control form-control-lg" name="usuario" placeholder="Usuario"><br>
                    <label class="form-label" for="form2Example17">User</label>
                  </div>

                  <div class="form-outline mb-4">
				  <input type="password" id="password" class="form-control form-control-lg" name="contrasenia" placeholder="Constrasenia">
                    <label class="form-label" for="form2Example27">Password</label>
                  </div>
				  <div class="form-outline mb-4">
                  <input type="submit" class="fadeIn fourth" value="Ingresar">
				  </div>
                  <div id="formFooter" style="padding: 0px 0px 0px 0px;">
							<h2 style="margin: 10px 0px 10px 0px;">Sistema</h2>
						</div>
                </form>

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<?php 
	include "pie.inc.php";
?>