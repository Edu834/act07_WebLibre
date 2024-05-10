// Función
//      function nombre(){
//          comandos;
//      }

let usu=0;
let usu_admin=-1;
let tema_id_ind=0;

function fInicio(){
    fMostrarTemas();
}

function fMostrarLogin(){

    // Muestra el formulario del login

    document.querySelector("#div_modal").style.display = "flex";
    let html=` <form id="form_login">
                    <div>
                        <div>
                            Alias
                        </div>
                        <div>
                            <input type="text" id="alias" name="" required>
                        </div>
                        <div>
                            Password
                        </div>
                        <div>
                            <input type="password" id="psw" required>
                        </div>
                        <div>
                            <div class="botonera" colspan="2">
                                <div onclick="fCancelar()"><button type="button">Cancelar</button></div>
                                <div onclick="fControlLogin()"><button type="button">Login</button></div>
                            </div>
                        </div>
                        <div>
                            <div>
                                <div id="div_error"> &nbsp;</div>
                            </div>
                        </div>
                    </div>
                </form>`
    document.querySelector("#div_modal").innerHTML=html;

}

function fMostrarRegistro(){

    // Muestra el formulario del registro

    document.querySelector("#div_modal").style.display = "flex";

    let html=`<form id="form_registro">
                    <div>
                        <div>
                            Nombre
                        </div>
                        <div>
                             <input type="text" id="nombre" required="required">
                        </div>
                        <div>
                            Alias
                        </div>
                        <div>
                            <input type="text" id="alias" required="required">
                        </div>
                        <div>
                            Password
                        </div>
                        <div>
                            <input type="password" id="psw" required="required">
                        </div>
                        <div>
                            Repetir Password
                        </div>
                        <div>
                            <input type="password" id="rpsw" required="required">
                        </div>
                        <div>
                            <div class="botonera">
                                    <button onclick="fCancelar()" type="button">Cancelar</button>
                                    <button onclick="fControlRegistro() "type="button">Sign up</button>
                            </div>
                        </div>
                        <div>
                            <div >
                                <div id="div_error"> &nbsp;</div>
                            </div>
                        </div>
                    </div>
                </form>`
    document.querySelector("#div_modal").innerHTML=html;


}

function fCancelar(){

    // Oculta el formulario

    document.querySelector("#div_modal").style.display = "none";
}


function fControlLogin(){
    // Leer el alias
    let alias = document.querySelector("#alias").value;
    // Leer el password
    let password = document.querySelector("#psw").value;
    // Buscar el alias y el password en la base de datos
    let URL = 'assets/php/servidor.php?peticion=ControlLogin';
    URL += "&alias=" + alias;
    URL += "&password=" + password;
    fetch(URL)
        .then((response) => response.json())
        .then((data) => {
            console.log(data);
            if (data.datos.length>0){
                // Si es correcto   
                //      cerrar la modal
                alert("Acceso permitido");
                usu=data.datos[0];
                let foto= data.datos[0].usu_foto;
                let ruta="assets/fotos/Usuarios/";
                document.querySelector("#div_modal").style.display = "none";
                // document.querySelector("#div_login").innerHTML = "Hola, " + data.datos[0].usu_alias;
                document.querySelector("#div_foto>img").src = ruta + foto;
                document.querySelector("#div_foto>img").title= data.datos[0].usu_alias;
                document.querySelector("header>#Bienvenido").innerHTML="<div> Bienvenido, " +data.datos[0].usu_alias + "</div>"
                document.querySelector("#div_login").innerHTML="Logout";
                document.querySelector("#div_login").style.width="85px";
                fMostrarTemas();
                fMostrarMensajes(tema_id_ind);
                
                
            } else {
                // si no 
                //      mensaje de error
                document.querySelector("#div_error").innerHTML="Acceso denegado";
                    // alert("Acceso denegado");
            }

            })
}

function fControlRegistro(){
      // Leer el alias
      let alias = document.querySelector("#alias").value;
      // Leer el alias
      let nombre = document.querySelector("#nombre").value;
      // Leer el password
      let password = document.querySelector("#psw").value;
      // Leer el password
      let repPassword = document.querySelector("#rpsw").value;
      // Buscar el alias y el password en la base de datos
      let URL = 'assets/php/servidor.php?peticion=ControlRegistro';
      URL += "&alias=" + alias;
      URL += "&nombre=" + nombre;
      URL += "&password=" + password;
      fetch(URL)
      .then((response) => response.json())
        .then((data) => {
            console.log(data);
              if (repPassword==password){
                  // Si es correcto   
                  //      cerrar la modal
                  document.querySelector("#div_modal").style.display = "none";
              } else {
                  // si no 
                  //      mensaje de error
                  document.querySelector("#div_error").innerHTML="Acceso denegado";
                      alert("Acceso denegado");
              }
            })      

}


function fMostrarTemas(){

    let URL = 'assets/php/servidor.php?peticion=CargarTemas';
    fetch(URL)
    .then((response) => response.json())
    .then((data) => {
        console.log(data);
        let html="";
        for(i=0; i<data.datos.length; i++){
            let tema=data.datos[i].tema_tema;
            let tema_id=data.datos[i].tema_id;
            let contMen=data.datos[i].men_por_tema;
            if (usu.usu_admin==1){
                console.log(usu_admin);
                html += `<div class="div_tema" ><p><span onclick="fMostrarMensajes(${tema_id})">${tema} <span class= "cont_men">(${contMen})</span></span> <span class="borrar_tema"><i class="fas fa-minus" onclick="fEliminarTema(${tema_id})"></span></i></p></div>`;
            }else {
                console.log(usu_admin);
                html += `<div class="div_tema" onclick="fMostrarMensajes(${tema_id})"><p>${tema} <span class= "cont_men">(${contMen})</span></p></div>`;
            }
           
        }
        if (usu.usu_admin==1){
            document.querySelector("nav>div").innerHTML= html + '<i id="añadir_tema" class="fas fa-plus" onclick="fMenuAñadirTema()"></i>';
        }else {
            document.querySelector("nav>div").innerHTML= html;
        }
        })

}

function fEliminarTema(tema_id){
    let URL = 'assets/php/servidor.php?peticion=EliminarTema&tema_id='+tema_id;
    fetch(URL)
      .then((response) => response.json())
        .then((data) => {
            console.log(data);
            fMostrarTemas();
            })      
}

function fMenuAñadirTema(){

    document.querySelector("#div_modal").style.display = "flex";

    let html=`<form id="form_añadir_tema">
                    <div>
                        <div>
                            Nombre del tema
                        </div>
                        <div>
                             <input type="text" id="nombre_tema">
                        </div>
                        <div>
                            <div class="botonera">
                                    <button onclick="fCancelar()" type="button">Cancelar</button>
                                    <button onclick="fAñadirTema()" type="button">Crear</button>
                            </div>
                        </div>
                </form>`
    document.querySelector("#div_modal").innerHTML=html;

}

function fAñadirTema(){
    let nombre = document.querySelector("#nombre_tema").value;
    let URL = 'assets/php/servidor.php?peticion=AñadirTema&nombre_tema='+ nombre;
    fetch(URL)
      .then((response) => response.json())
        .then((data) => {
            console.log(data);
            fMostrarTemas();
            })
}
function fMostrarMensajes(tema_id){
    let URL = 'assets/php/servidor.php?peticion=CargarMensajes&tema_id='+tema_id;
    fetch(URL)
    .then((response) => response.json())
    .then((data) => {
        console.log(data);
        let html="";
        tema_id_ind=tema_id;
        for(i=0; i<data.datos.length; i++){
            let mensaje=data.datos[i].men_mensaje;
            let foto=data.datos[i].usu_foto;
            let usuario=data.datos[i].usu_alias;
            let fecha=data.datos[i].men_fecha_hora
            let tema=data.datos[i].tema_tema;
            let usu_men=data.datos[i].men_usu_id;
            let men_id=data.datos[i].men_id;
            console.log(usu_admin);
            if(usu.usu_admin==1){
            
            html += "<div>";

                html += "<div>";
                    html += `<img src="assets/fotos/Usuarios/${foto}" alt="foto de ${usuario}" title="${usuario}">`;      
                html += "</div>";

                html += "<div class='div_men'>";

                    html += "<div class='tema_men'>";
                        html += `<div>${usuario} --> ${tema}</div><div class="borrar_mensaje"><i onclick= "fBorrarMensaje(${men_id})"class="fas fa-window-close"></i></div>`                
                    html += "</div>";
                    html += "<div class='men_men'>";
                        html += `${mensaje}`;              
                    html += "</div>";

                html += "</div>";

                html += "<div>";                
                    html += `${fecha}`;
                html += "</div>";

            html += "</div>";
            }else if(usu.usu_admin==0){
                if(usu.usu_id==usu_men){
                    html += "<div class='mis_mensajes'>";

                html += "<div>";
                    html += `<img src="assets/fotos/Usuarios/${foto}" alt="foto de ${usuario}" title="${usuario}">`;      
                html += "</div>";

                html += "<div class='div_men'>";

                    html += "<div class='tema_men'>";
                        html += `<div>${usuario} --> ${tema}</div><div class="borrar_mensaje"><i onclick= "fBorrarMensaje(${men_id})" class="fas fa-window-close"></i></div>`                
                    html += "</div>";
                    html += "<div class='men_men'>";
                        html += `${mensaje}`;              
                    html += "</div>";

                html += "</div>";

                html += "<div>";                
                    html += `${fecha}`;
                html += "</div>";

            html += "</div>";
                    } else{
                    html += "<div>";

                    html += "<div>";
                        html += `<img src="assets/fotos/Usuarios/${foto}" alt="foto de ${usuario}" title="${usuario}">`;      
                    html += "</div>";

                    html += "<div class='div_men'>";

                        html += "<div class='tema_men'>";
                            html += `<div>${usuario} --> ${tema}</div>`                
                        html += "</div>";
                        html += "<div class='men_men'>";
                            html += `${mensaje}`;              
                        html += "</div>";

                    html += "</div>";

                    html += "<div>";                
                        html += `${fecha}`;
                    html += "</div>";

                html += "</div>";
                    }
            }
            else{

            html += "<div>";

                html += "<div>";
                    html += `<img src="assets/fotos/Usuarios/${foto}" alt="foto de ${usuario}" title="${usuario}">`;      
                html += "</div>";

                html += "<div class='div_men'>";

                    html += "<div class='tema_men'>";
                        html += `${usuario} --> ${tema}`                
                    html += "</div>";
                    html += "<div class='men_men'>";
                        html += `${mensaje}`;              
                    html += "</div>";

                html += "</div>";

                html += "<div>";                
                    html += `${fecha}`;
                html += "</div>";

            html += "</div>";
            }
            
            
            
        }
        if(usu.usu_admin==1 || usu.usu_admin==0)
        document.querySelector("section").innerHTML= html + `<div id="div_insert_men">
                                                                <input id="escribir_mensaje" type="text">
                                                                <button onclick="fInsertarMensaje()" type="button">Enviar</button>
                                                            </div>`;
        else{
            document.querySelector("section").innerHTML= html;
        }
        })
}

function fBorrarMensaje(men_id){
    let URL = 'assets/php/servidor.php?peticion=EliminarMensaje&men_id='+men_id;
    fetch(URL)
      .then((response) => response.json())
        .then((data) => {
            console.log(data);
            fMostrarMensajes(tema_id_ind);
            fMostrarTemas();
            })     
}

function fInsertarMensaje(){
    let contenido_men= document.querySelector("#escribir_mensaje").value;
    let URL = 'assets/php/servidor.php?peticion=AñadirMensaje';
    URL += "&usu_id=" + usu.usu_id;
    URL += "&tema_id=" + tema_id_ind;
    URL += "&contenido_men=" + contenido_men;
    fetch(URL)
      .then((response) => response.json())
        .then((data) => {
            console.log(data);
            fMostrarMensajes(tema_id_ind);
            fMostrarTemas();
            })  
}






















function fMostrarPersonajes(){

    let URL = 'assets/php/servidor.php?peticion=CargarPersonajes';
    fetch(URL)
        .then((response) => response.json())
        .then((data) => {
            console.log(data);
            let html="";
            for(i=0; i<data.datos.length; i++){
                let foto= data.datos[i].per_foto;
                let nom= data.datos[i].per_nombre;
                let id_css= data.datos[i].per_id_css;
                html += `<div id="${id_css}"><div class="personaje"><img src="assets/fotos/Personajes/${foto}"></img></div><div class="descP">${nom}</div></div>`;
            }
            document.querySelector("section").innerHTML= html;
            })
}
































function fMostrarPersonas(){
    //Pedir los clientes a la base de datos
        //Crear la URL con la petición
        //El formato es:
            //Programa_a_ejecutar ? nobre_variable = valor_variable & nobre_variable = valor_variable ........ y asi por tantas variables tengamos
    const URL = 'assets/php/servidor.php?peticion=CargarPersonas';
    fetch(URL)
        .then((response) => response.json())
        .then((data) => {
            console.log(data);
            // Mosatrar los clientes en el nav
            //Recorrer la lista
            let html = "";
            for(i=0; i<data.datos.length; i++){
                let id = data.datos[i].per_id;
                let nom = data.datos[i].per_nombre;
                html += `<div onclick="fMostrarUnaPersona(${id})">${nom}</div>`;
            }
            document.querySelector("aside").innerHTML= html;
            })
    //Cuando los tenga mostrarlos en el section
}

function fMostrarHobbies(){
    //Pedir los clientes a la base de datos
        //Crear la URL con la petición
        //El formato es:
            //Programa_a_ejecutar ? nobre_variable = valor_variable & nobre_variable = valor_variable ........ y asi por tantas variables tengamos
    const URL = 'assets/php/servidor.php?peticion=CargarHobbies';
    fetch(URL)
        .then((response) => response.json())
        .then((data) => {
            console.log(data);
            // Mosatrar los clientes en el nav
            //Recorrer la lista
            let html = "";
            for(i=0; i<data.datos.length; i++){
                let id = data.datos[i].hob_id;
                let nom = data.datos[i].hob_nombre;
                html += `<div onclick="fMostrarUnHobbie(${id})"> ${nom}</div>`;
            }
            document.querySelector("aside").innerHTML= html;
            })
    //Cuando los tenga mostrarlos en el section
}

function fMostrarUnaPersona(per_id){

    const URL = 'assets/php/servidor.php?peticion=CargarUnaPersona&per_id='+per_id;
    fetch(URL)
        .then((response) => response.json())
        .then((data) => {
            console.log(data);
            // Mosatrar los clientes en el nav
            //Recorrer la lista
            let html = "";
            for(i=0; i<data.datos.length; i++){
                html += "<div onclick='fMostrarUnHobbie()'>" +  data.datos[i].hob_nombre + "</div>";
            }
            document.querySelector("section").innerHTML= html;
            })
    //Cuando los tenga mostrarlos en el section

}

function fMostrarUnHobbie(hob_id){

    const URL = 'assets/php/servidor.php?peticion=CargarUnHobbie&hob_id='+hob_id;
    fetch(URL)
        .then((response) => response.json())
        .then((data) => {
            console.log(data);
            // Mosatrar los clientes en el nav
            //Recorrer la lista
            let html = "";
            for(i=0; i<data.datos.length; i++){
                html += "<div onclick='fMostrarUnHobbie()'>" +  data.datos[i].per_nombre + "</div>";
            }
            document.querySelector("section").innerHTML= html;
            })
    //Cuando los tenga mostrarlos en el section

}


