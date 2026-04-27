<!DOCTYPE html>
<html>
    <head>
        <title>AWAY - Official Game</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <style>
            body {
                margin: 0;
                font-family: Arial, sans-serif;
                background: #ffffff;
                color: #222;
            }

            /* Barra superior */
            .navbar {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 20px 50px;
                background: rgba(255,255,255,0.95);
                box-shadow: 0 2px 10px rgba(0,0,0,0.08);
                position: sticky;
                top: 0;
                z-index: 100;
            }

            /* Logo */
            .logo img {
                height: 70px;
            }

            .navbar a {
                color: #333;
                text-decoration: none;
                margin-left: 25px;
                font-weight: bold;
            }

            /* Hero principal */
            .hero {
                height: 100vh;
                background-image: linear-gradient(rgba(255,255,255,0.55), rgba(255,255,255,0.55)),
                    url('imagenes/fondo.png');
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
                display: flex;
                flex-direction: column;
                justify-content: center;
                padding-left: 80px;
            }

            .hero h1 {
                font-size: 70px;
                margin: 0;
                color: #111;
            }

            .hero p {
                font-size: 20px;
                max-width: 600px;
                color: #444;
            }

            .botones {
                margin-top: 25px;
            }

            .botones a {
                text-decoration: none;
                padding: 14px 28px;
                margin-right: 15px;
                border-radius: 8px;
                font-weight: bold;
            }

            .btn-principal {
                background: #7ed957;
                color: white;
            }

            .btn-secundario {
                border: 2px solid #7ed957;
                color: #7ed957;
            }

            /* Secciones */
            .section {
                padding: 80px;
                text-align: center;
            }

            .section h2 {
                font-size: 36px;
                margin-bottom: 20px;
            }

            .section p {
                max-width: 800px;
                margin: auto;
                color: #555;
                line-height: 1.7;
            }

            /* Galería */
            .galeria img {
                width: 420px;
                height: 250px;
                object-fit: cover;
                border-radius: 14px;
                transition: transform 0.3s;
                box-shadow: 0 6px 20px rgba(0,0,0,0.12);
            }

            .galeria img {
                width: 300px;
                height: 180px;
                object-fit: cover;
                border-radius: 12px;
                transition: transform 0.3s;
                box-shadow: 0 4px 18px rgba(0,0,0,0.1);
            }

            .galeria img:hover {
                transform: scale(1.05);
            }

            /* Registro */

            .mensaje {
                margin-top: 15px;
                color: #4CAF50;
                font-weight: bold;
                font-size: 15px;
            }

            .error {
                margin-top: 15px;
                color: #e74c3c;
                font-weight: bold;
                font-size: 15px;
            }

            .registro {
                background: #f8f8f8;
                padding: 60px;
                text-align: center;
            }

            .registro input {
                padding: 14px;
                width: 300px;
                border: 1px solid #ccc;
                border-radius: 8px;
                margin-right: 10px;
            }

            .registro button {
                padding: 14px 25px;
                border: none;
                border-radius: 8px;
                background: #7ed957;
                color: white;
                cursor: pointer;
            }

            /* Login admin */
            .login-box {
                margin-top: 40px;
            }

            .login-box input {
                display: block;
                margin: 10px auto;
                padding: 12px;
                width: 250px;
                border-radius: 8px;
                border: 1px solid #ccc;
            }

            .login-box input[type="submit"] {
                background: #7ed957;
                color: white;
                border: none;
                cursor: pointer;
            }

            .error {
                color: red;
                margin-top: 10px;
            }
        </style>
    </head>
    <body>

        <!-- Menú -->
        <div class="navbar">
            <div class="logo">
                <img src="imagenes/logo.png" alt="AWAY Logo">
            </div>

            <div>
                <a href="#historia">Historia</a>
                <a href="#galeria">Galería</a>
                <a href="#registro">Registro</a>
            </div>
        </div>

        <!-- Portada -->
        <div class="hero">
            <h1>AWAY</h1>
            <p>
                Un viaje hacia lo desconocido donde cada decisión
                puede cambiar el destino de tu historia.
            </p>

            <div class="botones">
                <a href="#registro" class="btn-principal">Registrarse</a>
                <a href="#login" class="btn-secundario">Iniciar sesión</a>
            </div>
        </div>

        <!-- Historia -->
        <div class="section" id="historia">
            <h2>¿De qué trata AWAY?</h2>
            <p>
                AWAY es una experiencia narrativa de exploración y supervivencia.
                Los jugadores descubrirán un mundo misterioso lleno de secretos,
                criaturas y decisiones que definirán el rumbo del juego.
            </p>
        </div>

        <!-- Galería -->
        <div class="section" id="galeria">
            <h2>Galería del juego</h2>
            <div class="galeria">
                <img src="imagenes/imagen1.png" alt="">
                <img src="imagenes/imagen2.png" alt="">
                <img src="imagenes/imagen3.png" alt="">
            </div>
        </div>

        <!-- Registro -->
        <div class="registro" id="registro">
            <h2>Recibe noticias del lanzamiento</h2>
            <p>Registra tu correo para recibir novedades exclusivas.</p>

            <form action="RegistroCorreoServlet" method="POST">
                <input type="text" name="nombre" placeholder="Tu nombre" required>
                <input type="email" name="correo" placeholder="Tu correo electrónico" required>
                <button type="submit">Registrarme</button>
            </form>

            <div class="mensaje">
                <%= request.getParameter("mensaje") != null ? request.getParameter("mensaje") : "" %>
            </div>

            <div class="error">
                <%= request.getParameter("error") != null ? request.getParameter("error") : "" %>
            </div>

            <!-- Login administrador -->
            <div class="login-box" id="login">
                <h3>Acceso administrativo</h3>

                <form action="ingresar" method="POST">
                    <input type="text" placeholder="Usuario" name="usuario" required>
                    <input type="password" placeholder="Clave" name="clave" required>
                    <input type="submit" value="Ingresar">
                </form>
            </div>
        </div>

    </body>
</html>