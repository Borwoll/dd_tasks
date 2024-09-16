SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `motorcycle_database`
--

-- --------------------------------------------------------

--
-- Структура таблицы `motorcycles`
--

CREATE TABLE `motorcycles` (
  `id` int NOT NULL COMMENT 'ID',
  `name` varchar(255) NOT NULL COMMENT 'The name of the motorcycle',
  `discontinued` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Motorcycle status (discontinued or not)',
  `type_id` int NOT NULL COMMENT 'The ID of the motorcycle type'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `motorcycles`
--

INSERT INTO `motorcycles` (`id`, `name`, `discontinued`, `type_id`) VALUES
(1, 'Yamaha YZF-R1', 0, 1),
(2, 'Honda CBF1000', 1, 1),
(3, 'Harley-Davidson', 0, 2),
(4, 'Suzuki Boulevard', 0, 2),
(5, 'BMW S1000RR', 0, 1),
(6, 'Triumph Tiger 800', 1, 4),
(7, 'Kawasaki VN900', 0, 3),
(8, 'Ducati Multistrada', 0, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `types`
--

CREATE TABLE `types` (
  `id` int NOT NULL COMMENT 'ID',
  `name` varchar(255) NOT NULL COMMENT 'Type name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `types`
--

INSERT INTO `types` (`id`, `name`) VALUES
(1, 'Sport bike'),
(2, 'Cruiser'),
(3, 'Touring'),
(4, 'Adventure');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `motorcycles`
--
ALTER TABLE `motorcycles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk-motorcycles-type_id` (`type_id`);

--
-- Индексы таблицы `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `motorcycles`
--
ALTER TABLE `motorcycles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `types`
--
ALTER TABLE `types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `motorcycles`
--
ALTER TABLE `motorcycles`
  ADD CONSTRAINT `fk-motorcycles-type_id` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
