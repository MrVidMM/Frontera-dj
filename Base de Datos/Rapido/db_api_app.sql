-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-06-2022 a las 21:40:12
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_api_app`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin_interface_theme`
--

CREATE TABLE `admin_interface_theme` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_visible` tinyint(1) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `logo_visible` tinyint(1) NOT NULL,
  `css_header_background_color` varchar(10) NOT NULL,
  `title_color` varchar(10) NOT NULL,
  `css_header_text_color` varchar(10) NOT NULL,
  `css_header_link_color` varchar(10) NOT NULL,
  `css_header_link_hover_color` varchar(10) NOT NULL,
  `css_module_background_color` varchar(10) NOT NULL,
  `css_module_text_color` varchar(10) NOT NULL,
  `css_module_link_color` varchar(10) NOT NULL,
  `css_module_link_hover_color` varchar(10) NOT NULL,
  `css_module_rounded_corners` tinyint(1) NOT NULL,
  `css_generic_link_color` varchar(10) NOT NULL,
  `css_generic_link_hover_color` varchar(10) NOT NULL,
  `css_save_button_background_color` varchar(10) NOT NULL,
  `css_save_button_background_hover_color` varchar(10) NOT NULL,
  `css_save_button_text_color` varchar(10) NOT NULL,
  `css_delete_button_background_color` varchar(10) NOT NULL,
  `css_delete_button_background_hover_color` varchar(10) NOT NULL,
  `css_delete_button_text_color` varchar(10) NOT NULL,
  `list_filter_dropdown` tinyint(1) NOT NULL,
  `related_modal_active` tinyint(1) NOT NULL,
  `related_modal_background_color` varchar(10) NOT NULL,
  `related_modal_rounded_corners` tinyint(1) NOT NULL,
  `logo_color` varchar(10) NOT NULL,
  `recent_actions_visible` tinyint(1) NOT NULL,
  `favicon` varchar(100) NOT NULL,
  `related_modal_background_opacity` varchar(5) NOT NULL,
  `env_name` varchar(50) NOT NULL,
  `env_visible_in_header` tinyint(1) NOT NULL,
  `env_color` varchar(10) NOT NULL,
  `env_visible_in_favicon` tinyint(1) NOT NULL,
  `related_modal_close_button_visible` tinyint(1) NOT NULL,
  `language_chooser_active` tinyint(1) NOT NULL,
  `language_chooser_display` varchar(10) NOT NULL,
  `list_filter_sticky` tinyint(1) NOT NULL,
  `form_pagination_sticky` tinyint(1) NOT NULL,
  `form_submit_sticky` tinyint(1) NOT NULL,
  `css_module_background_selected_color` varchar(10) NOT NULL,
  `css_module_link_selected_color` varchar(10) NOT NULL,
  `logo_max_height` smallint(5) UNSIGNED NOT NULL CHECK (`logo_max_height` >= 0),
  `logo_max_width` smallint(5) UNSIGNED NOT NULL CHECK (`logo_max_width` >= 0),
  `foldable_apps` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `admin_interface_theme`
--

INSERT INTO `admin_interface_theme` (`id`, `name`, `active`, `title`, `title_visible`, `logo`, `logo_visible`, `css_header_background_color`, `title_color`, `css_header_text_color`, `css_header_link_color`, `css_header_link_hover_color`, `css_module_background_color`, `css_module_text_color`, `css_module_link_color`, `css_module_link_hover_color`, `css_module_rounded_corners`, `css_generic_link_color`, `css_generic_link_hover_color`, `css_save_button_background_color`, `css_save_button_background_hover_color`, `css_save_button_text_color`, `css_delete_button_background_color`, `css_delete_button_background_hover_color`, `css_delete_button_text_color`, `list_filter_dropdown`, `related_modal_active`, `related_modal_background_color`, `related_modal_rounded_corners`, `logo_color`, `recent_actions_visible`, `favicon`, `related_modal_background_opacity`, `env_name`, `env_visible_in_header`, `env_color`, `env_visible_in_favicon`, `related_modal_close_button_visible`, `language_chooser_active`, `language_chooser_display`, `list_filter_sticky`, `form_pagination_sticky`, `form_submit_sticky`, `css_module_background_selected_color`, `css_module_link_selected_color`, `logo_max_height`, `logo_max_width`, `foldable_apps`) VALUES
(1, 'Frontera Pet', 1, 'Administración FronteraPet', 1, 'admin-interface/logo/logo-FronteraPet_AU1ezVb.png', 1, '#20ACEE', '#F5DD5D', '#EFFF26', '#FFFFFF', '#C9F0DD', '#0D6AD6', '#FFFFFF', '#FFFFFF', '#C9F0DD', 1, '#0C3C26', '#156641', '#0C4B33', '#0C3C26', '#FFFFFF', '#BA2121', '#A41515', '#FFFFFF', 1, 1, '#000000', 1, '#FFFFFF', 1, 'admin-interface/favicon/patita_zLwdh9X.png', '0.3', 'Principal', 1, '#E74C3C', 1, 1, 1, 'code', 1, 0, 0, '#FFFFCC', '#FFFFFF', 100, 400, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add Theme', 1, 'add_theme'),
(2, 'Can change Theme', 1, 'change_theme'),
(3, 'Can delete Theme', 1, 'delete_theme'),
(4, 'Can view Theme', 1, 'view_theme'),
(5, 'Can add log entry', 2, 'add_logentry'),
(6, 'Can change log entry', 2, 'change_logentry'),
(7, 'Can delete log entry', 2, 'delete_logentry'),
(8, 'Can view log entry', 2, 'view_logentry'),
(9, 'Can add permission', 3, 'add_permission'),
(10, 'Can change permission', 3, 'change_permission'),
(11, 'Can delete permission', 3, 'delete_permission'),
(12, 'Can view permission', 3, 'view_permission'),
(13, 'Can add group', 4, 'add_group'),
(14, 'Can change group', 4, 'change_group'),
(15, 'Can delete group', 4, 'delete_group'),
(16, 'Can view group', 4, 'view_group'),
(17, 'Can add user', 5, 'add_user'),
(18, 'Can change user', 5, 'change_user'),
(19, 'Can delete user', 5, 'delete_user'),
(20, 'Can view user', 5, 'view_user'),
(21, 'Can add content type', 6, 'add_contenttype'),
(22, 'Can change content type', 6, 'change_contenttype'),
(23, 'Can delete content type', 6, 'delete_contenttype'),
(24, 'Can view content type', 6, 'view_contenttype'),
(25, 'Can add session', 7, 'add_session'),
(26, 'Can change session', 7, 'change_session'),
(27, 'Can delete session', 7, 'delete_session'),
(28, 'Can view session', 7, 'view_session'),
(29, 'Can add carrito', 8, 'add_carrito'),
(30, 'Can change carrito', 8, 'change_carrito'),
(31, 'Can delete carrito', 8, 'delete_carrito'),
(32, 'Can view carrito', 8, 'view_carrito'),
(33, 'Can add suscripcion', 9, 'add_suscripcion'),
(34, 'Can change suscripcion', 9, 'change_suscripcion'),
(35, 'Can delete suscripcion', 9, 'delete_suscripcion'),
(36, 'Can view suscripcion', 9, 'view_suscripcion'),
(37, 'Can add tipo producto', 10, 'add_tipoproducto'),
(38, 'Can change tipo producto', 10, 'change_tipoproducto'),
(39, 'Can delete tipo producto', 10, 'delete_tipoproducto'),
(40, 'Can view tipo producto', 10, 'view_tipoproducto'),
(41, 'Can add producto', 11, 'add_producto'),
(42, 'Can change producto', 11, 'change_producto'),
(43, 'Can delete producto', 11, 'delete_producto'),
(44, 'Can view producto', 11, 'view_producto'),
(45, 'Can add historial', 12, 'add_historial'),
(46, 'Can change historial', 12, 'change_historial'),
(47, 'Can delete historial', 12, 'delete_historial'),
(48, 'Can view historial', 12, 'view_historial'),
(49, 'Can add estado seguimiento', 13, 'add_estadoseguimiento'),
(50, 'Can change estado seguimiento', 13, 'change_estadoseguimiento'),
(51, 'Can delete estado seguimiento', 13, 'delete_estadoseguimiento'),
(52, 'Can view estado seguimiento', 13, 'view_estadoseguimiento'),
(53, 'Can add seguimiento', 14, 'add_seguimiento'),
(54, 'Can change seguimiento', 14, 'change_seguimiento'),
(55, 'Can delete seguimiento', 14, 'delete_seguimiento'),
(56, 'Can view seguimiento', 14, 'view_seguimiento');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$320000$peUHMQWBndpOuR2EGvbAx8$17/q5tC72pHIrmLqInFXoNIx2GYQ+bjrZUmaC+YjSRg=', '2022-06-27 19:28:40.422570', 1, 'admin', '', '', 'admin@admin.cl', 1, 1, '2022-06-24 19:08:38.732339');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `db_carrito`
--

CREATE TABLE `db_carrito` (
  `id` bigint(20) NOT NULL,
  `codigo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `db_estadoseguimiento`
--

CREATE TABLE `db_estadoseguimiento` (
  `id` bigint(20) NOT NULL,
  `codigo_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `db_historial`
--

CREATE TABLE `db_historial` (
  `id` bigint(20) NOT NULL,
  `codigo_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `db_producto`
--

CREATE TABLE `db_producto` (
  `codigo` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `marca` varchar(60) NOT NULL,
  `precio` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `created_at` date NOT NULL,
  `update_at` date NOT NULL,
  `tipo_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `db_producto`
--

INSERT INTO `db_producto` (`codigo`, `nombre`, `marca`, `precio`, `stock`, `imagen`, `created_at`, `update_at`, `tipo_id`) VALUES
(22, 'Transportador', 'MariKa', 80990, 74, 'productos/stock-transp-2_mdAUG3G.jpg', '2022-06-27', '2022-06-27', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `db_seguiento`
--

CREATE TABLE `db_seguiento` (
  `id` bigint(20) NOT NULL,
  `codigo_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `db_suscripcion`
--

CREATE TABLE `db_suscripcion` (
  `usuario_sus` int(11) NOT NULL,
  `estado_sus` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `db_tipo_producto`
--

CREATE TABLE `db_tipo_producto` (
  `id` bigint(20) NOT NULL,
  `tipo` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `db_tipo_producto`
--

INSERT INTO `db_tipo_producto` (`id`, `tipo`) VALUES
(1, 'Juguete'),
(2, 'Accesorio'),
(3, 'Útil'),
(4, 'Ropa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-06-24 19:09:36.245643', '1', 'algodd', 1, '[{\"added\": {}}]', 10, 1),
(2, '2022-06-25 01:22:29.208818', '1', 'Juguete', 2, '[{\"changed\": {\"fields\": [\"Tipo\"]}}]', 10, 1),
(3, '2022-06-25 01:22:33.627104', '2', 'Accesorio', 1, '[{\"added\": {}}]', 10, 1),
(4, '2022-06-25 01:22:40.083145', '3', 'Útil', 1, '[{\"added\": {}}]', 10, 1),
(5, '2022-06-25 01:22:43.413978', '4', 'Ropa', 1, '[{\"added\": {}}]', 10, 1),
(6, '2022-06-25 01:27:05.214907', '1', 'Frontera Pet', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Name\", \"Logo\", \"Favicon\", \"Title\"]}}]', 1, 1),
(7, '2022-06-25 01:27:22.512084', '1', 'Frontera Pet', 2, '[{\"changed\": {\"fields\": [\"Background color\"]}}]', 1, 1),
(8, '2022-06-25 01:27:37.372845', '1', 'Frontera Pet', 2, '[{\"changed\": {\"fields\": [\"Background color\"]}}]', 1, 1),
(9, '2022-06-25 01:27:52.132055', '1', 'Frontera Pet', 2, '[{\"changed\": {\"fields\": [\"Text color\"]}}]', 1, 1),
(10, '2022-06-25 01:28:05.273771', '1', 'Frontera Pet', 2, '[]', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(2, 'admin', 'logentry'),
(1, 'admin_interface', 'theme'),
(8, 'app', 'carrito'),
(13, 'app', 'estadoseguimiento'),
(12, 'app', 'historial'),
(11, 'app', 'producto'),
(14, 'app', 'seguimiento'),
(9, 'app', 'suscripcion'),
(10, 'app', 'tipoproducto'),
(4, 'auth', 'group'),
(3, 'auth', 'permission'),
(5, 'auth', 'user'),
(6, 'contenttypes', 'contenttype'),
(7, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-06-24 19:08:11.544455'),
(2, 'auth', '0001_initial', '2022-06-24 19:08:11.938402'),
(3, 'admin', '0001_initial', '2022-06-24 19:08:12.071047'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-06-24 19:08:12.083016'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-06-24 19:08:12.123906'),
(6, 'admin_interface', '0001_initial', '2022-06-24 19:08:12.142855'),
(7, 'admin_interface', '0002_add_related_modal', '2022-06-24 19:08:12.228626'),
(8, 'admin_interface', '0003_add_logo_color', '2022-06-24 19:08:12.269517'),
(9, 'admin_interface', '0004_rename_title_color', '2022-06-24 19:08:12.282869'),
(10, 'admin_interface', '0005_add_recent_actions_visible', '2022-06-24 19:08:12.302815'),
(11, 'admin_interface', '0006_bytes_to_str', '2022-06-24 19:08:12.379609'),
(12, 'admin_interface', '0007_add_favicon', '2022-06-24 19:08:12.402548'),
(13, 'admin_interface', '0008_change_related_modal_background_opacity_type', '2022-06-24 19:08:12.438975'),
(14, 'admin_interface', '0009_add_enviroment', '2022-06-24 19:08:12.525743'),
(15, 'admin_interface', '0010_add_localization', '2022-06-24 19:08:12.551674'),
(16, 'admin_interface', '0011_add_environment_options', '2022-06-24 19:08:12.607890'),
(17, 'admin_interface', '0012_update_verbose_names', '2022-06-24 19:08:12.618859'),
(18, 'admin_interface', '0013_add_related_modal_close_button', '2022-06-24 19:08:12.641803'),
(19, 'admin_interface', '0014_name_unique', '2022-06-24 19:08:12.660750'),
(20, 'admin_interface', '0015_add_language_chooser_active', '2022-06-24 19:08:12.686682'),
(21, 'admin_interface', '0016_add_language_chooser_display', '2022-06-24 19:08:12.710618'),
(22, 'admin_interface', '0017_change_list_filter_dropdown', '2022-06-24 19:08:12.718597'),
(23, 'admin_interface', '0018_theme_list_filter_sticky', '2022-06-24 19:08:12.741535'),
(24, 'admin_interface', '0019_add_form_sticky', '2022-06-24 19:08:12.776721'),
(25, 'admin_interface', '0020_module_selected_colors', '2022-06-24 19:08:12.819946'),
(26, 'admin_interface', '0021_file_extension_validator', '2022-06-24 19:08:12.829920'),
(27, 'admin_interface', '0022_add_logo_max_width_and_height', '2022-06-24 19:08:12.898735'),
(28, 'admin_interface', '0023_theme_foldable_apps', '2022-06-24 19:08:12.918681'),
(29, 'admin_interface', '0024_remove_theme_css', '2022-06-24 19:08:12.932645'),
(30, 'app', '0001_initial', '2022-06-24 19:08:13.087416'),
(31, 'contenttypes', '0002_remove_content_type_name', '2022-06-24 19:08:13.154943'),
(32, 'auth', '0002_alter_permission_name_max_length', '2022-06-24 19:08:13.201296'),
(33, 'auth', '0003_alter_user_email_max_length', '2022-06-24 19:08:13.221470'),
(34, 'auth', '0004_alter_user_username_opts', '2022-06-24 19:08:13.235433'),
(35, 'auth', '0005_alter_user_last_login_null', '2022-06-24 19:08:13.271336'),
(36, 'auth', '0006_require_contenttypes_0002', '2022-06-24 19:08:13.277320'),
(37, 'auth', '0007_alter_validators_add_error_messages', '2022-06-24 19:08:13.290286'),
(38, 'auth', '0008_alter_user_username_max_length', '2022-06-24 19:08:13.315220'),
(39, 'auth', '0009_alter_user_last_name_max_length', '2022-06-24 19:08:13.334183'),
(40, 'auth', '0010_alter_group_name_max_length', '2022-06-24 19:08:13.355113'),
(41, 'auth', '0011_update_proxy_permissions', '2022-06-24 19:08:13.401988'),
(42, 'auth', '0012_alter_user_first_name_max_length', '2022-06-24 19:08:13.422931'),
(43, 'sessions', '0001_initial', '2022-06-24 19:08:13.448862'),
(44, 'app', '0002_seguimiento_estadoseguimiento', '2022-06-27 06:43:48.927361');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('33ejjwkb3yfzpoamv3g6sw7d50fxwxnq', '.eJxVjEEOwiAQRe_C2pChlE5x6d4zkGFgpGpoUtqV8e7apAvd_vfef6lA21rC1vISpqTOyqjT7xaJH7nuIN2p3mbNc12XKepd0Qdt-jqn_Lwc7t9BoVa-9dAlQYiSAT1Zgx17FMeWbE9MntAgeInAlkFk9M5xGqPlXgiEB1HvD_NjOMM:1o5uPY:aF9J0y1qJxMn37yg5LVfcdO_Gl-EIgNotB1ItZ4aybw', '2022-07-11 19:28:40.424564'),
('7ravioug5w733nt7sxt2so5uf8whslwq', '.eJxVjEEOwiAQRe_C2pChlE5x6d4zkGFgpGpoUtqV8e7apAvd_vfef6lA21rC1vISpqTOyqjT7xaJH7nuIN2p3mbNc12XKepd0Qdt-jqn_Lwc7t9BoVa-9dAlQYiSAT1Zgx17FMeWbE9MntAgeInAlkFk9M5xGqPlXgiEB1HvD_NjOMM:1o5aSw:oO9hJVgLZLmmhbLGRG8PfGr2utAenWjfOsNXxGSJrrc', '2022-07-10 22:10:50.742920'),
('8iyv6pju1iq09si7jx5ztg1uxjr10sxw', '.eJxVjEEOwiAQRe_C2pChlE5x6d4zkGFgpGpoUtqV8e7apAvd_vfef6lA21rC1vISpqTOyqjT7xaJH7nuIN2p3mbNc12XKepd0Qdt-jqn_Lwc7t9BoVa-9dAlQYiSAT1Zgx17FMeWbE9MntAgeInAlkFk9M5xGqPlXgiEB1HvD_NjOMM:1o5cym:XlIgoWvDfmkQytkHWiUg3-Wi7OJl772qzj17_HpHdTg', '2022-07-11 00:51:52.102486'),
('frspchqhyb5p7u1p17a2mt5g833n4ea7', '.eJxVjEEOwiAQRe_C2pChlE5x6d4zkGFgpGpoUtqV8e7apAvd_vfef6lA21rC1vISpqTOyqjT7xaJH7nuIN2p3mbNc12XKepd0Qdt-jqn_Lwc7t9BoVa-9dAlQYiSAT1Zgx17FMeWbE9MntAgeInAlkFk9M5xGqPlXgiEB1HvD_NjOMM:1o5ZJB:rznvkq8hRgjiW5xbjqvGWtT2LRFmbJSwDuDZD4iuPGk', '2022-07-10 20:56:41.354659'),
('l60n5isyw4egi1uw1q1k46o3rqlqu6uc', '.eJxVjEEOwiAQRe_C2pChlE5x6d4zkGFgpGpoUtqV8e7apAvd_vfef6lA21rC1vISpqTOyqjT7xaJH7nuIN2p3mbNc12XKepd0Qdt-jqn_Lwc7t9BoVa-9dAlQYiSAT1Zgx17FMeWbE9MntAgeInAlkFk9M5xGqPlXgiEB1HvD_NjOMM:1o5flX:onPYKlSOBciYf_dNuKJiRmO_AZyOD5XpGRKL27XoWdI', '2022-07-11 03:50:23.703220'),
('qkb824s5muz9sohq74ti4kknyyy5o04y', '.eJxVjEEOwiAQRe_C2pChlE5x6d4zkGFgpGpoUtqV8e7apAvd_vfef6lA21rC1vISpqTOyqjT7xaJH7nuIN2p3mbNc12XKepd0Qdt-jqn_Lwc7t9BoVa-9dAlQYiSAT1Zgx17FMeWbE9MntAgeInAlkFk9M5xGqPlXgiEB1HvD_NjOMM:1o4ofr:akNNqi8XKjxmsY6foLyXosnBCh7EGhEA-bmCpU59ma4', '2022-07-08 19:08:59.818431'),
('wr0hyfai4nqcgoxcywhy6bz25jhu0180', '.eJxVjEEOwiAQRe_C2pChlE5x6d4zkGFgpGpoUtqV8e7apAvd_vfef6lA21rC1vISpqTOyqjT7xaJH7nuIN2p3mbNc12XKepd0Qdt-jqn_Lwc7t9BoVa-9dAlQYiSAT1Zgx17FMeWbE9MntAgeInAlkFk9M5xGqPlXgiEB1HvD_NjOMM:1o4syc:ckBnNxPgrffaOxY58Jb4s4KOw-lLlfj0TD2tm4mFUuA', '2022-07-08 23:44:38.681486'),
('ylcyozaij50u93sifzdmh3xmx3wir1p9', '.eJxVjEEOwiAQRe_C2pChlE5x6d4zkGFgpGpoUtqV8e7apAvd_vfef6lA21rC1vISpqTOyqjT7xaJH7nuIN2p3mbNc12XKepd0Qdt-jqn_Lwc7t9BoVa-9dAlQYiSAT1Zgx17FMeWbE9MntAgeInAlkFk9M5xGqPlXgiEB1HvD_NjOMM:1o4ufH:FCy16AhRGuRPYiKqhMgyayyWJIas3Ox8jgv6X0WaMQ0', '2022-07-09 01:32:47.234455'),
('yu189q0vfz3ab1ta9bhf8q2kkxi9dawf', '.eJxVjEEOwiAQRe_C2pChlE5x6d4zkGFgpGpoUtqV8e7apAvd_vfef6lA21rC1vISpqTOyqjT7xaJH7nuIN2p3mbNc12XKepd0Qdt-jqn_Lwc7t9BoVa-9dAlQYiSAT1Zgx17FMeWbE9MntAgeInAlkFk9M5xGqPlXgiEB1HvD_NjOMM:1o5akW:PMHh1HdwV-fq26O27OjYxUgJRdydqeEnpapILqhawFw', '2022-07-10 22:29:00.012637'),
('zgzalspijj25tp5bdw23r1wdjxgosz7s', '.eJxVjEEOwiAQRe_C2pChlE5x6d4zkGFgpGpoUtqV8e7apAvd_vfef6lA21rC1vISpqTOyqjT7xaJH7nuIN2p3mbNc12XKepd0Qdt-jqn_Lwc7t9BoVa-9dAlQYiSAT1Zgx17FMeWbE9MntAgeInAlkFk9M5xGqPlXgiEB1HvD_NjOMM:1o5Z5o:R4g9mroPdbAKcFf5CKD0Kp3cDWbXlfTunUZtDgfhqZ8', '2022-07-10 20:42:52.049834');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin_interface_theme`
--
ALTER TABLE `admin_interface_theme`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_interface_theme_name_30bda70f_uniq` (`name`);

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `db_carrito`
--
ALTER TABLE `db_carrito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `db_Carrito_codigo_id_83de8a89_fk_db_Producto_codigo` (`codigo_id`);

--
-- Indices de la tabla `db_estadoseguimiento`
--
ALTER TABLE `db_estadoseguimiento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `db_EstadoSeguimiento_codigo_id_d429f0fc_fk_db_Seguiento_id` (`codigo_id`);

--
-- Indices de la tabla `db_historial`
--
ALTER TABLE `db_historial`
  ADD PRIMARY KEY (`id`),
  ADD KEY `db_Historial_codigo_id_5f9ddea8_fk_db_Carrito_id` (`codigo_id`);

--
-- Indices de la tabla `db_producto`
--
ALTER TABLE `db_producto`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `db_Producto_tipo_id_6236bbd4_fk_db_tipo_Producto_id` (`tipo_id`);

--
-- Indices de la tabla `db_seguiento`
--
ALTER TABLE `db_seguiento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `db_Seguiento_codigo_id_3742bf79_fk_db_Carrito_id` (`codigo_id`);

--
-- Indices de la tabla `db_suscripcion`
--
ALTER TABLE `db_suscripcion`
  ADD PRIMARY KEY (`usuario_sus`);

--
-- Indices de la tabla `db_tipo_producto`
--
ALTER TABLE `db_tipo_producto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin_interface_theme`
--
ALTER TABLE `admin_interface_theme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `db_carrito`
--
ALTER TABLE `db_carrito`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `db_estadoseguimiento`
--
ALTER TABLE `db_estadoseguimiento`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `db_historial`
--
ALTER TABLE `db_historial`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `db_seguiento`
--
ALTER TABLE `db_seguiento`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `db_tipo_producto`
--
ALTER TABLE `db_tipo_producto`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `db_carrito`
--
ALTER TABLE `db_carrito`
  ADD CONSTRAINT `db_Carrito_codigo_id_83de8a89_fk_db_Producto_codigo` FOREIGN KEY (`codigo_id`) REFERENCES `db_producto` (`codigo`);

--
-- Filtros para la tabla `db_estadoseguimiento`
--
ALTER TABLE `db_estadoseguimiento`
  ADD CONSTRAINT `db_EstadoSeguimiento_codigo_id_d429f0fc_fk_db_Seguiento_id` FOREIGN KEY (`codigo_id`) REFERENCES `db_seguiento` (`id`);

--
-- Filtros para la tabla `db_historial`
--
ALTER TABLE `db_historial`
  ADD CONSTRAINT `db_Historial_codigo_id_5f9ddea8_fk_db_Carrito_id` FOREIGN KEY (`codigo_id`) REFERENCES `db_carrito` (`id`);

--
-- Filtros para la tabla `db_producto`
--
ALTER TABLE `db_producto`
  ADD CONSTRAINT `db_Producto_tipo_id_6236bbd4_fk_db_tipo_Producto_id` FOREIGN KEY (`tipo_id`) REFERENCES `db_tipo_producto` (`id`);

--
-- Filtros para la tabla `db_seguiento`
--
ALTER TABLE `db_seguiento`
  ADD CONSTRAINT `db_Seguiento_codigo_id_3742bf79_fk_db_Carrito_id` FOREIGN KEY (`codigo_id`) REFERENCES `db_carrito` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
