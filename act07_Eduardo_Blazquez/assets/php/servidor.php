<?php
require_once("BBDD_CTRLR.php");
if (isset($_REQUEST['peticion'])) {
    switch ($_REQUEST['peticion']) {
        case "CargarPersonas":
            // Preparo el SQL
            $sql = "SELECT * FROM personas order by per_id";
            // Ejecuto el SQL guardando el resultado
            $datos['sql']=$sql;
            $datos['datos'] = BBDD_CTRLR::Consultas($sql);
            // Devuelvo a JS los codificados con JSON
            echo json_encode($datos);      
            break;  
        case "CargarHobbies":
             // Preparo el SQL
             $sql = "SELECT * FROM hobbies order by hob_id";
             // Ejecuto el SQL guardando el resultado
             $datos['sql']=$sql;
             $datos['datos'] = BBDD_CTRLR::Consultas($sql);
             // Devuelvo a JS los codificados con JSON
             echo json_encode($datos);      
             break;
        case "CargarUnaPersona":
            // Preparo el SQL
            $persona_id= $_REQUEST['per_id'];
            $sql = "SELECT h.hob_nombre 
            FROM hobbies h JOIN personas_hobbies ph ON h.hob_id=ph.ph_hob_id 
            WHERE ph.ph_per_id=$persona_id";
            // Ejecuto el SQL guardando el resultado
            $datos['sql']=$sql;
            $datos['datos'] = BBDD_CTRLR::Consultas($sql);
            // Devuelvo a JS los codificados con JSON
            echo json_encode($datos);      
            break; 
        case "CargarUnHobbie":
            // Preparo el SQL
            $hobbie_id= $_REQUEST['hob_id'];
            $sql = "SELECT p.per_nombre 
            FROM personas p JOIN personas_hobbies ph ON p.per_id=ph.ph_per_id 
            WHERE ph.ph_hob_id=$hobbie_id";
            // Ejecuto el SQL guardando el resultado
            $datos['sql']=$sql;
            $datos['datos'] = BBDD_CTRLR::Consultas($sql);
            // Devuelvo a JS los codificados con JSON
            echo json_encode($datos);      
            break; 
        case "CargarPersonajes":
            // Recuperar parámetros
            $sql = "SELECT * FROM personajes";
            // Ejecuto el SQL guardando el resultado
            $datos['sql']=$sql;
            $datos['datos'] = BBDD_CTRLR::Consultas($sql);
            // Devuelvo a JS los codificados con JSON
            echo json_encode($datos);      
            break;
        case "ControlLogin":
            // Recuperar parámetros
            $alias = $_REQUEST['alias'];
            $password = $_REQUEST['password'];
            $sql = "SELECT * FROM usuarios WHERE usu_alias = '$alias' AND usu_password=md5('$password')";
            // Ejecuto el SQL guardando el resultado
            $datos['sql']=$sql;
            $datos['datos'] = BBDD_CTRLR::Consultas($sql);
            // Devuelvo a JS los codificados con JSON
            echo json_encode($datos);      
            break;
        case "CargarTemas":
            // Recuperar parámetros
            $sql = "SELECT tema_id, tema_tema, COUNT(men_tema_id) as men_por_tema
            FROM temas t LEFT JOIN mensajes m 
                ON t.tema_id=m.men_tema_id
            GROUP BY tema_id,tema_tema
            ORDER BY tema_tema;";
            // Ejecuto el SQL guardando el resultado
            $datos['sql']=$sql;
            $datos['datos'] = BBDD_CTRLR::Consultas($sql);
            // Devuelvo a JS los codificados con JSON
            echo json_encode($datos);      
            break;
        case "CargarMensajes":
            // Preparo el SQL
            $tema_id= $_REQUEST['tema_id'];
            $sql = "SELECT * FROM usuarios u 
                        JOIN mensajes m ON u.usu_id=m.men_usu_id 
                        JOIN temas t ON m.men_tema_id=t.tema_id 
                    WHERE t.tema_id=$tema_id
                    ORDER BY men_fecha_hora;";

            // Ejecuto el SQL guardando el resultado
            $datos['sql']=$sql;
            $datos['datos'] = BBDD_CTRLR::Consultas($sql);
            // Devuelvo a JS los codificados con JSON
            echo json_encode($datos);      
            break;   
        case "ControlRegistro":
            // Recuperar parámetros
            $alias = $_REQUEST['alias'];
            $nombre = $_REQUEST['nombre'];
            $password = $_REQUEST['password'];
            $sql = "INSERT INTO usuarios VALUES
                (null,'$nombre','$alias',md5('$password'),'u01.gif',0);";
            // Ejecuto el SQL guardando el resultado
            $datos['sql']=$sql;
            $datos['datos'] = BBDD_CTRLR::CRUD($sql, 'i');
            // Devuelvo a JS los codificados con JSON
            echo json_encode($datos);      
            break;
        case "EliminarTema":
            $tema_id= $_REQUEST['tema_id'];
            $sql = "DELETE FROM temas
                    WHERE tema_id=$tema_id";
            // Ejecuto el SQL guardando el resultado
            $datos['sql']=$sql;
            $datos['datos'] = BBDD_CTRLR::CRUD($sql, 'i');
            // Devuelvo a JS los codificados con JSON
            echo json_encode($datos);      
            break;  
        case "AñadirTema":
            $nombre= $_REQUEST['nombre_tema'];
            $sql = "INSERT INTO temas VALUES
            (null,'$nombre');";
            // Ejecuto el SQL guardando el resultado
            $datos['sql']=$sql;
            $datos['datos'] = BBDD_CTRLR::CRUD($sql, 'i');
            // Devuelvo a JS los codificados con JSON
            echo json_encode($datos);      
            break;
        case "EliminarMensaje":
            $men_id= $_REQUEST['men_id'];
            $sql = "DELETE FROM mensajes
                    WHERE men_id=$men_id";
            // Ejecuto el SQL guardando el resultado
            $datos['sql']=$sql;
            $datos['datos'] = BBDD_CTRLR::CRUD($sql, 'i');
            // Devuelvo a JS los codificados con JSON
            echo json_encode($datos);      
            break;
        case "AñadirMensaje":
            $usu_id= $_REQUEST['usu_id'];
            $tema_id= $_REQUEST['tema_id'];
            $contenido_men= $_REQUEST['contenido_men'];
            $sql = "INSERT INTO mensajes VALUES
            (null,'$contenido_men',$tema_id,$usu_id,null);";
            // Ejecuto el SQL guardando el resultado
            $datos['sql']=$sql;
            $datos['datos'] = BBDD_CTRLR::CRUD($sql, 'i');
            // Devuelvo a JS los codificados con JSON
            echo json_encode($datos);      
            break;  
            
            
    }
}

            
       