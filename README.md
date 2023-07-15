 <html>
  <body>
    <p align="center">
     <img src='https://i.postimg.cc/2SNJjCGs/bluehypr.png'>
   </p>
    <img src='https://i.postimg.cc/hPVn1y5q/swappy-20230705-212445.png'>
   <br/>
   <h3>¡Saludos! ¡Gracias por venir! 🩵</h3>
   <p>
    ¡Bienvenid@ a mis archivos de configuración de Hyprland!<br>
    En este repositorio encontrarás todos mis archivos de configuración y aprenderás a como solucionar algunos errores que puedan suceder en el proceso.<br>
    Siéntete libre de tomar cualquier cosa de aquí, ¡solo recuerda darme crédito por ello! :)  
   </p>
   <hr>
   <h3>⚠️ Requisitos</h3>
    <ul>
     <li>La instalación solo es válida para máquinas físicas y no virtuales.</li>
     <li>Compatible solo con gpu AMD o Intel.</li>
     <li>El proceso se debe realizar en un sistema Arch Linux limpio, des de la tty.</li>
    </ul>
   <hr>
   <h3>🐦 Información</h3>
    <ul>
     <li>Sistema operativo: Arch Linux</li>
     <li>WM: Hyprland</li>
     <li>Terminal: kitty</li>
     <li>Shell: zsh</li>
     <li>Editor: neovim / vscode</li>
     <li>Lanzador de aplicaciones: rofi</li>
    </ul>
   <hr>
   <h3>🔧 Setup</h3>
   <h4>Para poder instalar y configurar los dotfiles de forma automatizada debes seguir los siguientes pasos:</h4>
   <ol>
    <li>Descargar repositorio: git clone https://github.com/f3l3p1n0/bluehypr.git</li>
    <li>Acceder al directorio bluehypr: cd bluehypr</li>
    <li>Ejecutar el instalador (no root): ./install.sh</li>
    <li>Deja que finalice la instalación. Posteriormente realizar un reboot.</li>
   </ol>
   <p><strong>¡Atención!</strong> Debes tener en cuenta que durante la instalación es posible que se te pida que introduzcas la contraseña como 'sudo'. Debes introducirla y presionar enter para que puedas proseguir la instalación de forma correcta.</p>
   <p>Debes tener en cuenta que esta instalación no es rápida, por lo que se demorará un tiempo en completarse.</p>
   <p>Te dejo por aquí un vídeo por si quieres realizar la instalación de una forma más guiada: https://youtu.be/LoMNQZXLZfI</p>
   <hr>
   <h3>❌ Posibles problemas y soluciones</h3>
  <h4>En esta sección se abarcarán los posibles problemas y soluciones que vayan surgiendo:</h4>
  <h5><ins>El wallpaper no se aplica al iniciar sesión</ins></h5>
  <p>Debes ir a la configuración de hyprpaper: <strong>nano .config/hypr/hyprpaper.conf</strong></p>
   <p>Posteriormente, cambia el nombre del monitor que hay establecido por el nombre de tu monitor</p>
   <p>Para saber el nombre de tu monitor debes escribir en la terminal: <strong>hyprctl monitors</strong></p>
   <h5><ins>El powermenu se visualiza distorsionado o no funciona</ins></h5>
  <p>El powermenu en mi caso, está configurado para que se pueda visualizar correctamente en la resolución 1920x1080. Si en tu caso no lo visualizas correctamente, deberás dirigirte a la siguiente ruta: <strong>cd ~/.config/rofi/powermenu/</strong></p>
   <p>Posteriormente, deberás abrir el archivo <strong>config.rasi</strong></p>
   <p>En este archivo debes modificar la línea: <strong>mainbox-margin</strong> del apartado Global Properties. Ajusta los parámetros a tu gusto, puedes probar con <strong>15px 40px</strong>.</p>
   <h5><ins>Waybar no carga al iniciar sesión</ins></h5>
   <p>Debes abrir la configuración de waybar: <strong>nano .config/waybar/config.jsonc</strong></p>
   <p>En el archivo debes modificar el apartado <strong>output</strong> para cambiar el nombre del monitor.</p>
   <hr>
   <h3>👤 Autor</h3>
   <p>Los dotfiles no han sido originados al 100% pero si configurados por mi, <a href="https://github.com/f3l3p1n0">f3l3p1n0</a>.</p>
   <hr>
   <h3>📱 Redes sociales</h3>
   <a href="https://f3l3p1n0.github.io">Blog personal</a><br>
   <a href="https://www.youtube.com/@f3l3p1n0">Youtube</a><br>
   <a href="https://www.instagram.com/f3l3p1n0/?igshid=Mzc1MmZhNjY%3D">Instagram</a><br>
   <a href="https://www.linkedin.com/in/marc-mañé-lobato/">Linkedin</a><br>
  </body>
  </html>
