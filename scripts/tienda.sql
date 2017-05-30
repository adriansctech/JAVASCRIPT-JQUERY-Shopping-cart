-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 30, 2016 at 04:46 PM
-- Server version: 5.5.52-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tienda`
--

-- --------------------------------------------------------

--
-- Table structure for table `familia`
--

CREATE TABLE IF NOT EXISTS `familia` (
  `cod` varchar(6) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `familia`
--

INSERT INTO `familia` (`cod`, `nombre`) VALUES
('CAMARA', 'Cámaras digitales'),
('CONSOL', 'Consolas'),
('EBOOK', 'Libros electrónicos'),
('IMPRES', 'Impresoras'),
('MEMFLA', 'Memorias flash'),
('MP3', 'Reproductores MP3'),
('MULTIF', 'Equipos multifunción'),
('NETBOK', 'Netbooks'),
('ORDENA', 'Ordenadores'),
('PORTAT', 'Ordenadores portátiles'),
('ROUTER', 'Routers'),
('SAI', 'Sistemas de alimentación ininterrumpida'),
('SOFTWA', 'Software'),
('TV', 'Televisores'),
('VIDEOC', 'Videocámaras');

-- --------------------------------------------------------

--
-- Table structure for table `ordenador`
--

CREATE TABLE IF NOT EXISTS `ordenador` (
  `cod` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `procesador` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `RAM` int(11) NOT NULL COMMENT 'En GB',
  `disco` varchar(50) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Indicar numero, tecnologi­a y capacidad',
  `grafica` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `unidadoptica` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `SO` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `otros` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `ordenador`
--

INSERT INTO `ordenador` (`cod`, `procesador`, `RAM`, `disco`, `grafica`, `unidadoptica`, `SO`, `otros`) VALUES
('ACERAX3950', 'Intel Core i5-650', 4, '1 disco SATA2 1TB', 'Nvidia GT320 1GB', 'DVD+-R DL 16x', 'Windows 7 Home Premium', NULL),
('PBELLI810323', 'Intel Core i3-550', 4, '1 disco SATA2 640GB', 'Nvidia G210M D3 512MB', 'DVD+-R DL', 'Windows 7 Home Premium', 'Equpo integrado con pantalla táctil 16:9 HD 23"');

-- --------------------------------------------------------

--
-- Table structure for table `producto`
--

CREATE TABLE IF NOT EXISTS `producto` (
  `cod` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nombre_corto` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish_ci,
  `PVP` decimal(10,2) NOT NULL,
  `familia` varchar(6) COLLATE utf8_spanish_ci NOT NULL,
  `imagen` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `stock` int(11) NOT NULL,
  PRIMARY KEY (`cod`),
  UNIQUE KEY `nombre_corto` (`nombre_corto`),
  KEY `familia` (`familia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `producto`
--

INSERT INTO `producto` (`cod`, `nombre`, `nombre_corto`, `descripcion`, `PVP`, `familia`, `imagen`, `stock`) VALUES
('3DSNG', 'Nintendo 3DS negro', 'Nintendo 3DS', 'Consola portátil de Nintendo que permitirá disfrutar de efectos 3D sin necesidad de gafas especiales, e incluirá retrocompatibilidad con el software de DS y de DSi.', 270.00, 'CONSOL', 'img/3DSNG', 1),
('ACERAX3950', 'Acer AX3950 I5-650 4GB 1TB W7HP', 'Acer AX3950', 'Características:\r\n\r\nSistema Operativo : Windows® 7 Home Premium Original\r\n\r\nProcesador / Chipset\r\nNúmero de Ranuras PCI: 1\r\nFabricante de Procesador: Intel\r\nTipo de Procesador: Core i5\r\nModelo de Procesador: i5-650\r\nNúcleo de Procesador: Dual-core\r\nVelocidad de Procesador: 3,20 GHz\r\nCaché: 4 MB\r\nVelocidad de Bus: No aplicable\r\nVelocidad HyperTransport: No aplicable\r\nInterconexión QuickPathNo aplicable\r\nProcesamiento de 64 bits: Sí\r\nHyper-ThreadingSí\r\nFabricante de Chipset: Intel\r\nModelo de Chipset: H57 Express\r\n\r\nMemoria\r\nMemoria Estándar: 4 GB\r\nMemoria Máxima: 8 GB\r\nTecnología de la Memoria: DDR3 SDRAM\r\nEstándar de Memoria: DDR3-1333/PC3-10600\r\nNúmero de Ranuras de Memoria (Total): 4\r\nLector de tarjeta memoria: Sí\r\nSoporte de Tarjeta de Memoria: Tarjeta CompactFlash (CF)\r\nSoporte de Tarjeta de Memoria: MultiMediaCard (MMC)\r\nSoporte de Tarjeta de Memoria: Micro Drive\r\nSoporte de Tarjeta de Memoria: Memory Stick PRO\r\nSoporte de Tarjeta de Memoria: Memory Stick\r\nSoporte de Tarjeta de Memoria: CF+\r\nSoporte de Tarjeta de Memoria: Tarjeta Secure Digital (SD)\r\n\r\nStorage\r\nCapcidad Total del Disco Duro: 1 TB\r\nRPM de Disco Duro: 5400\r\nTipo de Unidad Óptica: Grabadora DVD\r\nCompatibilidad de Dispositivo Óptico: DVD-RAM/±R/±RW\r\nCompatibilidad de Medios de Doble Capa: Sí', 410.00, 'ORDENA', 'img/ACERAX3950', 0),
('ARCLPMP32GBN', 'Archos Clipper MP3 2GB negro', 'Archos Clipper', 'Características:\r\n\r\nAlmacenamiento Interno Disponible en 2 GB*\r\nCompatibilidad Windows o Mac y Linux (con soporte para almacenamiento masivo)\r\nInterfaz para ordenador USB 2.0 de alta velocidad\r\nBattería2 11 horas música\r\nReproducción Música3 MP3\r\nMedidas Dimensiones: 52mm x 27mm x 12mm, Peso: 14 Gr', 26.70, 'MP3', 'img/ARCLPMP32GBN', 0),
('BRAVIA2BX400', 'Sony Bravia 32IN FULLHD KDL-32BX400', 'Sony Bravia', 'Características:\r\n\r\nFull HD: Vea deportes películas y juegos con magníficos detalles en alta resolución gracias a la resolución 1920x1080.\r\n\r\nHDMI®: 4 entradas (3 en la parte posterior, 1 en el lateral)\r\n\r\nUSB Media Player: Disfrute de películas, fotos y música en el televisor.\r\n\r\nSintonizador de TV HD MPEG-4 AVC integrado: olvídese del codificador y acceda a servicios de TV que incluyen canales HD con el sintonizador DVB-T y DVB-C integrado con decodificador MPEG4 AVC (dependiendo del país y sólo con operadores compatibles)\r\n\r\nSensor de luz: ajusta automáticamente el brillo según el nivel de la iluminación ambiental para que pueda disfrutar de una calidad de imagen óptima sin consumo innecesario de energía.\r\n\r\nBRAVIA Sync: controle su sistema de ocio doméstico entero con un mismo mando a distancia universal que le permite reproducir contenidos o ajustar la configuración de los dispositivos compatibles con un solo botón.\r\n\r\nBRAVIA ENGINE 2: experimente colores y detalles de imagen increíblemente nítidos y definidos. \r\n\r\nLive Colour™: seleccione entre cuatro modos: desactivado, bajo, medio y alto, para ajustar el color y obtener imágenes vivas y una calidad óptima. \r\n\r\n24p True Cinema™: reproduzca una auténtica experiencia cinemática y disfrute de películas exactamente como el director las concibió a 24 fotogramas por segundo.', 356.90, 'TV', 'img/BRAVIA2BX400', 0),
('EEEPC1005PXD', 'Asus EEEPC 1005PXD N455 1 250 BL', 'Asus EEEPC', 'Características:\r\nProcesador: 1660 MHz, N455, Intel Atom, 0.5 MB. \r\nMemoria: 1024 MB, 2 GB, DDR3, SO-DIMM, 1 x 1024 MB. \r\nAccionamiento de disco: 2.5 ", 250 GB, 5400 RPM, \r\nSerial ATA, Serial ATA II, 250 GB. \r\nMedios de almacenaje: MMC, SD, SDHC. \r\nExhibición: 10.1 ", 1024 x 600 Pixeles, LCD TFT. \r\nCámara fotográfica: 0.3 MP. \r\nRed: 802.11 b/g/n, 10, 100 Mbit/s, \r\nFast Ethernet. \r\nAudio: HD. \r\nSistema operativo/software: Windows 7 Starter. \r\nColor: Blanco. \r\nContro de energía: 8 MB/s, Litio-Ion, 6 piezas, 2200 mAh, 48 W. \r\nPeso y dimensiones: 1270 g, 178 mm, 262 mm, 25.9 mm, 36.5 mm', 245.40, 'NETBOK', 'img/EEEPC1005PXD', 0),
('HPMIN1103120', 'HP Mini 110-3120 10.1LED N455 1GB 250GB W7S negro', 'HP Mini', 'Características:\r\nSistema operativo instalado \r\nWindows® 7 Starter original 32 bits \r\n\r\nProcesador \r\nProcesador Intel® Atom™ N4551,66 GHz, Cache de nivel 2, 512 KB \r\n\r\nChipset NM10 Intel® + ICH8m \r\n\r\nMemoria \r\nDDR2 de 1 GB (1 x 1024 MB) \r\nMemoria máxima \r\nAdmite un máximo de 2 GB de memoria DDR2 \r\n\r\nRanuras de memoria \r\n1 ranura de memoria accesible de usuario \r\n\r\nUnidades internas \r\nDisco duro SATA de 250 GB (5400 rpm) \r\n\r\nGráficos \r\nTamaño de pantalla (diagonal) \r\nPantalla WSVGA LED HP Antirreflejos de 25,6 cm (10,1") en diagonal \r\n\r\nResolución de la pantalla \r\n1024 x 600 ', 270.00, 'NETBOK', 'img/HPMIN1103120', 0),
('IXUS115HSAZ', 'Canon Ixus 115HS azul', 'Canon Ixus', 'Características:\r\nHS System (12,1 MP) \r\nZoom 4x, 28 mm. IS Óptico \r\nCuerpo metálico estilizado \r\nPantalla LCD PureColor II G de 7,6 cm (3,0") \r\nFull HD. IS Dinámico. HDMI \r\nModo Smart Auto (32 escenas) ', 196.70, 'CAMARA', 'img/IXUS115HSAZ', 0),
('KSTDT101G2', 'Kingston DataTraveler 16GB DT101G2 USB2.0 negro', 'Kingston 16GB', 'Características:\r\nCapacidades — 16GB\r\nDimensiones — 2.19" x 0.68" x 0.36" (55.65mm x 17.3mm x 9.05mm)\r\nTemperatura de Operación — 0° hasta 60° C / 32° hasta 140° F\r\nTemperatura de Almacenamiento — -20° hasta 85° C / -4° hasta 185° F\r\nSimple — Solo debe conectarlo a un puerto USB y está listo para ser utilizado\r\nPractico — Su diseño sin tapa giratorio, protege el conector USB; sin tapa que perder\r\nGarantizado — Cinco años de garantía', 19.20, 'MEMFLA', 'img/KSTDT101G2', 0),
('KSTDTG332GBR', 'Kingston DataTraveler G3 32GB rojo', 'Kingston 32GB', 'Características:\r\n\r\nTipo de producto Unidad flash USB\r\nCapacidad almacenamiento32GB\r\nAnchura 58.3 mm\r\nProfundidad 23.6 mm\r\nAltura 9.0 mm\r\nPeso 12 g\r\nColor incluido RED\r\nTipo de interfaz USB', 40.00, 'MEMFLA', 'img/KSTDTG332GBR', 0),
('KSTMSDHC8GB', 'Kingston MicroSDHC 8GB', 'Kingston 8GB', 'Kingston tarjeta de memoria flash 8 GB microSDHC\r\nÍndice de velocidad    Class 4\r\nCapacidad almacenamiento    8 GB\r\nFactor de forma  MicroSDHC\r\nAdaptador de memoria incluido   Adaptador microSDHC a SD\r\nGarantía del fabricante   Garantía limitada de por vida', 10.20, 'MEMFLA', 'img/KSTMSDHC8GB', 0),
('LEGRIAFS306', 'Canon Legria FS306 plata', 'Canon Legria', 'Características:\r\n\r\nGrabación en tarjeta de memoria SD/SDHC \r\nLa cámara de vídeo digital de Canon más pequeña nunca vista \r\nInstantánea de Vídeo (Video Snapshot) \r\nZoom Avanzado de 41x \r\nGrabación Dual (Dual Shot) \r\nEstabilizador de la Imagen con Modo Dinámico \r\nPre grabación (Pre REC) \r\nSistema 16:9 de alta resolución realmente panorámico \r\nBatería inteligente y Carga Rápida \r\nCompatible con grabador de DVD DW-100 \r\nSISTEMA DE VÍDEO\r\nSoporte de grabación: Tarjeta de memoria extraíble (SD/SDHC)\r\nTiempo máximo de grabación: Variable, dependiendo del tamaño de la tarjeta de memoria.\r\nTarjeta SDHC de 32 GB: 20 horas 50 minutos', 175.00, 'VIDEOC', 'img/LEGRIAFS306', 0),
('LGM237WDP', 'LG TDT HD 23 M237WDP-PC FULL HD', 'LG TDT HD', 'Características:\r\n\r\nGeneral\r\nTamaño (pulgadas): 23\r\nPantalla LCD: Sí\r\nFormato: 16:9\r\nResolución: 1920 x 1080\r\nFull HD: Sí\r\nBrillo (cd/m2): 300\r\nRatio Contraste: 50.000:1\r\nTiempo Respuesta (ms): 5\r\nÁngulo Visión (°): 170\r\nNúmero Colores (Millones): 16.7\r\n\r\nTV\r\nTDT: TDT HD\r\nConexiones\r\nD-Sub: Sí\r\nDVI-D: Sí\r\nHDMI: Sí\r\nEuroconector: Sí\r\nSalida auriculares: Sí\r\nEntrada audio: Sí\r\nUSB Servicio: Sí\r\nRS-232C Servicio: Sí\r\nPCMCIA: Sí\r\nSalida óptico: Sí', 186.00, 'TV', 'img/LGM237WDP', 0),
('LJPROP1102W', 'HP Laserjet Pro Wifi P1102W', 'HP Laserjet', 'Impesora laserjet P1102W es facil de instalar y usar, ademas de que te ayudara a ahorrar energia y recursos. \r\nOlviadte de los cables y disfura de la libertad que te proporcina su tecnologia WIFI, imprime facilmente desdes cualquier de tu oficina. \r\n\r\nFormato máximo aceptado A4 A2 No\r\nA3 NoA4 Si\r\nA5 SiA6 Si\r\nB5 SiB6 Si\r\nSobres C5 (162 x 229 mm) SiSobres C6 (114 x 162 mm) Si', 99.90, 'IMPRES', 'img/LJPROP1102W', 0),
('OPTIOLS1100', 'Pentax Optio LS1100', 'Pentax Optio', 'La LS1100 con funda de transporte y tarjeta de memoria de 2GB incluidas \r\nes la compacta digital que te llevarás a todas partes. \r\nEsta cámara diseñada por Pentax incorpora un sensor CCD de 14,1 megapíxeles y un objetivo gran angular de 28 mm.\r\n', 104.80, 'CAMARA', 'img/OPTIOLS1100', 0),
('PAPYRE62GB', 'Lector ebooks Papyre6 con SD2GB + 500 ebooks', 'Lector Papyre6', 'Marca Papyre \r\nModelo Papyre 6.1 \r\nUso Lector de libros electrónicos \r\nTecnología e-ink (tinta electrónica, Vizplez) \r\nCPU Samsung Am9 200MHz \r\nMemoria - Interna: 512MB \r\n- Externa: SD/SDHC (hasta 32GB) \r\nFormatos PDF, RTF, TXT, DOC, HTML, MP3, CHM, ZIP, FB2, Formatos de imagen \r\nPantalla 6" (600x800px), blanco y negro, 4 niveles de grises ', 205.50, 'EBOOK', 'img/PAPYRE62GB', 0),
('PBELLI810323', 'Packard Bell I8103 23 I3-550 4G 640GB NVIDIAG210', 'Packard I8103', 'Características:\r\n\r\nCPU CHIPSET\r\n\r\nProcesador : Ci3-550\r\nNorthBridge : Intel H57\r\n\r\nMEMORIA\r\nMemoria Rma : Ddr3 4096 MB\r\n\r\nDISPOSITIVOS DE ALMACENAMIENTO\r\nDisco Duro: 640Gb 7200 rpm\r\nÓptico : Slot Load siper multi Dvdrw\r\nLector de Tarjetas: 4 in 1 (XD, SD, HC, MS, MS PRO, MMC)\r\n\r\ndispositivos gráficos\r\nMonitor: 23 fHD\r\nTarjeta Gráfica: Nvidia G210M D3 512Mb\r\nMemoria Máxima: Hasta 1918Mb\r\n\r\nAUDIO\r\nAudio Out: 5.1 Audio Out\r\nAudio In: 1 jack\r\nHeasphone in: 1x jack\r\nAltavoces: Stereo\r\n\r\nACCESORIOS\r\nTeclado: Teclado y ratón inalámbrico\r\nMando a distancia: EMEA Win7 WMC\r\n\r\n\r\nCOMUNICACIONES\r\nWireless: 802.11 b/g/n mini card \r\nTarjeta de Red: 10/100/1000 Mbps\r\nBluetooth: Bluethoot\r\nWebcam: 1Mpixel Hd (1280x720)\r\nTv tuner: mCARD/SW/ DVB-T\r\n\r\nMONITOR\r\nTamaño: 23"\r\ncontraste: 1000:1\r\nTiempo de respuesta: 5MS\r\nResolución: 1920 X 1080\r\n\r\nPUERTOS E/S\r\nUsb 2.0 : 6\r\nMini Pci-e : 2\r\nEsata: 1\r\n\r\nSISTEMA OPERATIVO\r\nO.S: Microsoft Windows 7 Premium', 761.80, 'ORDENA', 'img/no_img.png', 0),
('PIXMAIP4850', 'Canon Pixma IP4850', 'Pixma IP4850', 'Características:\r\n\r\nTipo: chorro de tinta cartuchos independientes\r\nConexión: Hi-Speed USB\r\nPuerto de impresión directa desde camaras\r\nResolución máxima: 9600x2400 ppp\r\nVelocidad impresión: 11 ipm (negro) / 9.3 ipm (color)\r\nTamaño máximo papel: A4\r\nBandeja entrada: 150 hojas\r\nDimensiones: 43.1 cm x 29.7 cm x 15.3 cm', 97.30, 'IMPRES', 'img/no_img.png', 0),
('PIXMAMP252', 'Canon Pixma MP252', 'Pixma MP252', 'Características:\r\n\r\nFunciones: Impresora, Escáner , Copiadora\r\nConexión: USB 2.0\r\nDimensiones:444 x 331 x 155 mm\r\nPeso: 5,8 Kg\r\n\r\nIMPRESORA\r\nResolución máxima: 4800 x 1200 ppp\r\nVelocidad de impresión:\r\nNegro/color: 7,0 ipm / 4,8 ipm\r\nTamaño máximo papel: A4\r\nCARTUCHOS\r\nNegro: PG-510 / PG-512\r\nColor: CL-511 / CL-513\r\n\r\nESCANER\r\nResolución máxima: 600 x 1200 ppp (digital: 19200 x 19200)\r\nProfundidad de color: 48/24 bits\r\nArea máxima de escaneado: A4\r\n\r\nCOPIA\r\nTiempo salida 1ª copia: aprox 39 seg.', 41.60, 'MULTIF', 'img/no_img.png', 0),
('PS3320GB', 'PS3 con disco duro de 320GB', 'PS3 HD 320GB', 'Este Pack Incluye:\r\n- La consola Playstation 3 Slim Negra 320GB\r\n- El juego Killzone 3\r\n', 380.00, 'CONSOL', 'img/no_img.png', 0),
('PWSHTA3100PT', 'Canon Powershot A3100 plata', 'Powershot A3100', 'La cámara PowerShot A3100 IS, inteligente y compacta, presenta la calidad de imagen de Canon en un cuerpo\r\ncompacto y ligero para capturar fotografías sin esfuerzo; es tan fácil como apuntar y disparar.\r\nCaracterísticas:\r\n12,1 MP \r\nZoom óptico 4x con IS \r\nPantalla LCD de 6,7 cm (2,7") ', 101.40, 'CAMARA', 'img/no_img.png', 0),
('SMSGCLX3175', 'Samsung CLX3175', 'Samsung CLX3175', 'Características:\r\n\r\nFunción: Impresión color, copiadora, escáner\r\nImpresión \r\nVelocidad (Mono)Hasta 16 ppm en A4 (17 ppm en Carta)\r\nVelocidad (Color)Hasta 4 ppm en A4 (4 ppm en Carta)\r\nSalida de la Primer Página (Mono)Menos de 14 segundos (Desde el Modo Listo)\r\nResoluciónHasta 2400 x 600 dpi de salida efectiva\r\nSalida de la Primer Página (Color)Menos de 26 segundos (Dese el Modo Listo)\r\nDuplexManual\r\nEmulaciónSPL-C (Lenguaje de color de impresión SAMSUNG)\r\n\r\nCopiado \r\nSalida de la Primer Página (Mono)18 segundos\r\nMulticopiado1 ~ 99\r\nZoom25 ~ 400 %\r\nFunciones de CopiadoCopia ID, Clonar Copia, Copia N-UP, Copiar Poster\r\nResoluciónTexto, Texto / Foto, Modo Revista: hasta 600 x 600 ppp, Modo Foto: Hasta 1200 x 1200 ppp\r\nVelocidad (Mono)Hasta 17 ppm en Carta (16 ppm en A4)\r\nVelocidad (Color)Hasta 4 ppm en Carta (4 ppm en A4 )\r\nSalida de la Primer Página (Color)45 segundos\r\n\r\nEscaneado \r\n\r\nCompatibilidadNorma TWAIN, Norma WIA (Windows2003 / XP / Vista)\r\nMétodoEscáner plano color\r\nResolución (Óptica)1200 x 1200 dpi\r\nResolución (Mejorada)4800 x 4800 dpi\r\nEscaneado a Escanear a USB / Carpeta', 190.00, 'MULTIF', 'img/no_img.png', 0),
('SMSN150101LD', 'Samsung N150 10.1LED N450 1GB 250GB BAT6 BT W7 R', 'Samsung N150', 'Características:\r\n\r\nSistema Operativo Genuine Windows® 7 Starter \r\n\r\nProcesador Intel® ATOM Processor N450 (1.66GHz, 667MHz, 512KB) \r\n\r\nChipset Intel® NM10\r\n\r\nMemoria del Sistema 1GB (DDR2 / 1GB x 1) Ranura de Memoria 1 x SODIMM \r\n\r\nPantalla LCD 10.1" WSVGA (1024 x 600), Non-Gloss, LED Back Light Gráficos \r\n\r\nProcesador Gráfico Intel® GMA 3150 DVMT \r\nMemoria Gráfica Shared Memory (Int. Grahpic) \r\n\r\nMultimedia \r\nSonido HD (High Definition) Audio \r\nCaracterísticas de Sonido SRS 3D Sound Effect \r\nAltavoces 3W Stereo Speakers (1.5W x 2) \r\nCámara Integrada Web Camera \r\n\r\nAlmacenamiento \r\nDisco duro 250GB SATA (5400 rpm S-ATA) \r\n\r\nConectividad\r\nWired Ethernet LAN (RJ45) 10/100 LAN \r\nWireless LAN 802.11 b/g/N\r\n\r\nBluetooth Bluetooth 3.0 High Speed \r\n\r\nI/O Port \r\nVGA \r\nHeadphone-out\r\nMic-in\r\nInternal Mic\r\nUSB (Chargable USB included) 3 x USB 2.0 \r\nMulti Card Slot 4-in-1 (SD, SDHC, SDXC, MMC)\r\nDC-in (Power Port)\r\n\r\nTipo de Teclado 84 keys \r\nTouch Pad, Touch Screen Touch Pad (Scroll Scope, Flat Type) \r\n\r\nSeguridad\r\nRecovery Samsung Recovery Solution \r\nVirus McAfee Virus Scan (trial version) \r\nSeguridad BIOS Boot Up Password / HDD Password \r\nBloqueo Kensington Lock Port \r\n\r\nBatería \r\nAdaptador 40 Watt Batería \r\n6 Cell Dimensiones ', 260.60, 'NETBOK', 'img/no_img.png', 0),
('SMSSMXC200PB', 'Samsung SMX-C200PB EDC ZOOM 10X', 'Samsung SMX-C200PB', 'Características:\r\n\r\nSensor de Imagen Tipo 1 / 6” 800K pixel CCD\r\n\r\nLente Zoom Óptico 10 x optico\r\n\r\nCaracterísticas Grabación Vídeo Estabilizador de Imagen Hiper estabilizador de imagen digital\r\n\r\nInterfaz Tarjeta de Memoria Ranura de Tarjeta SDHC / SD', 127.20, 'VIDEOC', 'img/no_img.png', 0),
('STYLUSSX515W', 'Epson Stylus SX515W', 'Epson Stylus', 'Características:\r\n\r\nResolución máxima5760 x 1440 DPI\r\nVelocidad de la impresión\r\nVelocidad de impresión (negro, calidad normal, A4)36 ppm\r\nVelocidad de impresión (color, calidad normal, A4)36 ppm\r\n\r\nTecnología de la impresión\r\nTecnología de impresión inyección de tinta\r\nNúmero de cartuchos de impresión4 piezas\r\nCabeza de impresoraMicro Piezo\r\n\r\nExploración\r\nResolución máxima de escaneado2400 x 2400 DPI\r\nEscaner color: si\r\nTipo de digitalización Escáner plano\r\nEscanaer integrado: si\r\nTecnología de exploración CIS\r\nWLAN, conexión: si', 77.50, 'MULTIF', 'img/no_img.png', 0),
('TSSD16GBC10J', 'Toshiba SD16GB Class10 Jewel Case', 'Toshiba SD16GB', 'Características:\r\n\r\nDensidad: 16 GB\r\nPINs de conexión: 9 pins\r\nInterfaz: Tarjeta de memoria SD standard compatible\r\nVelocidad de Escritura: 20 MBytes/s* \r\nVelocidad de Lectura: 20 MBytes/s*\r\nDimensiones: 32.0 mm (L) × 24.0 mm (W) × 2.1 mm (H)\r\nPeso: 2g\r\nTemperatura: -25°C a +85°C (Recomendada)\r\nHumedad: 30% to 80% RH (sin condensación)', 32.60, 'MEMFLA', 'img/no_img.png', 0),
('ZENMP48GB300', 'Creative Zen MP4 8GB Style 300', 'Creative Zen MP4', 'Características:\r\n\r\n8 GB de capacidad\r\nAutonomía: 32 horas con archivos MP3 a 128 kbps\r\nPantalla TFT de 1,8 pulgadas y 64.000 colores\r\nFormatos de audio compatibles: MP3, WMA (DRM9), formato Audible 4\r\nFormatos de foto compatibles: JPEG (BMP, TIFF, GIF y PNG\r\nFormatos de vídeo compatibles: AVI transcodificado (Motion JPEG)\r\nEcualizador de 5 bandas con 8 preajustes\r\nMicrófono integrado para grabar voz\r\nAltavoz y radio FM incorporada', 58.90, 'MP3', 'img/no_img.png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `usuario` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `contrasena` varchar(32) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`usuario`, `contrasena`) VALUES
('batoi', '81dc9bdb52d04dc20036dbd8313ed055');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
