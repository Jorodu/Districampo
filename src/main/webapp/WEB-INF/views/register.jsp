<%@page contentType="text/html" pageEncoding="windows-1252"%>

    <jsp:include page="MasterHead.jsp"></jsp:include>  

    <div style="padding-top: 3%;text-align: center;background-image: url('<%=request.getContextPath()%>/resources/imagenes/1.jpg');">
        <div style="margin: 0 auto; width: 60%; max-width: 500px; text-align: center; background: #f2f2f4; padding: 1em; border-radius: 2em; ">
            <img src="<%=request.getContextPath()%>/resources/imagenes/LogoDistricampoVt-220x80.png" width="220" height="70" alt=""/>		
            <form action='doRegister' method="post">            
                  <div class="form-group" style="text-align:left;">
                    <label for="exampleInputPassword1">Rol</label>                    
                    <select class="form-control" id="sltPerfil" name="sltPerfil">
                        <option value="-1">Seleccione</option>
                        <option value="1">Productor</option>
                        <option value="2">Distribuidor</option>
                    </select>
                  </div>
                  <div class="form-group" style="text-align:left;">
                    <label for="exampleInputPassword1">Nombres</label>
                    <input type="text" class="form-control" id="txtNombres" placeholder="Nombres" name="txtNombres">
                  </div>
                  <div class="form-group" style="text-align:left;">
                    <label for="exampleInputPassword1">Apellidos</label>
                    <input type="text" class="form-control" id="txtApellidos" placeholder="Apellidos" name="txtApellidos">
                  </div>
                  <div class="form-group" style="text-align:left;">
                    <label for="exampleInputPassword1">Número de identificación</label>
                    <input type="number" class="form-control" id="txtNumIdentificacion" placeholder="Num. Identificación" name="txtNumIdentificacion">
                  </div>
                  <div class="form-group" style="text-align:left;">
                    <label for="exampleInputPassword1">Correo electrónico</label>
                    <input type="email" class="form-control" id="txtEmail" placeholder="Email" name="txtEmail">
                  </div>
                  <div class="form-group" style="text-align:left;">
                    <label for="exampleInputPassword1">Confirmar Correo electrónico</label>
                    <input type="email" class="form-control" id="txtEmailC" placeholder="Email" name="txtEmailC">
                  </div>
                  <div class="form-group" style="text-align:left;">
                    <label for="exampleInputPassword1">Género</label>                    
                    <select class="form-control" id="sltGenero" name="sltGenero">
                        <option value="-1">Seleccione</option>
                        <option value="1">Masculino</option>
                        <option value="2">Femenino</option>
                    </select>
                  </div>                  
                  <div class="form-group" style="text-align:left;">
                    <label for="exampleInputPassword1">Clave</label>
                    <input type="password" class="form-control" id="txtClave" placeholder="Password" name="txtClave">
                  </div>
                  <div class="form-group" style="text-align:left;">
                    <label for="exampleInputPassword1">Confirmar Clave</label>
                    <input type="password" class="form-control" id="txtClave" placeholder="Repetir Password" name="txtClave">
                  </div>
                  <button type="submit" class="btn btn-primary">Registrar</button>                                
                  <c:if test="${error == 'true'}">
                    <div class="alert alert-danger">
                        <spring:message text="Contraseña o usuario incorrecto"/>
                        <br/>
                    </div>
                  </c:if>
            </form>
        </div>        
    </div>        
</body>
</html>