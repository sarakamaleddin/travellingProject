<?php
session_start();
session_unset();
session_destroy();
header("location: http://localhost:8077/travellingProject/admin-panel/admins/login-admins.php");
