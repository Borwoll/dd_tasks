<?php
$root = $_SERVER['DOCUMENT_ROOT']; // Корневой каталог
$dir = isset($_GET['dir']) ? $_GET['dir'] : $root; // Текущий каталог

// Проверка, является ли этот каталог подкаталогом корневого каталога
if (strpos(realpath($dir), $root) !== 0) {
    die('Access denied');
}

// Открытие каталога
$dh = opendir($dir);

// Инициализация массивов для хранения каталогов и файлов
$directories = array();
$files = array();

// Обход содержимого каталога
while (($file = readdir($dh)) !== false) {
    // Игнорируем текущий каталог и родительский каталог
    if ($file !== '.' && $file !== '..') {
        $path = $dir . '/' . $file;

        // Является ли файл каталогом или изображением
        if (is_dir($path)) {
            // Добавляем каталог в массив каталогов
            $directories[] = $file;
        } else if (preg_match('/\\.(jpg|jpeg|png|gif)$/i', $file)) {
            // Добавляем файл в массив файлов
            $files[] = $file;
        }
    }
}

// Закрытие каталога
closedir($dh);

// Сортировка каталогов и массивов файлов
sort($directories);
sort($files);
?>

<!DOCTYPE html>
<html lang="ru">
<head>
    <title><?php echo basename($dir); ?></title>
    <style>
        ul {
            list-style-type: none;
            padding: 0;
        }

        li {
            margin-bottom: 5px;
        }

        a {
            text-decoration: none;
            color: #000;
        }

        a:hover {
            text-decoration: underline;
        }

        .directory {
            font-weight: bold;
        }

        .image {
            color: #00f;
        }
    </style>
</head>
<body>
<ul>
    <?php
    // Если текущий каталог не является корневым, отображаем ссылку на родительский каталог
    if ($dir !== $root) {
        $parent = dirname($dir);
        echo '<li><a href="?dir=' . urlencode($parent) . '">..</a></li>';
    }

    // Отображение каталогов и файлов
    foreach ($directories as $directory) {
        $path = $dir . '/' . $directory;
        echo '<li class="directory"><a href="?dir=' . urlencode($path) . '">' . htmlspecialchars($directory, ENT_QUOTES | ENT_HTML5) . '</a></li>';
    }

    foreach ($files as $file) {
        $path = $dir . '/' . $file;
        echo '<li class="image"><a href="' . htmlspecialchars($path, ENT_QUOTES | ENT_HTML5) . '" target="_blank">' . htmlspecialchars($file, ENT_QUOTES | ENT_HTML5) . '</a></li>';
    }
    ?>
</ul>
</body>
</html>
