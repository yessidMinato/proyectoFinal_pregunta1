
<div class="container">
    <h4 style="text-align:center; text-transform: uppercase;">Formulario de Solicitud de carta de recomendación<br></h4>
    <div class="row g-3 needs-validation">
        <div class="col-md-4">
            <label for="validationCustom01" class="form-label">Nombre(s):</label>
            <input type="text" class="form-control" name = "nombre" value="<?php echo $nombre?>" required disabled> 
        </div>
        <div class="col-md-4">
            <label for="validationCustom02" class="form-label">Apellido Paterno:</label>
            <input type="text" class="form-control" name = "paterno" value="<?php echo $paterno?>" required disabled>
        </div>
        <div class="col-md-4">
            <label for="validationCustom03" class="form-label">Apellido Materno:</label>
            <input type="text" class="form-control" name = "materno" value="<?php echo $materno?>" required disabled>
        </div>
        <div class="col-md-6">
            <label for="validationCustom05" class="form-label">Carnet de Identidad:</label>
            <input type="text" class="form-control" name = "ci" value="<?php echo $ci?>" required disabled>
        </div>

        <div class="col-md-5">
            <label for="validationCustom06" class="form-label">Codigo de personal:</label>
            <input type="text" class="form-control" name = "codigoPersonal" value="<?php echo $codigoPersonal?>" required disabled>
        </div>
        <div class="col-md-3">
            <label for="validationCustom07" class="form-label">Profesión:</label>
            <input type="text" class="form-control" name = "profesion" value="<?php echo $profesion?>" required disabled>
        </div>
        <div class="col-md-5">
            <label for="validationCustom07" class="form-label">Experiencia laboral:</label>
            <input type="text" class="form-control" name = "experienciaLaboral" value="<?php echo $experienciaLaboral?>" required disabled>
        </div>
        <div class="col-md-3">
            <label for="validationCustom07" class="form-label">Ciudad:</label>
            <input type="text" class="form-control" name = "ciudad" value="<?php echo $ciudad?>" required disabled>
        </div>
        
        <div class="mb-3" hidden>
            <label for="formFile" class="form-label">Firma Digital del Gerente:</label>
            <input class="form-control" type="file" name="firma" >
        </div>
    </div>
    <div class="row">
        <div class="d-flex justify-content-center">
            <div class="form-check">
                <input class="form-check-input" type="radio" name="estado" value="aceptar" checked>
                <label class="form-check-label" for="fef">
                    Aceptar
                </label>
            </div>
        </div>
        <div class="d-flex justify-content-center">    
            <div class="form-check">
                <input class="form-check-input" type="radio" name="estado" value="rechazar">
                <label class="form-check-label" for="rrr">
                    Rechazar
                </label>
            </div>
        
        </div>
        
    </div>
        
</div>

